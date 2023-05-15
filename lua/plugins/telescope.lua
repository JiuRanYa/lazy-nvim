return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		keys = {
			{ "<Leader>f", ":Telescope find_files<CR>", {} },
			{ "<Leader>p", ":Telescope live_grep<CR>", {} },
			{ "<C-q>", ":Telescope oldfiles<CR>", {} },
		},
		config = function ()
			require("telescope").setup({
			})
		end,
}
