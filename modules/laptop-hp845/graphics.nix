{ ... }:

{
  # AMD Radeon integrated graphics
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
