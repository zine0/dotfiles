local builtin = require("telescope.builtin")
return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {

		{ "n", "<leader>ff", builtin.find_files, {} },
		{ "n", "<leader>fg", builtin.live_grep, {} },
		{ "n", "<leader>fb", builtin.buffers, {} },
		{ "n", "<leader>fh", builtin.help_tags, {} },
	},
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
}
