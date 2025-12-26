return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            use_libuv_file_watcher = true,
            document_symbols = {
                window = {
                    width = 25,
                },
            },
            filesystem = {
                window = {
                    width = 25,
                },
            },
        },
    },
}
