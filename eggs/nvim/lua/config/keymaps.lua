local keymap = vim.keymap.set

local bufferline = require("bufferline")
local opt = { noremap = true, silent = true }
local function close_buffer()
  -- 1. 找到 NeoTree 的窗口
    local buf_num = #vim.fn.getbufinfo({buflisted=1})
    if buf_num > 1 then
        vim.cmd('bd')
    else
        vim.cmd("q")
    end

end
keymap("n", "<leader>q", function()
    close_buffer()
end, opt)

keymap("n", "<leader>D", ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })
keymap("n", "<leader>o", ":Lspsaga outline<CR>", { noremap = true, silent = true })
keymap("n", "<leader>\\", ":Lspsaga code_action<CR>", { noremap = true, silent = true })
keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)

keymap("n", "zz", "za", opt)

keymap("n", "<leader>e", "<Cmd>Neotree toggle<CR>", opt)

keymap("n", "<leader>tn", "<Cmd>tabnew<CR>", opt)
keymap("n", "<leader>tc", "<Cmd>tabclose<CR>", opt)
keymap("n", "<leader>t[", "<Cmd>tabp<CR>", opt)
keymap("n", "<leader>t]", "<Cmd>tabn<CR>", opt)
keymap("n", "<leader>tj", "<Cmd>Tabby jump_to_tab<CR>", opt)

local bufferline = require("bufferline")
for i = 1, 9, 1 do
	keymap("n", "<leader>" .. i, function()
		bufferline.go_to(i)
	end, opt)
end

vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)
-- keymap({"n","i","v"},"<C-j>","<Down>",opt)
-- keymap({"n","i","v"},"<C-k>","<Up>",opt)
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
