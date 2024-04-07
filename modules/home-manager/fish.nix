{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "	set fish_greeting\n";
    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }];
  };
}
