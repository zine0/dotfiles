return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		cmdline = {
			completion = {
				menu = { auto_show = true },
			},
			keymap = {
				preset = "default",
				["<Tab>"] = { "accept", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
			},
		},

		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},
		keymap = {
			preset = "default",
			["<Tab>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		-- snippets = {
		-- 	expand = function(snippet)
		-- 		require("luasnip").lsp_expand(snippet)
		-- 	end,
		-- 	active = function(filter)
		-- 		if filter and filter.direction then
		-- 			return require("luasnip").jumpable(filter.direction)
		-- 		end
		-- 		return require("luasnip").in_snippet()
		-- 	end,
		-- 	jump = function(direction)
		-- 		require("luasnip").jump(direction)
		-- 	end,
		-- },
		sources = {
			default = { "snippets", "vsnip", "lsp", "path", "buffer" },
			-- optionally disable cmdline completions
			-- cmdline = {},
			providers = {
				-- create provider
				-- luasnip = {
				-- 	name = "luasnip",
				-- 	module = "blink.compat.source",
				-- 	opts = {
				-- 		impersonate_nvim_cmp = false,
				-- 	},
				-- },
				vsnip = {
					name = "vsnip",
					module = "blink.compat.source",
					opts = {
						impersonate_nvim_cmp = false,
					},
				},
			},
		},

		-- experimental signature help support
		-- signature = { enabled = true }
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	-- opts_extend = { "sources.default" },
}
