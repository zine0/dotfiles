return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
        move = {
            set_jumps = true, -- whether to set jumps in the jumplist
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}
