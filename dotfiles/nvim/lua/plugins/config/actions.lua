local status_ok, plugin = pcall(require, "actions-preview")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
  return
end

plugin.setup {
  diff = {
    ctxlen = 3,
  },
  backend = { "telescope" },
}
