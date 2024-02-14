-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- Enable smartindenting
vim.opt.breakindent = true

-- Split the human way
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable wrapping
vim.opt.wrap = false

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase and smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime
vim.opt.updatetime = 50

-- Set completeopt to have a better completion
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable access to system clipboard
vim.opt.clipboard = "unnamedplus"

-- 8 Lines above/before cursor while scolling
vim.opt.scrolloff = 8

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Enable column line
vim.opt.colorcolumn = "120"

-- Enable the sign column to prevent screen fliping
vim.opt.signcolumn = "yes"

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

