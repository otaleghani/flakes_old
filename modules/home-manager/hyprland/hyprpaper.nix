{ config, pkgs, ... }: {
  home.file."./.config/wallpapers/" = {
    source = ./wallpapers;
    recursive = true;
  };
  home.file."./.config/hypr/hyprpaper.conf".text = ''
    preload = ~/.config/wallpapers/001.png
    wallpaper = ,~/.config/wallpapers/001.png  
    splash = false
  '';
}
