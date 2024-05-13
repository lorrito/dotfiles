local status_ok_kanagawa, kanagawa = pcall(require, "kanagawa")
local status_ok_gruvbox, gruvbox = pcall(require, "gruvbox")

if not status_ok_kanagawa then
	vim.notify("plugin " .. kanagawa .. " failed to start.")
	return
end

if not status_ok_gruvbox then
	vim.notify("plugin " .. gruvbox .. " failed to start.")
	return
end

kanagawa.setup({
	compile = false,
	undercurl = false,
	commentStyle = { italic = false },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = {
			wave = {},
			lotus = {},
			dragon = {},
			all = {
				ui = {
					float = {
						bg = "none",
					},
				},
			},
		},
	},
	overrides = function(colors)
		return {
			Underlined = { underline = false },
			htmlItalic = { italic = false },
		}
	end,
	background = {
		dark = "wave",
		light = "lotus",
	},
})

gruvbox.setup({
	terminal_colors = true, -- add neovim terminal colors
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
