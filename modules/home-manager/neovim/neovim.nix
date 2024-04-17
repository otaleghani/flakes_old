{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      base00 = "#${config.colorScheme.palette.base00}"
      base01 = "#${config.colorScheme.palette.base01}"
      base02 = "#${config.colorScheme.palette.base02}"
      base03 = "#${config.colorScheme.palette.base03}"
      base04 = "#${config.colorScheme.palette.base04}"
      base05 = "#${config.colorScheme.palette.base05}"
      base06 = "#${config.colorScheme.palette.base06}"
      base07 = "#${config.colorScheme.palette.base07}"
      base08 = "#${config.colorScheme.palette.base08}"
      base09 = "#${config.colorScheme.palette.base09}"
      base0A = "#${config.colorScheme.palette.base0A}"
      base0B = "#${config.colorScheme.palette.base0B}"
      base0C = "#${config.colorScheme.palette.base0C}"
      base0D = "#${config.colorScheme.palette.base0D}"
      base0E = "#${config.colorScheme.palette.base0E}"
      base0F = "#${config.colorScheme.palette.base0F}"
      base18 = "#${config.colorScheme.palette.base18}"
      base19 = "#${config.colorScheme.palette.base19}"
      base1A = "#${config.colorScheme.palette.base1A}"
      base1B = "#${config.colorScheme.palette.base1B}"
      base1C = "#${config.colorScheme.palette.base1C}"
      base1D = "#${config.colorScheme.palette.base1D}"
      base1E = "#${config.colorScheme.palette.base1E}"
      base1F = "#${config.colorScheme.palette.base1F}"
      base20 = "#${config.colorScheme.palette.base20}"
      base21 = "#${config.colorScheme.palette.base21}"
      base22 = "#${config.colorScheme.palette.base22}"
      base23 = "#${config.colorScheme.palette.base23}"
      base24 = "#${config.colorScheme.palette.base24}"

      ${builtins.readFile ./remap.lua}
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/lazynvim.lua}
      ${builtins.readFile ./plugins/lsp.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/nvimtree.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/palette.lua}
      ${builtins.readFile ./plugins/tabby.lua}
      ${builtins.readFile ./plugins/lualine.lua}
      ${builtins.readFile ./plugins/restnvim.lua}
    '';
  };
}
