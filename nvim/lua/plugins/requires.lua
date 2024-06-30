local config = "plugins.config."
local plugins = {
	"bufferline",
	"cmp",
	"colorizer",
	"comment",
	"formatter",
	"lsp",
	"lualine",
	"luasnip",
	"mason",
	"mini",
	"mkdnflow",
	"nvimtree",
	"telescope",
	"toggleterm",
	"trouble",
}

-- load colorbuddy first
pcall(require, config .. "colorbuddy")

for _, plugin in ipairs(plugins) do
	local status_ok, _ = pcall(require, config .. plugin)
	if not status_ok then
		vim.notify("plugin [" .. plugin .. "] failed to start")
	end
end
