local status_ok_luasnip, luasnip = pcall(require, "luasnip")
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_luasnip then
	vim.notify("plugin " .. luasnip .. " failed to start.")
	return
end

if not status_ok_lspconfig then
	vim.notify("plugin " .. lspconfig .. " failed to start.")
	return
end

-- rounded border on :LspInfo
require("lspconfig.ui.windows").default_options.border = "rounded"

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

lspconfig.solargraph.setup({
	capabilities = capabilities,
	init_options = {
		formatting = false,
	},
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	completions = {
		completeFunctionCalls = true,
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_init = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

lspconfig.rust_analyzer.setup({})

local servers = {
	"clangd",
	"html",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end
