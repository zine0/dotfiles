return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    cond = (function()
        return not vim.g.vscode
    end)
}
