local fn = vim.fn

-- install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })

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

  -- Plugins summary
  -- 1. Language's support
  -- 2. Completion
  -- 3. Testing
  -- 4. Filetree
  -- 5. Telescope
  -- 6. Git
  -- 7. Statusline
  -- 8. COLORSCHEMES
  -- 9. Helpers

  -- 1. Language's support
  -- lsp config
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use 'jose-elias-alvarez/null-ls.nvim'
  use "b0o/schemastore.nvim"
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  -- prettify lsp informations
  use 'folke/trouble.nvim'
  -- colors for trouble
  use 'folke/lsp-colors.nvim'
  use 'tami5/lspsaga.nvim'

  use 'towolf/vim-helm'

  -- 2. Completion
  -- cmp - autocompletions
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- snippets
  use "rafamadriz/friendly-snippets"
  -- Debbuger
  use { 'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
    }
  }
  -- show code signature
  use 'stevearc/aerial.nvim'
  -- Treesitter for syntax highlight
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- 3. Testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    }
  }

  -- 4. Filetree
  --   Nvim-Tree - file explorer
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

  -- 5. Telescope
  -- nvim telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- 6. Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- 7. Statusline
  -- this bar at the bottom of a window
  use 'nvim-lualine/lualine.nvim'

  -- 8. COLORSCHEMES
  use 'morhetz/gruvbox'
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "joshdick/onedark.vim"
  use 'EdenEast/nightfox.nvim'

  -- 9. Helpers
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }
  --statrup
  --
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  -- use {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   config = function()
  --     require('dashboard')

  --   end,
  --   requires = {'nvim-tree/nvim-web-devicons'}
  -- }

  -- Terminal
  use 'akinsho/toggleterm.nvim'
  -- surrounding
  use 'tpope/vim-surround'
  -- show letters for F and T
  use 'unblevable/quick-scope'
  -- indient line
  use 'Yggdroot/indentLine'
  -- hard time with VIM
  use 'takac/vim-hardtime'
  -- autopairs
  use "windwp/nvim-autopairs"
  -- autocomments
  use 'tpope/vim-commentary'
  -- session
  use({
    "olimorris/persisted.nvim",
    --module = "persisted", -- For lazy loading
    config = function()
      require("persisted").setup()
      require("telescope").load_extension("persisted") -- To load the telescope extension
    end,
  })

  use 'ggandor/leap.nvim'

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
