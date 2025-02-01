require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				enable = true,
				globals = { "vim" },
			},
			format = {
				enable = true,
			},
			hint = {
				enable = true,
				arrayIndex = "Enable",
				paramName = "All",
				paramType = true,
			},
			hover = {
				enable = true,
				enumsLimit = 5,
			},
		},
	},
})
local a = {
	1,
	2,
	3,
	4,
	5,
	6,
}
