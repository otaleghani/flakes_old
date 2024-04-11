{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      ${builtins.readFile ./neovim/remap.lua}
      ${builtins.readFile ./neovim/options.lua}
      ${builtins.readFile ./neovim/plugins/lazynvim.lua}
      ${builtins.readFile ./neovim/plugins/lsp.lua}
      ${builtins.readFile ./neovim/plugins/treesitter.lua}
      ${builtins.readFile ./neovim/plugins/nvimtree.lua}
    '';
  };
}
