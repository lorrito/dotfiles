local status_ok, plugin = pcall(require, "ibl")
if not status_ok then
	return
end

plugin.overwrite({
	scope = {
		enabled = false,
	},
	exclude = { filetypes = { "alpha", "md", "markdown" } },
})
