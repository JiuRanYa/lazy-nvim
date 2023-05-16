return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		keys = {
			{ "<Leader>f", ":Telescope find_files<CR>", {} },
			{ "<Leader>p", ":Telescope live_grep<CR>", {} },
			{ "<Leader>o", ":Telescope lsp_document_symbols<CR>", {} },
			{ "<C-q>", ":Telescope oldfiles<CR>", {} },
		},
		config = function ()
			require("telescope").setup({
			})
		end,
}
