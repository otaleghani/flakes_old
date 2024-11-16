-- super
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- windows navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<Leader>h", "<cmd>:vnew<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>:belowright vnew<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>j", "<cmd>:belowright new<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>k", "<cmd>:new<cr>", {})

-- quit save
vim.api.nvim_set_keymap("n", "<Leader>q", "<cmd>:q<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>:w<cr>", {})

-- tabs navigation
vim.api.nvim_set_keymap("n", "<F2>", "<ESC>:tabnew<CR>", {})
vim.api.nvim_set_keymap("n", "<F3>", "gt", {})
vim.api.nvim_set_keymap("n", "<F4>", "gT", {})
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>q<cr>", {})

-- vertical navigation
vim.api.nvim_set_keymap("n", "G", "Gzz", {})
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})
vim.api.nvim_set_keymap("n", "{", "{zzzv", {})
vim.api.nvim_set_keymap("n", "}", "}zzzv", {})
vim.api.nvim_set_keymap("n", "(", "(zzzv", {})
vim.api.nvim_set_keymap("n", ")", ")zzzv", {})

-- exit terminal mode with esc
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- netrw
-- vim.api.nvim_set_keymap('n', '<leader>pv', "<cmd>:Vex | vertical resize 30<cr>", {})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Clipboard stuff
-- vim.api.nvim_set_keymap("n", "<leader>y", "\"+y")
-- vim.api.nvim_set_keymap("v", "<leader>y", "\"+y")
-- vim.api.nvim_set_keymap("n", "<leader>y", "\"+Y")

-- Change project on the fly - requires tmux - https://www.youtube.com/watch?v=w7i4amO_zaE
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

-- File-wide search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fold
-- vim.api.nvim_set_keymap('n', '<Leader>f', 'za', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>FO', 'zR', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>FA', 'zM', { noremap = true, silent = true })
