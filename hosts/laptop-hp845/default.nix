{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/laptop-hp845
  ];

  networking.hostName = "laptop-hp845";
  system.stateVersion = "26.05";
}
