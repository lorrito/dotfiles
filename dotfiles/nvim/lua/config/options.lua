-- Disabling netwr in order to use NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options for a better quality of life
vim.opt.background = "dark"
vim.opt.backup = false -- disables backup
vim.opt.conceallevel = 0 -- makes so `` appears on markdown files
vim.opt.completeopt = { "menuone", "noselect" } -- treats the tab completiom menu
vim.opt.fileencoding = "utf-8" -- sets the default encoding to utf-8
vim.opt.hlsearch = true -- highlights matches on search pattern
vim.opt.mouse = "a" -- disables the mouse everywhere
vim.opt.showmode = false -- disables the mode showing at the status bar
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 10
vim.opt.cmdheight = 1 -- changes the size of the cmdheight below the lualine
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false -- disables swap file creation
vim.opt.updatetime = 150 -- makes so the update time is faster, for a faster <TAB> completion
vim.opt.expandtab = true -- converts tabs to spaces
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true -- highlights the current line
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.whichwrap:remove({ "h", "l" })
vim.opt.ignorecase = true
vim.opt.virtualedit = "onemore" -- makes the cursor go one more at the end of the line
vim.opt.laststatus = 0
