vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- color theme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  require("rose-pine").setup()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -- status line
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }

  }

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use( 'mbbill/undotree')
  use( 'tpope/vim-fugitive')

  -- debugger
  use ('mfussenegger/nvim-dap')
  use ( "rcarriga/nvim-dap-ui" )
  use ( "theHamsta/nvim-dap-virtual-text" )
  use ( 'nvim-telescope/telescope-dap.nvim' )
  use ( 'mortepau/codicons.nvim' )

  -- use ( 'natecraddock / workspaces.nvim' )

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- lsp
  use ( 'neovim/nvim-lspconfig' )
  use ( 'williamboman/mason.nvim' )
  use ( 'williamboman/mason-lspconfig.nvim' )

  -- auto completion for lsp
  use( 'hrsh7th/cmp-nvim-lsp' )
  use( 'hrsh7th/cmp-buffer' )
  use( 'hrsh7th/cmp-path' )
  use( 'hrsh7th/cmp-cmdline' )
  use( 'hrsh7th/nvim-cmp' )

  -- tabs
  use {
	  'akinsho/bufferline.nvim',
	  tag = 'v3.*'
  }

  -- Spell Check. It looks like it does not work. Todo: fix
  use ('rhysd/vim-grammarous')

  use ('tpope/vim-commentary')
  use ('preservim/nerdtree')

  -- cmake
  use ('Shatur/neovim-tasks')
  use ('skywind3000/asyncrun.vim')


end)
