-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.conceallevel = 0
vim.opt.scrolloff = 10
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.opt.smartindent=true

vim.cmd([[
  augroup auto_cd
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
  augroup END
]])