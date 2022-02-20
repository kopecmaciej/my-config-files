set guicursor=
set nu
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set hidden
set noerrorbells
set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set signcolumn=yes
set termguicolors

call plug#begin('~/.vim/plugged')

" Base vim plugin
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'neovim/nvim-lspconfig'

" Nvim lua
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'vim-syntastic/syntastic'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Nvim file tree
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'Xuyuanp/nerdtree-git-plugin'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" tmux
Plug 'christoomey/vim-tmux-navigator'

" colorscheme
Plug 'gruvbox-community/gruvbox'
" Dracula
Plug 'Mofiqul/dracula.nvim'
" vsCode
Plug 'tomasiser/vim-code-dark'

Plug 'nvim-lualine/lualine.nvim'

Plug 'akinsho/bufferline.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'voldikss/vim-floaterm'

Plug 'mhinz/vim-startify'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" remove after gaining some skills in vim;
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Foat terminal shortkeys
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" NERDTree 
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

lua << END
require('lualine').setup()
END

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

let g:nvcode_termcolors=256

syntax on

colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" nvim-telescope/telescope.nvim {{{
lua << EOF
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "yarn.lock", "node_module" }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
  },
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
        }
      }
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        }
      }
    }
  }
}
EOF

" BUFFERLINE
lua << EOF
require("bufferline").setup{}
EOF
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent><C-DELETE> :bdelete<CR>
"}}}

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-emmet',
  \ 'coc-json', 
  \ ]
set hidden
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Move 1 more lines up or down in normal and visual selection modes.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
