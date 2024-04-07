{ config, pkgs, ... }:

{

  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      @define-color base00 #${config.colorScheme.palette.base00};
      @define-color base01 #${config.colorScheme.palette.base01};
      @define-color base02 #${config.colorScheme.palette.base02};
      @define-color base03 #${config.colorScheme.palette.base03};
      @define-color base04 #${config.colorScheme.palette.base04};
      @define-color base05 #${config.colorScheme.palette.base05};
      @define-color base06 #${config.colorScheme.palette.base06};
      @define-color base07 #${config.colorScheme.palette.base07};
      @define-color base08 #${config.colorScheme.palette.base08};
      @define-color base09 #${config.colorScheme.palette.base09};
      @define-color base0A #${config.colorScheme.palette.base0A};
      @define-color base0B #${config.colorScheme.palette.base0B};
      @define-color base0C #${config.colorScheme.palette.base0C};
      @define-color base0D #${config.colorScheme.palette.base0D};
      @define-color base0E #${config.colorScheme.palette.base0E};
      @define-color base0F #${config.colorScheme.palette.base0F};
      @define-color base18 #${config.colorScheme.palette.base18};
      @define-color base19 #${config.colorScheme.palette.base19};
      @define-color base1A #${config.colorScheme.palette.base1A};
      @define-color base1B #${config.colorScheme.palette.base1B};
      @define-color base1C #${config.colorScheme.palette.base1C};
      @define-color base1D #${config.colorScheme.palette.base1D};
      @define-color base1E #${config.colorScheme.palette.base1E};
      @define-color base1F #${config.colorScheme.palette.base1F};

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 10pt;
        font-weight: bold;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px;
        background-color: @base00;
      }
      #workspaces {
        padding-left: 4px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
      }
      #workspaces button.active {
        background-color: @base0D;
        color: @base01;
      }
      #workspaces button.urgent {
        color: @base01;
      }
      #workspaces button:hover {
        background-color: @base06;
        color: @base01;
      }
                  tooltip {
                    background: rgb(48, 45, 65);
                  }
                  tooltip label {
                    color: rgb(217, 224, 238);
                  }
            #custom-launcher {
                    font-size: 12px;
                    padding-left: 8px;
                    padding-right: 6px;
                    color: #7ebae4;
                  }
            #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
                    padding-left: 10px;
                    padding-right: 10px;
                  }
                  /* #mode { */
                  /* 	margin-left: 10px; */
                  /* 	background-color: rgb(248, 189, 150); */
                  /*     color: rgb(26, 24, 38); */
                  /* } */
            #memory {
                    color: rgb(181, 232, 224);
                  }
            #cpu {
                    color: rgb(245, 194, 231);
                  }
            #clock {
                    color: rgb(217, 224, 238);
                  }
            /* #idle_inhibitor {
                    color: rgb(221, 182, 242);
                  }*/
            #custom-wall {
                    color: rgb(221, 182, 242);
               }
            #temperature {
                    color: rgb(150, 205, 251);
                  }
            #backlight {
                    color: rgb(248, 189, 150);
                  }
            #pulseaudio {
                    color: rgb(245, 224, 220);
                  }
            #network {
                    color: #ABE9B3;
                  }

            #network.disconnected {
                    color: rgb(255, 255, 255);
                  }
            #battery.charging, #battery.full, #battery.discharging {
                    color: rgb(250, 227, 176);
                  }
            #battery.critical:not(.charging) {
                    color: rgb(242, 143, 173);
                  }
            #custom-powermenu {
                    color: rgb(242, 143, 173);
                  }
            #tray {
                    padding-right: 8px;
                    padding-left: 10px;
                  }
            #mpd.paused {
                    color: #414868;
                    font-style: italic;
                  }
            #mpd.stopped {
                    background: transparent;
                  }
            #mpd {
                    color: #c0caf5;
                  }
            #custom-cava-internal{
                    font-family: "JetBrainsMono Nerd Font" ;
                  }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [
        #"custom/launcher"
        "hyprland/workspaces"
        "temperature"
        #"idle_inhibitor"
        #"custom/wall"
        "mpd"
        #"custom/cava-internal"

      ];
      modules-center = [ "clock" ];
      modules-right = [
        "pulseaudio"
	"custom/weather"
        "backlight"
        "memory"
        "cpu"
        "network"
        "battery"
	"bluetooth"
        "custom/powermenu"
        "tray"
      ];
      "bluetooth" = {
        "format-off" = "󰂲";
	"format-on" = "󰂯";
	"format-connected" = "󰂱";
	"on-click" = "pkill rofi || ~/.config/scripts/bluetooth.sh";
      };
      "custom/weather" = {
        "exec" = "awk 'NR==1 {print substr($0, length($0), 1)}' ~/.forecast/forecast";
	"on-click" = "notify-send '$(cat ~/.forecast/forecast)'";
      };
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill rofi || rofi -no-lazy-grab -show drun -modi drun";
        "tooltip" = false;
      };
      "custom/wall" = {
        "on-click" = "wallpaper_random";
        "on-click-middle" = "default_wall";
        "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
        "format" = " 󰠖 ";
        "tooltip" = false;
      };
      "custom/cava-internal" = {
        "exec" = "sleep 1s && cava-internal";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "{icon}";
        "on-click" = "activate";
        # "on-scroll-up" = "hyprctl dispatch workspace e+1";
        # "on-scroll-down" = "hyprctl dispatch workspace e-1";
      };
      "idle_inhibitor" = {
        "format" = "{icon}";
        "format-icons" = {
          "activated" = "";
          "deactivated" = "";
        };
        "tooltip" = false;
      };
      "backlight" = {
        "device" = "intel_backlight";
        "on-scroll-up" = "brightnessctl set +1%";
        "on-scroll-down" = "brightnessctl set 1%-";
        "format" = "{icon} {percent}%";
        "format-icons" = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };
      "battery" = {
        "interval" = 10;
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        "format-full" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰍛 {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
      };
      "mpd" = {
        "max-length" = 25;
        "format" = "<span foreground='#bb9af7'></span> {title}";
        "format-paused" = " {title}";
        "format-stopped" = "<span foreground='#bb9af7'></span>";
        "format-disconnected" = "";
        "on-click" = "mpc --quiet toggle";
        "on-click-right" = "mpc update; mpc ls | mpc add";
        "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
        "on-scroll-up" = "mpc --quiet prev";
        "on-scroll-down" = "mpc --quiet next";
        "smooth-scrolling-threshold" = 5;
        "tooltip-format" =
          "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname} ({ipaddr})";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        #"tooltip" = false;
	"on-click" = "pkill rofi || ~/.config/scripts/wifi.sh";
      };
      "temperature" = {
        # "hwmon-path"= "${env:HWMON_PATH}";
        #"critical-threshold"= 80;
        "tooltip" = false;
        "format" = " {temperatureC}°C";
      };
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "pkill rofi || ~/.config/scripts/power.sh";
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
