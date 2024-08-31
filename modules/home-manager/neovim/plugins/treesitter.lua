require'nvim-treesitter.configs'.setup {
  ensure_installed = {},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  fold = {
    enable = true,
  },
  -- parser_install_dir = vim.fn.expand("~/.local/share/nvim/site/parser"),
}

-- vim.fn.mkdir(vim.fn.expand("~/.local/share/nvim/site/parser"), "p")
-- vim.opt.runtimepath:append(vim.fn.expand("~/.local/share/nvim/site/parser"))
