{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      function start_gnome_keyring
          # Check if gnome-keyring-daemon is already running
          if not pgrep gnome-keyring-daemon > /dev/null
              # Start the daemon and capture its output
              set -l output (gnome-keyring-daemon --start --components=secrets,ssh,gpg)
      
              # Iterate over each line of the output
              for line in $output
                  # Use regex to extract variable names and values
                  switch $line
                      case 'export GNOME_KEYRING_CONTROL=*'
                          set -x GNOME_KEYRING_CONTROL (string replace -r '^export GNOME_KEYRING_CONTROL=(.*)$' '$1' $line)
                      case 'export GNOME_KEYRING_PID=*'
                          set -x GNOME_KEYRING_PID (string replace -r '^export GNOME_KEYRING_PID=(.*)$' '$1' $line)
                      case 'export SSH_AUTH_SOCK=*'
                          set -x SSH_AUTH_SOCK (string replace -r '^export SSH_AUTH_SOCK=(.*)$' '$1' $line)
                      case 'export GPG_AGENT_INFO=*'
                          set -x GPG_AGENT_INFO (string replace -r '^export GPG_AGENT_INFO=(.*)$' '$1' $line)
                  end
              end
          end
      end
      
      # Call the function to start the daemon
      start_gnome_keyring
    '';
    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }];
  };
}
