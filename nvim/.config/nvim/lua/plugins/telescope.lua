local builtin = require("telescope.builtin")
return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    lazy = true,
    keys = {
        {
            "<leader>ff",
            mode = { "n" },
            function()
                builtin.find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            mode = { "n" },
            function()
                builtin.live_grep()
            end,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            mode = { "n" },
            function()
                builtin.buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            mode = { "n" },
            function()
                builtin.help_tags()
            end,
            desc = "Telescope help tags",
        },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        require("telescope").load_extension("ui-select")
        return {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),
                },
            },
        }
    end,
}
