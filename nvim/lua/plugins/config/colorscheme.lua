local status_ok, plugin = pcall(require, "gruvbox")
if not status_ok then
  vim.notify("plugin" .. plugin .. "failed to start")
  return
end

plugin.setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
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

vim.cmd("colorscheme gruvbox")
