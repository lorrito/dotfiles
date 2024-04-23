local status_ok, plugin = pcall(require, "Comment")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	pre_hook = function()
		return vim.bo.commentstring
	end,
})
