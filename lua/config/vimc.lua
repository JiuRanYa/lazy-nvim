-- 代码折叠
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- treesitter illuminate
vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")

-- vim.cmd([[
--   command! OpenInFinder execute "!open " . shellescape(expand("%:p:h"))
-- ]])
--
-- vim.g.vsnip_filetypes = {
--   typescriptreact = {"javascript", 'typescript', 'typescriptreact'},
-- 	typescript = {"javascript", 'typescript', 'typescriptreact'}
-- }
--
vim.api.nvim_create_user_command('OpenInFinder',
	function()
			local path = vim.api.nvim_buf_get_name(0)
			os.execute('open -R ' .. path)
	end,
	{}
)
