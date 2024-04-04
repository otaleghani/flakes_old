{ config, pkgs, ... }:

{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			echo "lmao"
		'';
	};
}
