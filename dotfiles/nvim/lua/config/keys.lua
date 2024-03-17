-- Creating lists in order to have shorter options
local opts = { noremap = true, silent = true }

-- Shorter function name
local keymap = vim.api.nvim_set_keymap

-- Remapping space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.mapolocalleader = " "

-- Unmapping some keys
keymap("", "<leader>lo", "<Nop>", opts)
keymap("", "<leader>la", "<Nop>", opts)
keymap("", "<C-q>", "<Nop>", opts)
keymap("", "<C-c>", "<Nop>", opts)
keymap("", "<C-y>", "<Nop>", opts)
keymap("", "<C-d>", "<Nop>", opts)
keymap("", "<C-w>", "<Nop>", opts)
keymap("", "<S-j>", "<Nop>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize the current window
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Close tab and go to another buffer, if there's one.
keymap("n", "<C-x>", ":bd<CR>:bl<CR>", opts)

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Move lines
-- Visual block mode
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-h>", "<gv", opts)
keymap("x", "<A-l>", ">gv", opts)
-- Indentation mode
keymap("i", "<A-j>", "<Esc>:m+1<CR>i", opts)
keymap("i", "<A-k>", "<Esc>:m-2<CR>i", opts)
-- Normal mode
keymap("n", "<A-j>", ":m+1<CR>", opts)
keymap("n", "<A-k>", ":m-2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, opts)

-- Actions preview
vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions, opts)

-- Format file using formatter.nvim
keymap("n", "<C-f>", ":Format<CR>", opts)

-- Makes so $ goes one more after the last character
keymap("n", "$", "$l", opts)

-- Scissors snippets keymaps
vim.keymap.set("n", "<leader>se", function()
	require("scissors").editSnippet()
end, opts)

-- When used in visual mode prefills the selection as body
vim.keymap.set({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end, opts)

-- Lsp configuration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
