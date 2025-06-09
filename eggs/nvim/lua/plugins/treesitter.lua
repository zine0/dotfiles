return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"python",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["as"] = "@local.scope",
					},
					include_surrounding_whitespace = true,
				},
			},
		})
	end,
}
