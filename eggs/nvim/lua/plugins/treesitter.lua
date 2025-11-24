return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  auto_install = true,
  ensure_installed = {"c","lua","vim","vimdoc","markdown","cpp","python","go","rust"}
}
