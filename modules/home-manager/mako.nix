{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font 10";
    width = 256;
    height = 500;
    margin = "8";
    padding = "16";
    borderSize = 0;
    borderRadius = 4;
    backgroundColor = "#${config.colorScheme.palette.base07}";
    borderColor = "#${config.colorScheme.palette.base00}";
    textColor = "#${config.colorScheme.palette.base04}";
    defaultTimeout = 5000;
    extraConfig = ''
      [urgency=high]
      border-color=#${config.colorScheme.palette.base08}
    '';
  };
}
