local status_ok_cmp, cmp = pcall(require, "cmp")
-- local status_ok_snippy, snippy = pcall(require, "snippy")
local status_ok_luasnip, luasnip = pcall(require, "luasnip")
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_cmp then
	vim.notify("plugin " .. cmp .. " failed to start.")
	return
end

if not status_ok_luasnip then
	vim.notify("plugin " .. luasnip .. " failed to start.")
	return
end

-- if not status_ok_snippy then
-- 	vim.notify("plugin " .. snippy .. " failed to start.")
-- 	return
-- end

if not status_ok_lspconfig then
	vim.notify("plugin " .. lspconfig .. " failed to start.")
	return
end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	experimental = {
		ghost_text = true,
	},
	snippet = {
		expand = function(args)
			-- require("snippy").expand_snippet(args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Snippy super-tab configuration:
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif snippy.can_expand_or_advance() then
		-- 		snippy.expand_or_advance()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif snippy.can_jump(-1) then
		-- 		snippy.previous()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),

		-- Luasnip super-tab configuration:
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<Down>"] = cmp.mapping(function(fallback)
			cmp.close()
			fallback()
		end, { "i" }),

		["<Up>"] = cmp.mapping(function(fallback)
			cmp.close()
			fallback()
		end, { "i" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- { name = "snippy" },
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	signs = {
		severity_limit = "Hint",
	},
	virtual_text = {
		severity_limit = "Error",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, attach_opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, attach_opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, attach_opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, attach_opts)
end

local servers = { "clangd", "solargraph", "lua_ls", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.emmet_language_server.setup({
	filetypes = {
		"html",
		"javascriptreact",
		"css",
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
