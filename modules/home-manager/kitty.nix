{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "JetBrainsMono Nerd Font";	
    font_size = "8";
  };
}
