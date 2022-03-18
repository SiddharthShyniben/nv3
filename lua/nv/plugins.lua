local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-surround'
	use 'numToStr/Comment.nvim'
	use 'ludovicchabant/vim-gutentags'

	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
	use {'folke/tokyonight.nvim', config = function()
		vim.g.tokyonight_style = "night"
		vim.cmd[[colorscheme tokyonight]]
	end}
	use 'nvim-lualine/lualine.nvim'

	use 'lukas-reineke/indent-blankline.nvim'

	use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-refactor'
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'

	use 'github/copilot.vim'
	use {
		'glacambre/firenvim',
		run = function() vim.fn['firenvim#install'](0) end
	}

	use 'vim-denops/denops.vim'
	use "numToStr/FTerm.nvim"
	use "llathasa-veleth/vim-brainfuck"
end)
