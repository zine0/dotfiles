return {
	"mhartington/formatter.nvim",
	-- lazy = false,
	keys = {
		{ "<leader>p", "<Cmd>w||FormatWrite<CR>||w", desc = "Format This File And Write" },
	},
	opts = {
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = function()
				local util = require("formatter.util")
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
			cpp = function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename=",
						vim.api.nvim_buf_get_name(0),
						"-style=file",
					},
					stdin = true,
				}
			end,
			c = function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename=",
						vim.api.nvim_buf_get_name(0),
						"-style=file",
					},
					stdin = true,
				}
			end,
			python = function()
				return {
					exe = "autopep8",
					args = { "-" },
					stdin = 1,
				}
			end,
			html = function()
				local util = require("formatter.util")
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--tab-width",
						4,
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
			css = function()
				local util = require("formatter.util")
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--tab-width",
						4,
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
			htmldjango= function()
				local util = require("formatter.util")
				return {
					exe = "djlint",
					args = {
						"--reformat",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
}
