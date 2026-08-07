{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables= true;

  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  networking.hostName = "bogdan22tsb";

  # wired network
  # networking.networkmanager.enable = true;

  # wireless network
  networking.networkmanager.enable = false;
  networking.wireless.enable = true;
  networking.wireless.networks = {
    "TP-Link_E982" = {
      psk = "42736479";
    };
    "TP-Link_E982_5G" = {
      psk = "42736479";
    };
  };

  time.timeZone = "Europe/Bucharest";

  services.displayManager.ly.enable = true;
  services.getty.autologinUser = "bogdan";

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;

    windowManager.oxwm.enable = true;
    windowManager.qtile.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./config/dwm;
      };
    };

    displayManager.sessionCommands = ''
        xrandr --output DisplayPort-1 --mode 3440x1440 --rate 180
        xwallpaper --center ~/walls/raekwon.png
        xset r rate 200 35 &
      '';
  };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.picom.enable = true;

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
  users.users.bogdan = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.steam.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  # automatic  updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
  
  # automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.hack
    nerd-fonts.caskaydia-mono
  ];

  # Enable udisks2 service for storage management
  services.udisks2.enable = true;

  # Enable GVfs for Dolphin to interact with storage devices
  services.gvfs.enable = true;


  # desktop settings
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
