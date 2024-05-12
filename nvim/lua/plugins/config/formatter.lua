local status_ok, plugin = pcall(require, "formatter")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

local util = require("formatter.util")

local prettier_args = {
	"--stdin-filepath",
	util.escape_path(util.get_current_buffer_file_path()),
}

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
						'--style="{ ReferenceAlignment: Pointer, PointerAlignment: Right, ReflowComments: true, KeepEmptyLinesAtTheStartOfBlocks: false, KeepEmptyLinesAtEOF: false, IndentWidth: 4, ColumnLimit: 160 }"',
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = false,
				}
			end,
		},
		cpp = {
			require("formatter.filetypes.c").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						'--style="{ ReferenceAlignment: Pointer, PointerAlignment: Right, ReflowComments: true, KeepEmptyLinesAtTheStartOfBlocks: false, KeepEmptyLinesAtEOF: false, IndentWidth: 4, ColumnLimit: 160 }"',
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = false,
				}
			end,
		},
		html = {
			require("formatter.filetypes.html").prettier,
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
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
			require("formatter.filetypes.javascript").prettierd,
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},
		ruby = {
			require("formatter.filetypes.ruby").rubocop,
			function()
				return {
					exe = "rubocop",
					args = {
						"--fix-layout",
						"--stdin",
						util.escape_path(util.get_current_buffer_file_name()),
						"--format",
						"files",
						"--stderr",
					},
					stdin = true,
				}
			end,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
			function()
				return {
					exe = "rustfmt",
					args = {
						"--emit=stdout",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
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
