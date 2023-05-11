return {
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"Pocco81/auto-save.nvim",
		config = function ()
			require('auto-save').setup({
				enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
				debounce_delay = 200,
			})
		end,
	}
}
