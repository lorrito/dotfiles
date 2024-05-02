local status_ok, plugin = pcall(require, "luasnip")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.filetype_extend("javascriptreact", { "html" })
plugin.filetype_extend("html", { "javascript" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
require("vim-react-snippets").lazy_load()
