local vscode = require("vscode-neovim")
vim.keymap.set("n", "<leader>w", "<Cmd>lua require('vscode-neovim').call('workbench.action.files.save')<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>lua require('vscode-neovim').call('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set("n", "<leader>p", "<Cmd>lua require('vscode-neovim').call('editor.action.formatDocument')<CR>")
vim.keymap.set("n", "<leader>cr", "<Cmd>lua require('vscode-neovim').call('cph.runTestCases')<CR>")
vim.keymap.set("n", "<leader>t", "<Cmd>lua require('vscode-neovim').call('workbench.view.explorer')<CR>")
vim.keymap.set(
	"n",
	"<leader>b",
	"<Cmd>lua require('vscode-neovim').call('workbench.action.toggleSidebarVisibility')<CR>"
)
vim.keymap.set("n", "<leader>]", "<Cmd>lua require('vscode-neovim').call('workbench.action.nextEditor')<CR>")
vim.keymap.set("n", "<leader>[", "<Cmd>lua require('vscode-neovim').call('workbench.action.previousEditor)<CR>")
vim.keymap.set("n","z","<Cmd>lua require('vscode-neovim').call('editor.toggleFold')<CR>")
