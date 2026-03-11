# Automatically changes the wallpaper at regular intervals

{
  pkgs,
  config,
  ...
}:
let
  homeDir = config.home.homeDirectory;
  wallpapersDir = "${homeDir}/Pictures/wallpapers";
  bgLocation = "${homeDir}/.config/background";
in
{
  systemd.user.timers."auto-wallpaper" = {
    Install = {
      WantedBy = [ "timers.target" ];
    };

    Timer = {
      OnBootSec = "10m";
      OnUnitActiveSec = "10m";
      AccuracySec = "1us";
      Unit = "auto-wallpaper.service";
    };
  };

  systemd.user.services."auto-wallpaper" = {
    Unit = {
      Description = "Changes wallpaper (triggered by timer)";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "change-wallpaper" ''
        set -eu

        CURRENT_HASH=$(${pkgs.coreutils}/bin/sha256sum "${bgLocation}" | cut -d' ' -f1)
        WALLPAPERS=($(${pkgs.findutils}/bin/find "${wallpapersDir}" -type f))

        while true; do
            SELECTED=''${WALLPAPERS[$RANDOM % ''${#WALLPAPERS[@]}]}
            NEW_HASH=$(${pkgs.coreutils}/bin/sha256sum "$SELECTED" | cut -d' ' -f1)

            if [ "$NEW_HASH" != "$CURRENT_HASH" ]; then
                ${pkgs.coreutils}/bin/cp "$SELECTED" "${bgLocation}"
                break
            fi
        done
      ''}";
    };
  };
}
