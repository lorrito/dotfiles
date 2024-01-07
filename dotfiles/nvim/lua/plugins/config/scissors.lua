local status_ok, plugin = pcall(require, "scissors")
if not status_ok then
	vim.notify("plugin " .. plugin .. "failed to start")
	return
end

plugin.setup({
	snippetDir = vim.fn.stdpath("config") .. "/snippets",
})
