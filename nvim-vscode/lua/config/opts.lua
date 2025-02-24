-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.numberwidth = 2
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- no fold to be applied when open a file
vim.opt.foldlevel = 99
vim.o.showtabline = 2
