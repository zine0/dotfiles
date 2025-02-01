return {
	"neovim/nvim-lspconfig",
	-- lspconfig["lua_ls"].setup({})
	-- lspconfig["clangd"].setup({})
	-- lspconfig["pyright"].setup({})
	-- lspconfig["cmake"].setup({})
	-- lspconfig["zls"].setup({})
	-- lspconfig["rust_analyzer"].setup({})
	-- lspconfig["dockerls"].setup({})
	-- lspconfig["cssls"].setup({})
	-- lspconfig["docker_compose_language_service"].setup({})
	-- --Enable (broadcasting) snippet capability for completion
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- lspconfig.html.setup({
	--     cmd = { "vscode-html-language-server", "--stdio" },
	--     filetype = { "html", "templ" },
	--     capabilities = capabilities,
	--     init_options = {
	--         {
	--             configurationSection = { "html", "css", "javascript" },
	--             embeddedLanguages = {
	--                 css = true,
	--                 javascript = true,
	--             },
	--             provideFormatter = true,
	--         },
	--     },
	-- })
	-- inlay_hints = { enabled = true },
	opts = {
		servers = {
			lua_ls = {},
			clangd = {},
			pyright = {},
			cmake = {},
			zls = {},
			rust_analyzer = {},
			dockerls = {},
			cssls = {},
			docker_compose_language_service = {},
			texlab = {},
			html = {
				cmd = { "vscode-html-language-server", "--stdio" },
				filetype = { "html", "templ" },
				init_options = {
					{
						configurationSection = { "html", "css", "javascript" },
						embeddedLanguages = {
							css = true,
							javascript = true,
						},
						provideFormatter = true,
					},
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
