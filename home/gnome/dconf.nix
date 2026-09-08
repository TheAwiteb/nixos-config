# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix

{ pkgs, lib, ... }:
with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/Music" = {
      repeat = "shuffle";
    };

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      indent-style = "space";
      right-margin-position = mkUint32 80;
      show-line-numbers = true;
      show-map = false;
      show-right-margin = false;
      spellcheck = false;
      style-scheme = "classic-dark";
      tab-width = mkUint32 4;
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///home/awiteb/.config/background";
      picture-uri-dark = "file:///home/awiteb/.config/background";
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = false;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
      ];
      sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "ara"
        ])
      ];
      xkb-options = [
        "terminate:ctrl_alt_bksp"
        "lv3:ralt_switch"
      ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      clock-format = "12h";
      clock-show-date = true;
      clock-show-seconds = false;
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      cursor-blink = true;
      cursor-blink-time = 1000;
      cursor-size = 24;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "Vazirmatn  10";
      enable-animations = true;
      enable-hot-corners = false;
      font-name = "Vazirmatn  10";
      icon-theme = "Adwaita";
      monospace-font-name = "Hack  10";
      scaling-factor = mkUint32 1;
      show-battery-percentage = false;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-left = [ "<Control><Super>bracketleft" ];
      move-to-workspace-right = [ "<Control><Super>bracketright" ];
      switch-input-source = [ "<Super>space" ];
      switch-to-workspace-left = [ "<Super>bracketleft" ];
      switch-to-workspace-right = [ "<Super>bracketright" ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Shift><Control>equal" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 3;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
      start-in-incognito-mode = true;
    };

    "org/gnome/file-roller/file-selector" = {
      show-hidden = false;
      sidebar-size = 300;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 923;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/compression" = {
      default-compression-format = "zip";
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/shell" = {
      always-show-log-out = true;
      disable-user-extensions = false;
      disable-extension-version-validation = true;
      enabled-extensions = [
        pkgs.gnomeExtensions.open-bar.extensionUuid
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
      ];
      disabled-extensions = [ ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "brave-browser.desktop"
        "kitty.desktop"
      ];
      remember-mount-password = false;
    };

    "org/gnome/shell/extensions/openbar@neuromorph" = {
      accent-color = [
        "0.600"
        "0.757"
        "0.945"
      ];
      accent-override = true;
      apply-accent-shell = true;
      apply-all-shell = true;
      apply-menu-notif = true;
      apply-menu-shell = true;
      auto-bgalpha = true;
      autofg-bar = true;
      autofg-menu = false;
      autohg-bar = true;
      autohg-menu = true;
      autotheme-dark = "Dark";
      autotheme-font = true;
      autotheme-refresh = true;
      balpha = 0.75;
      bartype = "Floating";
      bcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      bg-change = true;
      bgalpha = 0.9;
      bgalpha-wmax = 1.0;
      bgalpha2 = 0.25;
      bgcolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      bgcolor-wmax = [
        "0.118"
        "0.118"
        "0.118"
      ];
      bgcolor2 = [
        "0.024"
        "0.180"
        "0.251"
      ];
      bgpalette = true;
      bguri = "file:///home/awiteb/.config/background";
      border-wmax = true;
      bottom-margin = 3.0;
      boxalpha = 0.0;
      boxcolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      bradius = 50.0;
      buttonbg-wmax = true;
      bwidth = 1.1;
      candy1 = [
        "0.024"
        "0.180"
        "0.251"
      ];
      candy13 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      candy16 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      candy2 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      candy4 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      candy5 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      candy6 = [
        "0.560"
        "0.180"
        "0.430"
      ];
      candyalpha = 0.53;
      candybar = false;
      count1 = 367226;
      count10 = 93;
      count11 = 25;
      count12 = 2;
      count2 = 200666;
      count3 = 32227;
      count4 = 8933;
      count5 = 5974;
      count6 = 5283;
      count7 = 2410;
      count8 = 1983;
      count9 = 178;
      cust-margin-wmax = true;
      dark-accent-color = [
        "0.600"
        "0.757"
        "0.945"
      ];
      dark-bcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-bgcolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      dark-bgcolor-wmax = [
        "0.118"
        "0.118"
        "0.118"
      ];
      dark-bgcolor2 = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-bguri = "file:///home/awiteb/.config/background";
      dark-boxcolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      dark-candy1 = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-candy13 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      dark-candy16 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      dark-candy2 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      dark-candy4 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      dark-candy5 = [
        "0.569"
        "0.255"
        "0.675"
      ];
      dark-candy6 = [
        "0.560"
        "0.180"
        "0.430"
      ];
      dark-dbgcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-fgcolor = [
        "1.000"
        "1.000"
        "1.000"
      ];
      dark-hcolor = [
        "0.980"
        "0.835"
        "0.627"
      ];
      dark-hscd-color = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-iscolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      dark-mbcolor = [
        "0.980"
        "0.835"
        "0.627"
      ];
      dark-mbgcolor = [
        "0.102"
        "0.145"
        "0.169"
      ];
      dark-mfgcolor = [
        "0.753"
        "0.749"
        "0.737"
      ];
      dark-mhcolor = [
        "0.180"
        "0.286"
        "0.396"
      ];
      dark-mscolor = [
        "0.180"
        "0.286"
        "0.396"
      ];
      dark-mshcolor = [
        "0.000"
        "0.000"
        "0.000"
      ];
      dark-palette1 = [
        "6"
        "46"
        "64"
      ];
      dark-palette10 = [
        "57"
        "101"
        "91"
      ];
      dark-palette11 = [
        "106"
        "140"
        "102"
      ];
      dark-palette12 = [
        "92"
        "64"
        "140"
      ];
      dark-palette2 = [
        "241"
        "166"
        "132"
      ];
      dark-palette3 = [
        "83"
        "86"
        "86"
      ];
      dark-palette4 = [
        "53"
        "77"
        "82"
      ];
      dark-palette5 = [
        "166"
        "83"
        "90"
      ];
      dark-palette6 = [
        "43"
        "60"
        "71"
      ];
      dark-palette7 = [
        "251"
        "243"
        "211"
      ];
      dark-palette8 = [
        "250"
        "213"
        "160"
      ];
      dark-palette9 = [
        "46"
        "73"
        "101"
      ];
      dark-shcolor = [
        "0.000"
        "0.000"
        "0.000"
      ];
      dark-smbgcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-vw-color = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dark-winbcolor = [
        "0.475"
        "0.678"
        "0.922"
      ];
      dashdock-style = "Bar";
      dbgcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      dbradius = 76.0;
      default-font = "Sans 12";
      disize = 42.0;
      fgalpha = 1.0;
      fgcolor = [
        "1.000"
        "1.000"
        "1.000"
      ];
      gradient = true;
      gradient-direction = "vertical";
      gtk-transparency = 0.51;
      hcolor = [
        "0.980"
        "0.835"
        "0.627"
      ];
      heffect = false;
      height = 28.0;
      hscd-color = [
        "0.024"
        "0.180"
        "0.251"
      ];
      import-export = false;
      isalpha = 0.91;
      iscolor = [
        "0.141"
        "0.196"
        "0.235"
      ];
      light-bguri = "file:///home/awiteb/.config/background";
      light-palette1 = [
        "6"
        "46"
        "64"
      ];
      light-palette10 = [
        "57"
        "101"
        "91"
      ];
      light-palette11 = [
        "106"
        "140"
        "102"
      ];
      light-palette12 = [
        "92"
        "64"
        "140"
      ];
      light-palette2 = [
        "241"
        "166"
        "132"
      ];
      light-palette3 = [
        "83"
        "86"
        "86"
      ];
      light-palette4 = [
        "53"
        "77"
        "82"
      ];
      light-palette5 = [
        "166"
        "83"
        "90"
      ];
      light-palette6 = [
        "43"
        "60"
        "71"
      ];
      light-palette7 = [
        "251"
        "243"
        "211"
      ];
      light-palette8 = [
        "250"
        "213"
        "160"
      ];
      light-palette9 = [
        "46"
        "73"
        "101"
      ];
      margin = 4.0;
      margin-wmax = 0.0;
      mbalpha = 1.0;
      mbcolor = [
        "0.980"
        "0.835"
        "0.627"
      ];
      mbg-gradient = true;
      mbgalpha = 0.9;
      mbgcolor = [
        "0.102"
        "0.145"
        "0.169"
      ];
      menu-radius = 30.0;
      mfgalpha = 1.0;
      mfgcolor = [
        "0.753"
        "0.749"
        "0.737"
      ];
      mhcolor = [
        "0.180"
        "0.286"
        "0.396"
      ];
      monitor-height = 1080;
      monitor-width = 1920;
      mscolor = [
        "0.180"
        "0.286"
        "0.396"
      ];
      mshcolor = [
        "0.000"
        "0.000"
        "0.000"
      ];
      neon = false;
      neon-wmax = false;
      palette1 = [
        "6"
        "46"
        "64"
      ];
      palette10 = [
        "57"
        "101"
        "91"
      ];
      palette11 = [
        "106"
        "140"
        "102"
      ];
      palette12 = [
        "92"
        "64"
        "140"
      ];
      palette2 = [
        "241"
        "166"
        "132"
      ];
      palette3 = [
        "83"
        "86"
        "86"
      ];
      palette4 = [
        "53"
        "77"
        "82"
      ];
      palette5 = [
        "166"
        "83"
        "90"
      ];
      palette6 = [
        "43"
        "60"
        "71"
      ];
      palette7 = [
        "251"
        "243"
        "211"
      ];
      palette8 = [
        "250"
        "213"
        "160"
      ];
      palette9 = [
        "46"
        "73"
        "101"
      ];
      pause-reload = false;
      position = "Top";
      radius-bottomleft = true;
      reloadstyle = false;
      set-bottom-margin = false;
      set-fullscreen = true;
      set-notif-position = true;
      set-overview = true;
      shadow = false;
      shcolor = [
        "0.000"
        "0.000"
        "0.000"
      ];
      smbgcolor = [
        "0.024"
        "0.180"
        "0.251"
      ];
      smbgoverride = true;
      trigger-autotheme = true;
      trigger-reload = true;
      view-hint = 9;
      vw-color = [
        "0.024"
        "0.180"
        "0.251"
      ];
      width-bottom = false;
      width-left = false;
      width-right = false;
      width-top = true;
      winbcolor = [
        "0.475"
        "0.678"
        "0.922"
      ];
      wmax-hbarhint = false;
      wmaxbar = false;
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
  };
}
