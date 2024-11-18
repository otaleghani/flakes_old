{ config, pkgs, ... }: {
  imports = [ ./hyprpaper.nix ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # enableNvidiaPatches = false;
    # systemd.extraCommands = [
    #   "eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg)"
    #   "export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID"
    #   "export SSH_AUTH_SOCK"
    #   "export GPG_AGENT_INFO"
    #   "export TERM=screen"
    #   "eval (ssh-agent -c)"
    #   "ssh-add ~/.ssh/github"
    # ];
    extraConfig = ''
            $mainMod = SUPER

            monitor=HDMI-A-1, 1920x1080, 0x0, 1
            monitor=eDP-1, 1920x1080, 1920x0, 1

            $base00 = rgb(${config.colorScheme.palette.base00})
            $base01 = rgb(${config.colorScheme.palette.base01})
            $base02 = rgb(${config.colorScheme.palette.base02})
            $base03 = rgb(${config.colorScheme.palette.base03})
            $base04 = rgb(${config.colorScheme.palette.base04})
            $base05 = rgb(${config.colorScheme.palette.base05})
            $base06 = rgb(${config.colorScheme.palette.base06})
            $base07 = rgb(${config.colorScheme.palette.base07})
            $base08 = rgb(${config.colorScheme.palette.base08})
            $base09 = rgb(${config.colorScheme.palette.base09})
            $base0A = rgb(${config.colorScheme.palette.base0A})
            $base0B = rgb(${config.colorScheme.palette.base0B})
            $base0C = rgb(${config.colorScheme.palette.base0C})
            $base0D = rgb(${config.colorScheme.palette.base0D})
            $base0E = rgb(${config.colorScheme.palette.base0E})
            $base0F = rgb(${config.colorScheme.palette.base0F})
            $base18 = rgb(${config.colorScheme.palette.base18})
            $base19 = rgb(${config.colorScheme.palette.base19})
            $base1A = rgb(${config.colorScheme.palette.base1A})
            $base1B = rgb(${config.colorScheme.palette.base1B})
            $base1C = rgb(${config.colorScheme.palette.base1C})
            $base1D = rgb(${config.colorScheme.palette.base1D})
            $base1E = rgb(${config.colorScheme.palette.base1E})
            $base1F = rgb(${config.colorScheme.palette.base1F})

            input {
              kb_layout = us
              kb_variant =
              kb_model =
              kb_options = caps:escape
              kb_rules =
            
              follow_mouse = 2 # 0|1|2|3
              float_switch_override_focus = 2
              numlock_by_default = true
            
              touchpad {
                natural_scroll = yes
              }
            
              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
            }

            general {
              gaps_in = 4
              gaps_out = 6
              border_size = 0
              col.active_border = $base0C $base1C
              col.inactive_border = $base04
              layout = dwindle # master|dwindle 
            }

            dwindle {
              no_gaps_when_only = false
              force_split = 0 
              special_scale_factor = 1.0
              split_width_multiplier = 1.0 
              use_active_for_splits = true
              pseudotile = yes 
              preserve_split = yes 
            }

            master {
            #  new_is_master = true
              special_scale_factor = 1.0
            #  new_is_master = true
              no_gaps_when_only = false
            }

            # cursor_inactive_timeout = 0
            decoration {
              # multisample_edges = true
              active_opacity = 1.0
              inactive_opacity = 1.0
              fullscreen_opacity = 1.0
              rounding = 4
              # blur = yes 
              # blur_size = 3
              # blur_passes = 1
              # blur_new_optimizations = true
              # blur_xray = true

              drop_shadow = true
              shadow_range = 4
              shadow_render_power = 3
              shadow_ignore_window = true
            # col.shadow = 
            # col.shadow_inactive
            # shadow_offset
            # dim_inactive = true
              dim_strength = 0.5 #0.0 ~ 1.0
      	dim_special = 0
              # blur_ignore_opacity = false
              col.shadow = rgba(1a1a1aee)
            }

            animations {
              enabled=1
              bezier = overshot, 0.13, 0.99, 0.29, 1.1
              animation = windows, 1, 4, default
              animation = windowsOut, 1, 5, default
              animation = border, 1, 5, default
              animation = fade, 1, 8, default
              animation = workspaces, 1, 6, default
            }

            gestures {
              workspace_swipe = true
              workspace_swipe_fingers = 4
              workspace_swipe_distance = 250
              workspace_swipe_invert = true
              workspace_swipe_min_speed_to_force = 15
              workspace_swipe_cancel_ratio = 0.5
              workspace_swipe_create_new = false
            }

            misc {
              disable_autoreload = true
              disable_hyprland_logo = true
              always_follow_on_dnd = true
              layers_hog_keyboard_focus = true
              # animate_manualresizes = false
              enable_swallow = true
              swallow_regex =
              focus_on_activate = true
            }

            bind = $mainMod, Return, exec, kitty
            bind = $mainMod SHIFT, Return, exec, kitty --class="termfloat"
            bind = $mainMod SHIFT, P, killactive,
            bind = $mainMod SHIFT, Q, exit,
            bind = $mainMod SHIFT, Space, togglefloating,
            bind = $mainMod, F, fullscreen
            bind = $mainMod, Y, pin
            bind = $mainMod, P, pseudo, # dwindle
            bind = $mainMod, C, togglesplit, # dwindle

            #-----------------------#
            # Toggle grouped layout #
            #-----------------------#
            # bind = $mainMod, K, togglegroup,
            bind = $mainMod, Tab, changegroupactive, f

            #------------#
            # change gap #
            #------------#
            # bind = $mainMod SHIFT, G,exec,hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"
            # bind = $mainMod , G,exec,hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"

            #--------------------------------------#
            # Move focus with mainMod + arrow keys #
            #--------------------------------------#
            bind = $mainMod, H, movefocus, l
            bind = $mainMod, L, movefocus, r
            bind = $mainMod, K, movefocus, u
            bind = $mainMod, J, movefocus, d

            #----------------------------------------#
            # Switch workspaces with mainMod + [0-9] #
            #----------------------------------------#
            bind = $mainMod, 1, workspace, 1
            bind = $mainMod, 2, workspace, 2
            bind = $mainMod, 3, workspace, 3
            bind = $mainMod, 4, workspace, 4
            bind = $mainMod, 5, workspace, 5
            bind = $mainMod, 6, workspace, 6
            bind = $mainMod, 7, workspace, 7
            bind = $mainMod, 8, workspace, 8
            bind = $mainMod, 9, workspace, 9
            bind = $mainMod, 0, workspace, 10
            # bind = $mainMod, L, workspace, +1
            # bind = $mainMod, H, workspace, -1
            bind = $mainMod, period, workspace, e+1
            bind = $mainMod, comma, workspace, e-1

            #-------------------------------#
            # special workspace(scratchpad) #
            #-------------------------------# 
            bind = $mainMod, Z, movetoworkspace,special
            bind = $mainMod, X, togglespecialworkspace

            #----------------------------------#
            # move window in current workspace #
            #----------------------------------#
            bind = $mainMod SHIFT, H, movewindow, l
            bind = $mainMod SHIFT, L, movewindow, r
            bind = $mainMod SHIFT, K, movewindow, u
            bind = $mainMod SHIFT, J, movewindow, d

            #---------------------------------------------------------------#
            # Move active window to a workspace with mainMod + ctrl + [0-9] #
            #---------------------------------------------------------------#
            bind = $mainMod CTRL, 1, movetoworkspace, 1
            bind = $mainMod CTRL, 2, movetoworkspace, 2
            bind = $mainMod CTRL, 3, movetoworkspace, 3
            bind = $mainMod CTRL, 4, movetoworkspace, 4
            bind = $mainMod CTRL, 5, movetoworkspace, 5
            bind = $mainMod CTRL, 6, movetoworkspace, 6
            bind = $mainMod CTRL, 7, movetoworkspace, 7
            bind = $mainMod CTRL, 8, movetoworkspace, 8
            bind = $mainMod CTRL, 9, movetoworkspace, 9
            bind = $mainMod CTRL, 0, movetoworkspace, 10
            bind = $mainMod CTRL, left, movetoworkspace, -1
            bind = $mainMod CTRL, right, movetoworkspace, +1
            # same as above, but doesnt switch to the workspace
            bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
            bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
            bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
            bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
            bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
            bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
            bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
            bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
            bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
            bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
            # Scroll through existing workspaces with mainMod + scroll
            bind = $mainMod, mouse_down, workspace, e+1
            bind = $mainMod, mouse_up, workspace, e-1

            #-------------------------------------------#
            # switch between current and last workspace #
            #-------------------------------------------#
            binds {
                 workspace_back_and_forth = 1 
                 allow_workspace_cycles = 1
            }
            bind=$mainMod,slash,workspace,previous

            #------------------------#
            # quickly launch program #
            #------------------------# 
            bind=$mainMod, B, exec, [workspace 2] firefox
            bind=$mainMod, M, exec, [workspace 9] hyprctl dispatch exec -- [workspace 9] kitty -e spotify_player
            bind=$mainMod, T, exec, [workspace 1] hyprctl dispatch exec -- [workspace 1] kitty -e cd $(find * -type d | fzf) && tmux

            #-----------------------------------------#
            # control volume,brightness,media players-#
            #-----------------------------------------#
            # bind=,XF87AudioRaiseVolume,exec, pamixer -i 5
            # bind=,XF86AudioLowerVolume,exec, pamixer -d 5
            # bind=,XF86AudioMute,exec, pamixer -t
            # bind=,XF86AudioMicMute,exec, pamixer --default-source -t
            # bind=,XF86MonBrightnessUp,exec, light -A 5
            # bind=,XF86MonBrightnessDown, exec, light -U 5
            # bind=,XF86AudioPlay,exec, mpc -q toggle 
            # bind=,XF86AudioNext,exec, mpc -q next 
            # bind=,XF86AudioPrev,exec, mpc -q prev

            #---------------#
            # waybar toggle #
            # --------------#
            bind=$mainMod,W,exec,killall -SIGUSR1 .waybar-wrapped

            #---------------#
            # resize window #
            #---------------#
            # bind=ALT,R,submap,resize
            # submap=resize
            # binde=,right,resizeactive,15 0
            # binde=,left,resizeactive,-15 0
            # binde=,up,resizeactive,0 -15
            # binde=,down,resizeactive,0 15
            # binde=,l,resizeactive,15 0
            # binde=,h,resizeactive,-15 0
            # binde=,k,resizeactive,0 -15
            # binde=,j,resizeactive,0 15
            # bind=,escape,submap,reset 
            # submap=reset

            bind=CTRL SHIFT, left, resizeactive,-15 0
            bind=CTRL SHIFT, right, resizeactive,15 0
            bind=CTRL SHIFT, up, resizeactive,0 -15
            bind=CTRL SHIFT, down, resizeactive,0 15
            bind=CTRL SHIFT, l, resizeactive, 15 0
            bind=CTRL SHIFT, h, resizeactive,-15 0
            bind=CTRL SHIFT, k, resizeactive, 0 -15
            bind=CTRL SHIFT, j, resizeactive, 0 15

            bindm = $mainMod, mouse:272, movewindow
            bindm = $mainMod, mouse:273, resizewindow

            #-----------#
            # rofi bind #
            #-----------#
            bind=CTRL SHIFT, Return, exec, rofi -show drun
            bind=CTRL SHIFT, Backspace, exec, ~/.config/scripts/power.sh
            bind=CTRL SHIFT, W, exec, ~/.config/scripts/wifi.sh
            bind=CTRL SHIFT, B, exec, ~/.config/scripts/bluetooth.sh


            #------------#
            # auto start #
            #------------#
            exec-once = waybar &
            exec-once = mako &
            exec-once = hyprpaper & 
            exec-once = wal -R & 
            exec-once = ~/.config/autostart/spotify-player.sh &
            exec-once = hyprctl dispatch moveworkspacetomonitor 1 eDP-1 && sleep 1 && ~/Automations/opentodo.sh

            #---------------#
            # windows rules #
            #---------------#
            #`hyprctl clients` get class、title...
            # windowrule=opacity 1 override 0.8 override,^(kitty)$
            # windowrule=float,title:^(Picture-in-Picture)$
            # windowrule=size 960 540,title:^(Picture-in-Picture)$
            # windowrule=move 25%-,title:^(Picture-in-Picture)$
            # windowrule=float,imv
            # windowrule=move 25%-,imv
            # windowrule=size 960 540,imv
            # windowrule=float,mpv
            # windowrule=move 25%-,mpv
            # windowrule=size 960 540,mpv
            # windowrule=float,danmufloat
            # windowrule=move 25%-,danmufloat
            # windowrule=pin,danmufloat
            # windowrule=rounding 5,danmufloat
            # windowrule=size 960 540,danmufloat
            # windowrule=float,termfloat
            # windowrule=move 25%-,termfloat
            # windowrule=size 960 540,termfloat
            # windowrule=rounding 5,termfloat
            # windowrule=float,nemo
            # windowrule=move 25%-,nemo
            # windowrule=size 960 540,nemo
            # windowrule=opacity 0.95,title:Telegram
            # windowrule=opacity 0.95,title:QQ
            # windowrule=opacity 0.95,title:NetEase Cloud Music Gtk4
            # windowrule=animation slide right,kitty
            # windowrule=workspace name:QQ, title:Icalingua++
            # windowrule=workspace name:TG, title:Telegram
            # windowrule=workspace name:Music, title:NetEase Cloud Music Gtk4
            # windowrule=workspace name:Music, musicfox
            # windowrule=float,ncmpcpp
            # windowrule=move 25%-,ncmpcpp
            # windowrule=size 960 540,ncmpcpp
            # windowrule=noblur,^(firefox)$

            #-----------------#
            # workspace rules #
            #-----------------#
            workspace=HDMI-A-1,10
    '';
  };
}
