local wk = require("which-key")
local telescope = require("telescope.builtin")

wk.add({
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle the NeoTree Window" },
    { "<leaderff>", telescope.find_files, desc = "Telescope find files" },
    { "<leader>fg", telescope.live_grep, desc = "Telescope live grep" },
    { "<leader>fb", telescope.buffers, desc = "Telescope buffers" },
    { "<leader>fh", telescope.help_tags, desc = "Telescope help tags" },
    { "<leader>w", "<cmd>w<cr>", desc = "Save buffer" },
    {
        "<leader>b",
        group = "buffers",
        expand = function()
            return require("which-key.extras").expand.buf()
        end,
    },
})
