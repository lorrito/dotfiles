local status_ok_bufremove, bufremove = pcall(require, "mini.bufremove")

if not status_ok_bufremove then
	vim.notify("(mini) plugin " .. bufremove .. " failed to start.")
	return
end

bufremove.setup()
