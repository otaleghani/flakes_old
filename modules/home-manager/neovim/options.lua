-- general commands
vim.opt.timeout = false
vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = false

-- netrw
vim.g.netrw_banner = false
vim.g.netrw_sort_options = ""

-- tabs
tab = 2
vim.opt.tabstop = tab
vim.opt.softtabstop = tab
vim.opt.shiftwidth = tab
vim.opt.expandtab = true
vim.opt.autoindent = true

-- text highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- numbers
vim.opt.relativenumber = true
vim.opt.number = true
  
-- fold
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

-- signcolumn
vim.opt.signcolumn = "auto"
