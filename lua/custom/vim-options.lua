vim.cmd "set tabstop=4"
vim.cmd "set softtabstop=4"
vim.cmd "set shiftwidth=4"
vim.cmd "set noexpandtab"
vim.cmd "set number"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- clipboard
opt.clipboard:append "unnamedplus"

-- turn off swapfile
opt.swapfile = false
