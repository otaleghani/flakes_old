{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.nix-colors.homeManagerModules.default
  ];

  # bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "nfs" ];

  services.rpcbind.enable = true;

  # network
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 8080 8000 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # locales
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
    videoDrivers = [ "nvidia" ];
  };
  console.keyMap = "en";

  # users
  users.users.oliviero = {
    isNormalUser = true;
    description = "Oliviero";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
  services.getty.autologinUser = "oliviero";

  # home-manager 
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "oliviero" = import ./home.nix; };
  };
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
  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [
  #     "13 * * * * ~/path/to/script"
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    unityhub
    nixfmt            # nixpkgs
    neovim            # basic
    wget
    curl
    kitty
    git
    tmux
    fzf
    jq
    bc
    html-tidy
    httpie
    unzip
    aspell
    aspellDicts.en
    inkscape          # various programs
    gimp
    obs-studio
    qemu
    gnumake
    nasm              # x86-64 assembler
    gdb               # GNU Debugger
    waybar            # wayland
    rofi-wayland
    hyprpaper
    wl-clipboard
    libnotify         # notification
    inotify-tools
    mako
    networkmanager    # utils
    fcitx5
    btop
    htop
    brightnessctl
    imv
    nfs-utils
    cifs-utils
    rpcbind
    via
    calcurse
    grc               
    neofetch
    lshw
    tldr
    bat     # cat alternative
    eza     # ls alternative
    ranger            # file manager
    cinnamon.nemo
    ncmpcpp           # audio 
    mpc-cli
    mpd
    mpv
    spotify-player
    firefox           # browsers
    ani-cli           # fun
    mov-cli
    socat
    html-xml-utils
    vlc
    # iina            # mac video player
    nodejs_22         # programming 
    nodePackages.pnpm
    go
    rustc
    rustfmt
    rustup
    cargo
    cargo-binutils
    wasm-pack         # build tool rust -> wasm
    python3
    sqlite
    docker
    gcc
    libgcc
    gcc_multi
    luajit
    luajitPackages.lua-curl
    luajitPackages.nvim-nio
    luajitPackages.mimetypes
    luajitPackages.xml2lua
    # stdenv.cc.cc.lib // { isMultiLib = true; }
    glibc_multi
    nerdfonts         # fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    dart
    flutter
  ];
  programs.fish.enable = true;

  system.stateVersion = "23.11"; 

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # config.hardware.nvidia.open = true;
  hardware.nvidia.open = true;
  # nvidia
  hardware.opengl = {
    enable = true;
    # driSupport = true;
    driSupport32Bit = true;
  };
  
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia = {
    modesetting.enable = true;
    # powerManagement.enable = false;
    # powerManagement.finegrained = false;
    # open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable; 
    prime = {
      sync.enable = true;
      allowExternalGpu = true;
      intelBusId = "PCI:0:2:0";
		  nvidiaBusId = "PCI:1:0:0";
    };
  };

  xdg.portal.config.common.default = "*";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # sound
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
