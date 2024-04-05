{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "JetBrainsMono Nerd Font";	
    font_size = "12";
    foreground = "#${config.colorScheme.palette.base05}";
    background = "#${config.colorScheme.palette.base00}";
    shell = "fish";
  };
  programs.kitty.extraConfig = ''
    background_opacity 0.9

    selection_foreground #${config.colorScheme.palette.base00}
    selection_background #${config.colorScheme.palette.base06}

    cursor #${config.colorScheme.palette.base06}
    cursor_text_color #${config.colorScheme.palette.base00}

    url_color #${config.colorScheme.palette.base06}

    active_border_color #${config.colorScheme.palette.base07}
    inactive_border_color #${config.colorScheme.palette.base05}
    bell_border_color #${config.colorScheme.palette.base0A}

    wayland_titlebar_color #${config.colorScheme.palette.base00}

    active_tab_foreground #${config.colorScheme.palette.base04}
    active_tab_background #${config.colorScheme.palette.base0E}
    inactive_tab_foreground #${config.colorScheme.palette.base05}
    inactive_tab_background #${config.colorScheme.palette.base01}
    tab_bar_background #${config.colorScheme.palette.base04}

    mark1_foreground #${config.colorScheme.palette.base00}
    mark2_foreground #${config.colorScheme.palette.base00}
    mark3_foreground #${config.colorScheme.palette.base00}
    mark1_background #${config.colorScheme.palette.base07}
    mark2_background #${config.colorScheme.palette.base0E}
    mark2_background #${config.colorScheme.palette.base0F}

    color0	#${config.colorScheme.palette.base03}
    color8 	#${config.colorScheme.palette.base04}

    color1	#${config.colorScheme.palette.base08}
    color9 	#${config.colorScheme.palette.base18}

    color2 	#${config.colorScheme.palette.base0B}
    color10 	#${config.colorScheme.palette.base1B}

    color3 	#${config.colorScheme.palette.base0A}
    color11 	#${config.colorScheme.palette.base1A}

    color4 	#${config.colorScheme.palette.base0C}
    color12 	#${config.colorScheme.palette.base1C}

    color5 	#${config.colorScheme.palette.base0F}
    color13 	#${config.colorScheme.palette.base1F}

    color6 	#${config.colorScheme.palette.base0D}
    color14 	#${config.colorScheme.palette.base1D}

    color7 	#${config.colorScheme.palette.base05}
    color15 	#${config.colorScheme.palette.base06}
  '';
}
