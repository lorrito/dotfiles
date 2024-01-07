local status_ok_devicons, devicons = pcall(require, "nvim-web-devicons")
local status_ok_actions, actions = pcall(require, "actions-preview")

if not status_ok_devicons then
	vim.notify("plugin " .. devicons .. " failed to start.")
	return
end

if not status_ok_actions then
	vim.notify("plugin " .. actions .. " failed to start.")
	return
end

devicons.setup({})
actions.setup({})
