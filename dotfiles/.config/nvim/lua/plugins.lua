local fn = vim.fn

-- install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })

end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- for packer automanagement
  use "wbthomason/packer.nvim"

  -- ESENTIALS:

  -- nvim telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- lsp config
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim'
  use "b0o/schemastore.nvim"
  -- prettify lsp informations
  use 'folke/trouble.nvim'
  -- colors for trouble
  use 'folke/lsp-colors.nvim'
  use 'tami5/lspsaga.nvim'
  -- cmp - autocompletions
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  --    Nvim-Tree - file explorer
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Treesitter for syntax highlight
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use { 'akinsho/bufferline.nvim', tag = "v2.*" }

  -- UTILS:
  -- surrounding
  use 'tpope/vim-surround'

  -- something i will figure out
  use 'unblevable/quick-scope'

  -- indient line
  use 'Yggdroot/indentLine'

  -- hard time with VIM
  use 'takac/vim-hardtime'

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- autopairs
  use "windwp/nvim-autopairs"

  -- autocomments
  use 'tpope/vim-commentary'
  -- git helper
  use 'tpope/vim-fugitive'

  -- tmux navigator - allows to nagivate between panes inside vim and tmux
  use "christoomey/vim-tmux-navigator"

  -- this bar at the bottom of a window
  use 'nvim-lualine/lualine.nvim'

  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- COLORSCHEMES
  use 'morhetz/gruvbox'
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "joshdick/onedark.vim"
  use 'EdenEast/nightfox.nvim'

  -- markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
