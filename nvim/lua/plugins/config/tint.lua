local status_ok, plugin = pcall(require, "tint")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	tint = -45,
	saturation = 0.3,
	transforms = require("tint").transforms.SATURATE_TINT,
	highlight_ignore_patterns = { "WinSeparator", "Status.*" },
	window_ignore_function = function(winid)
		local bufid = vim.api.nvim_win_get_buf(winid)
		---@diagnostic disable-next-line: deprecated
		local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
		local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

		-- do not tint terminal or floating windows
		return buftype == "terminal" or floating
	end,
})
