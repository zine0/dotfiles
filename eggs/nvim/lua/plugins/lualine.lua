return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function ()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
                disabled_filetypes = {"NvimTree","sagaoutline","neo-tree","CompetiTest"},
                globalstatus = true
            }

        })
    end
}
