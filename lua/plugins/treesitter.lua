return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "javascript", "html", "json", "vue", "vim", "typescript", "scss", "css" },
				matchup = {
					enable = true, -- mandatory, false will disable the whole extension
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "<BS>",
					},
				},
				autotag = {
					enable = true,
				},
				highlight = {
					-- disable highlight for variable and package in file
					enable = false,
					additional_vim_regex_highlighting = false,
					disable = {},
				},
				indent = {
					-- because it's buggy
					enable = false,
				},
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	}
}
