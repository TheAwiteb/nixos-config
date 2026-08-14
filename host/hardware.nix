{
  config,
  pkgs,
  ...
}:
{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  security.rtkit.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    package = pkgs.mesa;
  };

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  # NVIDIA is not used for rendering on NixOS, but the HDMI port is wired to the
  # NVIDIA card. The Intel iGPU renders the desktop and the compositor outputs to
  # the NVIDIA card for external displays (reverse PRIME / output offloading).
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the open-source NVIDIA kernel module
    open = true;
    nvidiaSettings = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = false;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
