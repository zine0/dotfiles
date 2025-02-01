return {
	"akinsho/toggleterm.nvim",
	keys = { [[<c-\>]] },
	version = "*",
	config = function()
		require("toggleterm").setup({
			shade_terminals = false,
			open_mapping = [[<c-\>]],
			float_opts = {
				border = "rounded",
			},
		})
	end,
}
