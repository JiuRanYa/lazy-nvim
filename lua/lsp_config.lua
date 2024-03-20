local nvim_lsp = require("lspconfig")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"volar",
		"tsserver",
	},
})

local common_servers = {
	"tsserver",
	"html",
	"cssls"
}

nvim_lsp.volar.setup({
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
  },
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true
			},
		},
	},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

for _, server in pairs(common_servers) do
	-- https://www.reddit.com/r/neovim/comments/mm1h0t/lsp_diagnostics_remain_stuck_can_someone_please/
	nvim_lsp[server].setup({
		flags = {
			allow_incremental_sync = false,
			debounce_text_changes = 500,
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
