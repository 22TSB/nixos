{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/laptop-s710
  ];

  networking.hostName = "laptop-s710";
  system.stateVersion = "26.05";
}
