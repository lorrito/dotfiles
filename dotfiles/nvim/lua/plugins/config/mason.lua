local status_ok_mason, mason = pcall(require, "mason")
local status_ok_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
local status_ok_masontools, masontools = pcall(require, "mason-tool-installer")

if not status_ok_mason and status_ok_masonlsp and status_ok_masontools then
	vim.notify("mason failed to start.")
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

masonlsp.setup({})

masontools.setup({
	ensure_installed = {
		-- C
		-- C++
		"clangd",
		"clang-format",

		-- Lua
		"stylua",
		"lua-language-server",

		-- Javascript
		"prettier",
		"typescript-language-server",

		-- HTML
		"emmet-language-server",

		-- Ruby
		"solargraph",
		"standardrb",

		-- Rust
		-- rustfmt should be installed using rustup
		-- rustup component add rustfmt
		"rust-analyzer",
	},
	run_on_start = true,
	start_delay = 512,
})
