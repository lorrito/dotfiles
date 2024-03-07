local status_ok, plugin = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
    disable = { "markdown" },
	},
	indent = {
		enable = false,
	},
})
