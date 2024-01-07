local status_ok, plugin = pcall(require, "trouble")
if not status_ok then
	vim.notify("plugin " .. plugin .. " failed to start.")
	return
end

plugin.setup({
	opts = {
		position = "bottom",
		height = 16,
		icons = true,
		include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		severity = nil,
		use_diagnostic_signs = false,
		mode = "document_diagnostics",
		cycle_results = false,
		action_keys = {
			cancel = "q",
			refresh = "r",
			jump = { "<cr>", "<tab>", "<2-leftmouse>" },
			jump_close = { "o" },
			toggle_mode = "m",
			switch_severity = "s",
			previous = "k",
			next = "j",
			help = "?",
      auto_preview = false,
		},
	},
})
