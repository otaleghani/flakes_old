{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../../modules/home-manager/kitty.nix 
	  ../../modules/home-manager/fish.nix 
 	  ../../modules/home-manager/hyprland.nix 
 	  ../../modules/home-manager/waybar.nix 
  ];
  # colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;
  colorScheme = {
	  palette = {
	  	base00 = "041218"; #base
	  	base01 = "061B24"; #mantle
	  	base02 = "092938"; #surface0
	  	base03 = "0E3E52"; #surface1
	  	base04 = "114C66"; #surface2
	  	base05 = "F2FBFF"; #text0
	  	base06 = "F9E8EF"; #text1
	  	base07 = "EDE0F9"; #text2

	  	base08 = "FC8D85"; #red
	  	base09 = "FFC4A1"; #orange
	  	base0A = "FFE991"; #yellow
	  	base0B = "99EB9B"; #green
	  	base0C = "91E0D5"; #acquamarine
	  	base0D = "80D4FF"; #cyan
	  	base0E = "EDAAFF"; #purple
	  	base0F = "FFB3D1"; #coral

	  	base18 = "E37F78";
	  	base19 = "EEB796";
	  	base1A = "F3DE8A";
	  	base1B = "88D18A";
	  	base1C = "81C8BE";
	  	base1D = "74C0E7";
	  	base1E = "D99BE9";
	  	base1F = "F0A8C5";
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

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "oliviero";
  home.homeDirectory = "/home/oliviero";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

	(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/oliviero/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
