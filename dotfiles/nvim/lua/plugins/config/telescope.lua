local status_ok, plugin = pcall(require, "telescope")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
  border = true,
	defaults = {
		history = {
			limit = 500,
		},
	},
	pickers = {
		find_files = {
			hidden = false,
		},
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

plugin.load_extension("ui-select")
plugin.load_extension("fzf")
