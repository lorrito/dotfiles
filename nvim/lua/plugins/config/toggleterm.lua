local status_ok, plugin = pcall(require, "toggleterm")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	hide_numbers = true,
	shade_filetypes = {},
	autochdir = false,
	shade_terminals = true,
	shading_factor = -30,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	close_on_exit = true,
	auto_scroll = true,
	float_opts = {
		border = "single",
    winblend = 2,
	},
})
