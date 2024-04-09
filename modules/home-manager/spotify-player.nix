{ config, pkgs, ... }:

{
  programs.spotify-player.extraConfig = ''
    [player_event_hook_command]
    command = "pkill -RTMIN+9 waybar"
  '';
}
