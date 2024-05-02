local status_ok_kanagawa, kanagawa = pcall(require, "kanagawa")

if not status_ok_kanagawa then
	vim.notify("plugin " .. kanagawa .. " failed to start.")
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
    return {}
	end,
	background = {
		dark = "wave",
		light = "lotus",
	},
})

local colorscheme = "kanagawa"
---@diagnostic disable-next-line: param-type-mismatch
local status_ok_colorscheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok_colorscheme then
	vim.notify("colorscheme not found.")
	vim.cmd("colorscheme slate")
end
