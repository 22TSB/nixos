{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "bogdan22tsb";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bucharest";

  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.displayManager.ly.enable = true;
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

  programs.bash = {
    promptInit = ''
      figlet TSB
      '';
  };

  users.users.bogdan = {
    isNormalUser = true;
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
