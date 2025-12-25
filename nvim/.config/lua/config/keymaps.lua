local wk = require("which-key")
local telescope = require("telescope.builtin")
local treesitter_move = require("nvim-treesitter-textobjects.move")

local opts = { buffer = 0 }

wk.add({
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle the NeoTree Window" },
    { "<leader>w", "<cmd>w<cr>", desc = "Save buffer" },
    {
        "<leader>b",
        group = "buffers",
        telescope.buffers,
        desc = "List buffers",
    },
    { "<C-h>", "<Cmd>wincmd h<CR>", opts },
    { "<C-j>", "<Cmd>wincmd j<CR>", opts },
    { "<C-k>", "<Cmd>wincmd k<CR>", opts },
    { "<C-l>", "<Cmd>wincmd l<CR>", opts },
    { "g.", vim.lsp.buf.code_action, desc = "List code actions" },
    {
        mode = { "n", "x", "o" },
        "]f",
        function()
            treesitter_move.goto_next_start("@function.outer", "textobjects")
        end,
        desc = "Goto next start of function outer",
    },
    {
        mode = { "n", "x", "o" },
        "]F",
        function()
            treesitter_move.goto_next_end("@function.outer", "textobjects")
        end,
        desc = "Goto next end of function outer",
    },
    {
        mode = { "n", "x", "o" },
        "[f",
        function()
            treesitter_move.goto_previous_start("@function.outer", "textobjects")
        end,
        desc = "Goto previous start of function outer",
    },
    {
        mode = { "n", "x", "o" },
        "[F",
        function()
            treesitter_move.goto_previous_end("@function.outer", "textobjects")
        end,
        desc = "Goto previous end of function outer",
    },

    {
        mode = { "n", "x", "o" },
        "]c",
        function()
            treesitter_move.goto_next_start("@class.outer", "textobjects")
        end,
        desc = "Goto next start of class outer",
    },
    {
        mode = { "n", "x", "o" },
        "]c",
        function()
            treesitter_move.goto_next_end("@class.outer", "textobjects")
        end,
        desc = "Goto next end of class outer",
    },
    {
        mode = { "n", "x", "o" },
        "[c",
        function()
            treesitter_move.goto_previous_start("@class.outer", "textobjects")
        end,
        desc = "Goto previous start of class outer",
    },
    {
        mode = { "n", "x", "o" },
        "[c",
        function()
            treesitter_move.goto_previous_end("@class.outer", "textobjects")
        end,
        desc = "Goto previous end of class outer",
    },
})
