local keymap = vim.keymap.set

local opt = { noremap = true, silent = true }
keymap("n", "<leader>q", "<cmd>bd<cr>", opt)



keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)

keymap("n", "zz", "za", opt)


for i = 1, 9, 1 do
	keymap("n", "<leader>"..i, i.."gt<CR>", opt)
end

  vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
  vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
  vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
  vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)
-- keymap({"n","i","v"},"<C-j>","<Down>",opt)
-- keymap({"n","i","v"},"<C-k>","<Up>",opt)
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
