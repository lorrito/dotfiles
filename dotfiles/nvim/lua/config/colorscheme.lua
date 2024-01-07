local status_ok, _ = pcall(vim.cmd, "colorscheme " .. "base16-material-darker")

if not status_ok then
	vim.notify("colorscheme not found.")
end
