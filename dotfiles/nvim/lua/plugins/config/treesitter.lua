local status_ok, plugin = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "ruby", "javascript" },
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = false,
		disable = { "text", "markdown", "txt", "md" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	},
})
