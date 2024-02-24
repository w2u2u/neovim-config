vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 5

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>") -- Exit insert mode
vim.keymap.set("n", "<ESC>", ":noh<CR>") -- Clear search highlights
vim.keymap.set("n", "<C-Tab>", "<C-w>w") -- Switch between windows
