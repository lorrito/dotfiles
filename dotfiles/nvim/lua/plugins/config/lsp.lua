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

lspconfig.rust_analyzer.setup({
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			imports = {
				group = {
					enable = false,
				},
			},
			completion = {
				postfix = {
					enable = false,
				},
			},
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
	capabilities = capabilities,
})

lspconfig.solargraph.setup({
	init_options = {
		formatting = false,
	},
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	-- init_options = {},
	completions = {
		completeFunctionCalls = true,
	},
	-- idk how to make this work
	-- diagnostics = {
	-- 	ignoredCodes = { 80001 },
	-- },
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	diagnostics = {
		globals = { "vim" },
	},
})

local servers = { "clangd", "html" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

