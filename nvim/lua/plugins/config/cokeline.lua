local status_ok, plugin = pcall(require, "cokeline")

if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

local get_hex = require("cokeline.hlgroups").get_hl_attr

plugin.setup({
	show_if_buffers_are_at_least = 1,
	buffers = {
		focus_on_delete = "next",
		filter_valid = false,
		filter_visible = false,
		new_buffers_position = "last",
		delete_on_right_click = true,
	},
	mappings = {
		cycle_prev_next = true,
		disable_mouse = false,
	},
	history = {
		enabled = false,
	},
	rendering = {
		max_buffer_width = 32,
	},
	pick = {
		use_filename = true,
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP",
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = "NONE",
		p = nil,
		bold = nil,
		italic = nil,
		underline = nil,
		undercurl = nil,
		strikethrough = nil,
	},
	fill_hl = "TabLineFill",
	components = {
		{
			text = function(buffer)
				return (buffer.index ~= 1) and "▏" or ""
			end,
			fg = function()
				return get_hex("Normal", "fg")
			end,
		},
		{
			text = function(buffer)
				return "    " .. buffer.devicon.icon
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. "    "
			end,
			bold = function(buffer)
				return buffer.is_focused
			end,
		},
		{
			text = " ",
		},
	},
	rhs = {},
	tabs = {
		placement = "right",
		components = {},
	},
	sidebar = {
		filetype = { "NvimTree" },
		components = {
			{
				text = " = File Explorer ",
				style = "bold",
			},
		},
	},
})
