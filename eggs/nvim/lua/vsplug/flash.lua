return {
  "folke/flash.nvim",
  event = "VeryLazy",
  -- @type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump({search = {forward = true,warp = false,multi_window = true}}) end, desc = "Forward Search" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump({search = {forward = false,warp = false,multi_window = true}}) end, desc = "Backward Search" },
    { "r", mode = "o", function() require("flash").treesitter() end, desc = "Treesitter Search" },
  },
}
