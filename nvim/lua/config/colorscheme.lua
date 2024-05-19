local status_ok_gruvbox, gruvbox = pcall(require, "gruvbox")

if not status_ok_gruvbox then
	vim.notify("plugin " .. gruvbox .. " failed to start.")
	return
end

gruvbox.setup({
	terminal_colors = true,
	undercurl = false,
	underline = false,
	bold = false,
	italic = {
		strings = false,
		emphasis = false,
		comments = false,
		operators = false,
		folds = false,
	},
	strikethrough = false,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,
	contrast = "",
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

local colorscheme = "gruvbox"
---@diagnostic disable-next-line: param-type-mismatch
local status_ok_colorscheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok_colorscheme then
	vim.notify("colorscheme not found.")
	vim.cmd("colorscheme slate")
end
