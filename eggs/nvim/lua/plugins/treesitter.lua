return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "cpp", "python", "go", "rust" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}
