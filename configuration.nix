{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
