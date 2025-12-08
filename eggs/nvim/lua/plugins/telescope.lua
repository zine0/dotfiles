return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    lazy = true,
    keys = {
        {
            "<leader>ff",
            mode = { "n" },
            function()
                require("telescope").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            mode = { "n" },
            function()
                require("telescope").live_grep()
            end,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            mode = { "n" },
            function()
                require("telescope").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            mode = { "n" },
            function()
                require("telescope").help_tags()
            end,
            desc = "Telescope help tags",
        },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
}
