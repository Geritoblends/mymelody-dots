-- init.lua

-- Set up basic options
vim.g.mapleader = " "
vim.o.number = true          -- Show line numbers
vim.o.relativenumber = true  -- Relative line numbers
vim.o.tabstop = 4            -- Set tab width to 4 spaces
vim.o.shiftwidth = 4         -- Set shift width to 4 spaces
vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.hlsearch = true        -- Highlight search results
vim.o.incsearch = true       -- Incremental search

-- Plugin manager setup (Lazy.nvim)
-- Install Lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/site/pack/packer/start/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins using Lazy.nvim
require("lazy").setup({
  -- Plugins go here
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {}
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
    end,
  }, 
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "neovim/nvim-lspconfig"
  },

{
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- You can configure nvim-tree here
      require("nvim-tree").setup {}

      -- Keybinding to toggle NvimTree
      vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
    keys = { "<leader>e" }
},
  {
    "EdenEast/nightfox.nvim"
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
    require'luasnip.loaders.from_vscode'.lazy_load()
    end,
  },
})

vim.opt.clipboard = "unnamedplus"
vim.o.laststatus = 0

-- Set up colorscheme

vim.cmd([[
  colorscheme carbonfox  " Or whatever base you like

  " Define main dark pink
  let s:pink = '#d16d9e'
  let s:bg = 'NONE'

  " Set core UI
  highlight Normal guifg=s:pink guibg=s:bg
  highlight NormalNC guifg=s:pink guibg=s:bg
  highlight VertSplit guifg=s:pink guibg=s:bg
  highlight NormalFloat guifg=s:pink guibg=s:bg
  highlight StatusLine guifg=s:pink guibg=s:bg
  highlight StatusLineNC guifg=s:pink guibg=s:bg
  highlight TabLine guifg=s:pink guibg=s:bg
  highlight TabLineFill guifg=s:pink guibg=s:bg
  highlight WinBar guifg=s:pink guibg=s:bg
  highlight LineNr guifg=#c06090 guibg=s:bg
  highlight CursorLineNr guifg=#ff96c5 guibg=s:bg

  " Syntax groups
  highlight Comment guifg=#b85f8f guibg=s:bg
  highlight Keyword guifg=s:pink guibg=s:bg
  highlight String guifg=#f9b1d5 guibg=s:bg
  highlight Function guifg=#ffa3cc guibg=s:bg
  highlight Identifier guifg=s:pink guibg=s:bg
  highlight Type guifg=#ff85b3 guibg=s:bg
  highlight Statement guifg=s:pink guibg=s:bg
  highlight PreProc guifg=#ffaad5 guibg=s:bg
  highlight Constant guifg=#ffc0cb guibg=s:bg
  highlight Special guifg=#ff8abf guibg=s:bg
  highlight Error guifg=#ffffff guibg=#ff4f80
  highlight Todo guifg=#ffaad5 guibg=NONE gui=italic
  highlight Visual guibg=#442233
  highlight Pmenu guibg=#1a0e14 guifg=s:pink
  highlight PmenuSel guibg=#ffb3d9 guifg=#1a0e14

  " Diagnostics
  highlight DiagnosticError guifg=#ff4f80 guibg=s:bg
  highlight DiagnosticWarn guifg=#ffc0cb guibg=s:bg
  highlight DiagnosticInfo guifg=#d16d9e guibg=s:bg
  highlight DiagnosticHint guifg=#e0a3bf guibg=s:bg
]])
require("mason").setup()

