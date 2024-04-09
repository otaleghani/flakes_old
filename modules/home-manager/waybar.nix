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
          background-color: @base08;
          color: @base02;
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
        background-color: alpha(@base00,0.6);
	padding: 4px;
	border-radius: 8px;
      }
      window > box {
        padding: 4px;
      }
      #workspaces {
	padding: 0px;
	border-radius: 6px;
      }
      #workspaces button {
        padding: 2px;
	margin-right: 4px; 
	border-radius: 4px;
	color: @base05;
      }
      #workspaces button:last-child {
	margin-right: 0px;
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
        background: @base02;
      }
      tooltip label {
        color: @base06;
      }
      #custom-launcher {
        font-size: 12px;
        padding-left: 8px;
        padding-right: 6px;
        color: @base0D;
      }
      #mode, #custom-spotify, #clock, #memory, #temperature,#cpu, #mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal, #custom-hdd, #bluetooth {
        padding-left: 8px;
        padding-right: 8px;
      }
      #cpu {
        padding-left: 12px;
        color: @base0F;
      }
      #memory {
        color: @base0E;
      }
      #temperature {
        color: @base0D;
      }
      #custom-hdd {
        color: @base0C;
      }

      #clock {
        color: @base05;
      }

      #pulseaudio {
        color: @base09;
      }
      #backlight {
        color: @base0A;
      }
      #network {
        color: @base0C;
      }
      #network.disconnected {
        color: rgb(255, 255, 255);
      }
      #battery.charging, #battery.full, #battery.discharging {
        color: @base0B;
      }
      #battery.critical:not(.charging) {
        color: @base08;
      }
      #bluetooth {
        color: @base0E;
      }
      #custom-powermenu {
        color: @base08;
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
      #custom-spotify{
	color: @base06;
      }
    '';
    settings = [{
      "margin-top" = 4;
      "margin-right" = 4;
      "margin-left" = 4;
      "layer" = "top";
      "position" = "top";
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        #"idle_inhibitor"
        #"custom/wall"
        #"mpd"
        #"custom/cava-internal"
	"group/hardware"
	"custom/spotify"
      ];
      modules-center = [ "clock" ];
      modules-right = [
	#"custom/weather"
        "backlight"
	"bluetooth"
        "network"
        "pulseaudio"
        "battery"
        "custom/powermenu"
      ];
      "custom/spotify" = {
        "exec" = "echo \"$(cat ~/.cache/dump/current_song.json | jq -r '.item.name') - $(cat ~/.cache/dump/current_song.json | jq -r '.item.album.artists[0].name')\"";
	"signal" = 9;
	"on-click" = "spotify_player get key playback && pkill -RTMIN+9 waybar";
	"on-click-middle" = "hyprctl dispatch exec -- [workspace 9] kitty -e spotify_player";
      };
      "group/hardware" = {
        "orientation" = "inherit";
	"drawer" = {
          "transition-duration" = "500";
	};
        "modules" = [
		"cpu"
		"memory"
		"temperature"
		"custom/hdd"
	];
      };
      "custom/hdd" = {
        "format" = " {}";
        "exec" = "df -H | grep '/dev/nvme0n1p2' | awk '{print $(NF-1)}'";
	"tooltip-format" = "df -H";
	"on-click-middle" = "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };
      "bluetooth" = {
        "format-off" = "󰂲 {num_connections}";
	"format-on" = "󰂯 {num_connections}";
	"format-connected" = "󰂱 {num_connections}";
	"on-click" = "pkill rofi || sleep 0.1 && ~/.config/scripts/bluetooth.sh";
	"max-lenght" = 40;
      };
      "custom/weather" = {
        "exec" = "~/.config/scripts/cron/ansiweather.sh -l Pontassieve,IT -a false -p false -w false -d false -h false -s true | awk -F\" - UVI:\" '{sub(/.*: /, \"\", $1); print $1}' | awk '{print substr($0, length($0), 1) \" \" substr($0, 1, length($0)-1)}'";
	"on-click" = "notify-send \"$(cat ~/.forecast/forecast)\"";
      };
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill rofi || sleep 0.1 && rofi -no-lazy-grab -show drun -modi drun";
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
	"on-click-middle" = "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
	"on-click-middle" = "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
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
	"on-click" = "pkill rofi || sleep 0.1 && ~/.config/scripts/wifi.sh";
	"max-lenght" = 40;
      };
      "temperature" = {
        # "hwmon-path"= "${env:HWMON_PATH}";
        #"critical-threshold"= 80;
        "tooltip" = false;
        "format" = " {temperatureC}°C";
	"on-click-middle" = "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "pkill rofi || sleep 0.1 && ~/.config/scripts/power.sh";
        "tooltip" = false;
      };
    }];
  };
}
