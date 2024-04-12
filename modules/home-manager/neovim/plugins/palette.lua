require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  --background = {         -- :h background
  --  light = "latte",
  --  dark = "mocha",
  --},
  transparent_background = true,  -- disables setting the background color.
  show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,              -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,              -- Force no italic
  no_bold = false,                -- Force no bold
  no_underline = false,           -- Force no underline
  styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },      -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    all = {
      rosewater = base06,
      flamingo = base0F,
      pink = base1F,
      mauve = base0E,
      red = base08,
      maroon = base18,
      peach = base09,
      yellow = base0A,
      green = base0B,
      teal = base0C,
      sky = base1C,
      sapphire = base1D,
      blue = base0D,
      lavander = base07,
      text = base05,
      subtext1 = base23, 
      subtext0 = base22, 
      overlay1 = base21, 
      overlay0 = base20, 
      surface2 = base04, 
      surface1 = base03, 
      surface0 = base02, 
      base = base00, 
      mantle = base01, 
      crust = base24, 
    },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    -- treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd.colorscheme "catppuccin"
