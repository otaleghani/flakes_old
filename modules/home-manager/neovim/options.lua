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

-- -- rustaceanvim
-- vim.g.rustaceanvim = {
--   server = {
--     cmd = function()
-- local mason_registry = require('mason-registry')
-- local ra_binary = mason_registry.is_installed('rust-analyzer') 
--   -- This may need to be tweaked, depending on the operating system.
--   and mason_registry.get_package('rust-analyzer'):get_install_path() .. "/rust-analyzer"
--   or "rust-analyzer"
-- return { ra_binary } -- You can add args to the list, such as '--log-file'
--     end,
--   },
-- }
-- 
-- lspconfig.rust_analyzer.setup {
--   cmd = {
--     "rustup", "run", "stable", "rust-analyzer",
--   }
-- }
