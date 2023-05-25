-- 代码折叠
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- treesitter illuminate
vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")

vim.cmd([[
  command! OpenInFinder execute "!open " . shellescape(expand("%:p:h"))
]])

vim.g.vsnip_filetypes = {
  typescriptreact = {"javascript", 'typescript', 'typescriptreact'},
	typescript = {"javascript", 'typescript', 'typescriptreact'}
}

