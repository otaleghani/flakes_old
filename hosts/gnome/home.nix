{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/fish.nix
    # ../../modules/home-manager/hyprland/hyprland.nix
    ../../modules/home-manager/waybar.nix
    ../../modules/home-manager/mako.nix
    ../../modules/home-manager/rofi.nix
    ../../modules/home-manager/neovim/neovim.nix
    ../../modules/home-manager/tmux.nix
  ];
  # colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;
  colorScheme = {
    palette = {
      base00 = "0c1018"; # base
      base01 = "161e2c"; # mantle
      base02 = "212d43"; # surface0
      base03 = "354769"; # surface1
      base04 = "405680"; # surface2
      base05 = "f7f8fb"; # text0
      base06 = "e9e9fb"; # text1
      base07 = "f4e5fa"; # text2

      base08 = "f3bccf"; # red
      base09 = "f2bfb5"; # orange
      base0A = "ced330"; # yellow
      base0B = "61e63d"; # green
      base0C = "39e693"; # acquamarine
      base0D = "9ed2ef"; # cyan
      base0E = "c8c7f5"; # purple
      base0F = "e3bef3"; # coral

      base18 = "f9dee7";
      base19 = "f8dfdb";
      base1A = "e7eb7b";
      base1B = "bef2b6";
      base1C = "b5f2ce";
      base1D = "d1e8f6";
      base1E = "e3e3f9";
      base1F = "f0dff9";

      base20 = "acbbd6"; # overlay1
      base21 = "99abcc"; # overlay0
      base22 = "879cc3"; # subtext1
      base23 = "4c6697"; # subtext0
      base24 = "000000"; # crust
    };
  };
  #  gtk.enable = true;
  #  gtk.cursorTheme.package = pkgs.bibata-cursors;
  #  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  #  gtk.theme.package = pkgs.adw-gtk3;
  #  gtk.theme.name = "adw-gtk3";
  #  #gtk.iconTheme.package = gruvboxPlus;
  #  #gtk.iconTheme.name = "GruvboxPlus";

  #  qt.enable = true;
  #  qt.platformTheme = "gtk";
  #  qt.style.name = "catppuccin-frappe";

  home.username = "oliviero";
  home.homeDirectory = "/home/oliviero";

  home.stateVersion = "23.11"; 

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
    "./.config/scripts/power.sh".source = ../../modules/scripts/power.sh;
    "./.config/scripts/power.sh".executable = true;
    "./.config/scripts/wifi.sh".source = ../../modules/scripts/wifi.sh;
    "./.config/scripts/wifi.sh".executable = true;
    "./.config/scripts/bluetooth.sh".source =
      ../../modules/scripts/bluetooth.sh;
    "./.config/scripts/bluetooth.sh".executable = true;

    # "./.config/scripts/cron/weather.sh".source =
    #   ../../modules/scripts/cron/weather.sh;
    # "./.config/scripts/cron/weather.sh".executable = true;
    # "./.config/scripts/cron/ansiweather.sh".source =
    #   ../../modules/scripts/cron/ansiweather.sh;
    # "./.config/scripts/cron/ansiweather.sh".executable = true;

    "./.config/autostart/spotify-player.sh".source =
      ../../modules/scripts/autostart/spotify-player.sh;
    "./.config/autostart/spotify-player.sh".executable = true;
  };

  home.sessionVariables = { EDITOR = "nvim"; };

  programs.home-manager.enable = true;
}
