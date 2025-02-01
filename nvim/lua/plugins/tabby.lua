return {
	"nanozuki/tabby.nvim",
	-- event = 'VimEnter', -- if you want lazy load, see below
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
        preset = "active_wins_at_tail",
		options = {
			theme = "tokyonight",
			disabled_filetypes = { "NvimTree", "sagaoutline", "neo-tree", "CompetiTest" },
			globalstatus = true,
		},
	},
}
