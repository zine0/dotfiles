local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Format when Save
-- augroup("Format", { clear = true })
-- autocmd("BufWritePre", {
-- 	group = "Format",
-- 	command = ":FormatWrite",
-- })

vim.cmd([[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  ]])
