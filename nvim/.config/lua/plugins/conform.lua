return {
    "stevearc/conform.nvim",
    event = "BufModifiedSet",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
            rust = { "rustfmt", lsp_format = "fallback" },
            bash = { "beautysh" },
            sh = { "beautysh" },
        },
        default_format_opts = { lsp_format = "fallback" },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
}
