if not vim.g.vscode then
    require("config.opts")
    require("config.keymaps")
    require("config.autocmds")
else
    require("config.vskeymaps")
end
