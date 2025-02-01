return {
	"nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
	keys = {
		"<leader>t",
		"<Cmd>Neotree toggle<CR>",
        desc = "File Explorer"
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
}
