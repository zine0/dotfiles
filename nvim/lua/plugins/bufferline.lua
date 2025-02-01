return {
	"akinsho/bufferline.nvim",
	evnet = "VeryLazy",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		options = {
            mode = "tabs",
			diagnostics = "nvim_lsp",
			numbers = function(opts)
				return string.format("%s", opts.ordinal)
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
