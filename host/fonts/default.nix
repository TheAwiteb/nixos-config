{
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu_font_family
      poppins
      # Arabic/Persian Font
      vazir-fonts
      # Nerd fonts
      (nerdfonts.override {
        fonts = [
          "UbuntuMono"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Poppins Medium"
          "Vazirmatn"
        ];
        sansSerif = [
          "Poppins"
          "Vazirmatn"
        ];
        monospace = [ "UbuntuMono Nerd Font" ];
      };
    };
  };
}
