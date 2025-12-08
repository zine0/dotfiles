local wk = require("which-key")
local telescope = require("telescope.builtin")

local opts = { buffer = 0 }

wk.add({
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle the NeoTree Window" },
    { "<leader>w", "<cmd>w<cr>", desc = "Save buffer" },
    {
        "<leader>b",
        group = "buffers",
        expand = function()
            return require("which-key.extras").expand.buf()
        end,
    },
    { "<C-h>", "<Cmd>wincmd h<CR>", opts },
    { "<C-j>", "<Cmd>wincmd j<CR>", opts },
    { "<C-k>", "<Cmd>wincmd k<CR>", opts },
    { "<C-l>", "<Cmd>wincmd l<CR>", opts },
})
