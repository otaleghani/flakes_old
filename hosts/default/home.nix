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
		base00 = ""; #base
		base01 = ""; #mantle
		base02 = ""; #surface0
		base03 = ""; #surface1
		base04 = ""; #surface2
		base05 = ""; #text0
		base06 = ""; #text1
		base07 = ""; #text2

		base08 = "";
		base09 = "";
		base0A = "";
		base0B = "";
		base0C = "";
		base0D = "";
		base0E = "";
		base0F = "";

		base18 = "";
		base19 = "";
		base1A = "";
		base1B = "";
		base1C = "";
		base1D = "";
		base1E = "";
		base1F = "";
	}
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
