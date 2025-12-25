return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {--[[ things you want to change go here]]
            open_mapping = [[<c-\>]],
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            shade_terminals = false,
            winbar = {
                enabled = true,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end,
            },
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        },
    },
}
