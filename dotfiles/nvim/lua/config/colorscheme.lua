local status_ok_catppuccin, catppuccin = pcall(require, "catppuccin")
local status_ok_kanagawa, kanagawa = pcall(require, "kanagawa")

if not status_ok_catppuccin then
	vim.notify("plugin " .. catppuccin .. " failed to start.")
	return
end

if not status_ok_kanagawa then
	vim.notify("plugin " .. kanagawa .. " failed to start.")
	return
end

catppuccin.setup({
	no_italic = true,
	background = {
		light = "latte",
		dark = "mocha",
	},
	color_overrides = {
		mocha = {
			rosewater = "#ffc9c9",
			flamingo = "#ff9f9a",
			pink = "#ffa9c9",
			mauve = "#df95cf",
			lavender = "#a990c9",
			red = "#ff6960",
			maroon = "#f98080",
			peach = "#f9905f",
			yellow = "#f9bd69",
			green = "#b0d080",
			teal = "#a0dfa0",
			sky = "#a0d0c0",
			sapphire = "#95b9d0",
			blue = "#89a0e0",
			text = "#e0e0d0",
			subtext1 = "#d5c4a1",
			subtext0 = "#bdae93",
			overlay2 = "#928374",
			overlay1 = "#7c6f64",
			overlay0 = "#665c54",
			surface2 = "#504844",
			surface1 = "#3a3634",
			surface0 = "#252525",
			base = "#151515",
			mantle = "#0e0e0e",
			crust = "#080808",
		},
	},
})

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
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
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
