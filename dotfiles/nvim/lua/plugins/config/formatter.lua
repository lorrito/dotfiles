local status_ok, plugin = pcall(require, "formatter")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end
local util = require("formatter.util")

plugin.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		c = {
			require("formatter.filetypes.c").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						'--style="{ ReferenceAlignment: Pointer, PointerAlignment: Right, ReflowComments: true, KeepEmptyLinesAtTheStartOfBlocks: false, KeepEmptyLinesAtEOF: false, IndentWidth: 2, ColumnLimit: 160 }"',
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = false,
				}
			end,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		ruby = {
			require("formatter.filetypes.ruby").standardrb,
			function()
				return {
					exe = "standardrb",
					args = {
						"--fix",
						"--format",
						"quiet",
						"--stderr",
						"--stdin",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
