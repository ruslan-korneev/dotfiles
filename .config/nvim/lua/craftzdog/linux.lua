vim.opt.clipboard = "unnamedplus"
vim.cmd [[
  augroup remember_folds
  autocmd!
  autocmd BufwinLeave ?* mkview
  autocmd BufwinEnter ?* silent! loadview
  augroup END
]]
