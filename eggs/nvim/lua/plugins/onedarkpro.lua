return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
        colors = {
            onedark = {bg = "#282c33"},
        },
        options = {
            cursorline = false, -- Use cursorline highlighting?
            transparency = false, -- Use a transparent background?
            terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
            lualine_transparency = false, -- Center bar transparency?
            highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        }
    }
}

