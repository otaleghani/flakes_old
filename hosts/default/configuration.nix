{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.nix-colors.homeManagerModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "it";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "it";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oliviero = {
    isNormalUser = true;
    description = "Oliviero";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "oliviero";

  # home-manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "oliviero" = import ./home.nix; };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.defaultFonts.monospace =
    [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK JP" ];
  fonts.fontconfig.defaultFonts.serif =
    [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK JP" ];
  fonts.fontconfig.defaultFonts.sansSerif =
    [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK JP" ];
  fonts.fontconfig.defaultFonts.emoji = [ "Noto Sans Color Emoji" ];

  # cronjobs
  services.cron = {
    enable = true;
    systemCronJobs = [
      "13 * * * * ~/.config/scripts/cron/weather -a Pontassieve,IT"
      "13 * * * * ~/.config/scripts/cron/crypto -a 0a221abc-73d9-4bae-8376-a11a2e05a0c2 -b KAS -c EUR"
    ];
  };

  environment.systemPackages = with pkgs; [
    # nixpkgs
    nixfmt

    # basic
    neovim
    wget
    kitty
    git
    tmux

    # terminal utils
    grc

    # wayland
    waybar
    rofi-wayland
    hyprpaper
    wl-clipboard

    # notification
    libnotify
    inotify-tools
    mako

    # utils
    networkmanager
    fcitx5
    btop
    htop
    brightnessctl
    imv
    fzf

    # file manager
    ranger
    cinnamon.nemo

    # audio / music
    ncmpcpp
    mpc-cli
    mpd
    mpv
    spotify-player

    # browsers
    firefox
    jq
    bc

    via
    calcurse

    # fun
    ani-cli

    # programming languages
    nodejs_21
    go
    cargo
    python3

    # fonts
    nerdfonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji


    nfs-utils
    cifs-utils
    rpcbind
  ];
  programs.fish.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Bluetooth
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  xdg.portal.config.common.default = "*";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
