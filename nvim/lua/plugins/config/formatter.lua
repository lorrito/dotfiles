local status_ok, plugin = pcall(require, "formatter")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

local util = require("formatter.util")

local biome_config = function()
	return {
		exe = "biome",
		args = {
			"format",
			"--stdin-file-path",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
	}
end

local clangformat_config = function()
	return {
		exe = "clang-format",
		args = {
			'--style="{ ReferenceAlignment: Pointer, PointerAlignment: Right, ReflowComments: true, KeepEmptyLinesAtTheStartOfBlocks: false, KeepEmptyLinesAtEOF: false, IndentWidth: 2, ColumnLimit: 160 }"',
			"-assume-filename",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
		try_node_modules = false,
	}
end

local prettierd_config = function()
	return {
		exe = "prettierd",
		args = { util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}
end

plugin.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		c = {
			require("formatter.filetypes.c").clangformat,
			clangformat_config,
		},
		cpp = {
			require("formatter.filetypes.c").clangformat,
			clangformat_config,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
			prettierd_config,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
			prettierd_config,
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
			prettierd_config,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
			prettierd_config,
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
