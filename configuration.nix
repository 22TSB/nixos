{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  # legacy
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";
 
  # uefi
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables= true;

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

  services.xserver.windowManager.oxwm.enable = true;

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = ./config/dwm;
    };
  };

  services.xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      windowManager.qtile.enable = true;
      displayManager.sessionCommands = ''
        xwallpaper --center ~/walls/rae.png
        xset r rate 200 35 &
      '';
  };

  services.picom.enable = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  users.users.bogdan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    alacritty
  ];

  # automatic  updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
  
  # automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
