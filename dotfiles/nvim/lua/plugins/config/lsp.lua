local status_ok_luasnip, luasnip = pcall(require, "luasnip")
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

local util = require("lspconfig/util")

if not status_ok_luasnip then
	vim.notify("plugin " .. luasnip .. " failed to start.")
	return
end

if not status_ok_lspconfig then
	vim.notify("plugin " .. lspconfig .. " failed to start.")
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	signs = {
		severity_limit = "Hint",
	},
	virtual_text = {
		severity_limit = "Error",
	},
})

local on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, attach_opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, attach_opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, attach_opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, attach_opts)
end

lspconfig.rust_analyzer.setup({
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			cargo = {
				features = "all",
			},
			procMacro = {
				enable = true,
			},
			files = {
				watcher = "server",
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.solargraph.setup({
	init_options = {
		formatting = false,
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

local servers = { "emmet_language_server", "clangd", "lua_ls", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
