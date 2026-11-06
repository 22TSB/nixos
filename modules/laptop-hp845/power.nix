{ ... }:

{
  # AMD Ryzen 5 PRO 5650U
  boot.kernelParams = [
    "amd_pstate=active"
  ];

  # Power management
  services.power-profiles-daemon.enable = true;
  services.tlp.enable = false;

  # Compressed memory swap
  zramSwap.enable = true;

  environment.sessionVariables = {
    # Forces Firefox and Chromium to use hardware acceleration windows
    MOZ_DISABLE_RDD_SANDBOX = "1"; 
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER_NAME = "radeonsi";
    
    # Forces Chromium-based browsers to use native Ozone platform for X11/Wayland
    NIXOS_OZONE_HWACCEL = "1";
  };
}
