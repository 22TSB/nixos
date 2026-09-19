{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/desktop-pc
  ];

  networking.hostName = "desktop";
  system.stateVersion = "26.05";
}
