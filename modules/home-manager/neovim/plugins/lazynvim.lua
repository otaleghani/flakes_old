-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  --
  -- START LSP
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-nvim-lua'},
  {'rafamadriz/friendly-snippets'},
  {'L3MON4D3/LuaSnip'},
  -- END LSP
  --
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {'tpope/vim-fugitive'},
  {'tpope/vim-obsession'},
  {'anuvyklack/pretty-fold.nvim'},
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  --   }
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end,
  -- },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  }
}

local opts = {}

-- run lazy.nvim on startup
require("lazy").setup(plugins, opts)
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
