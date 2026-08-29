# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix

{ lib, ... }:
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
      accent-color = "purple";
      clock-format = "12h";
      clock-show-date = true;
      clock-show-seconds = false;
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = false;
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
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "brave-browser.desktop"
        "kitty.desktop"
      ];
      remember-mount-password = false;
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
  };
}
