# Copied from https://github.com/NixOS/nixpkgs/blob/baa55ff144a83ef79e72bd4d9047b68b9cbe6be8/pkgs/by-name/de/deja-dup/package.nix
#
# Changes:
# Apply ./dejadupignore-file.patch

{
  pkgs,
  ...
}:
let
  inherit (pkgs)
    lib
    stdenv
    fetchFromGitLab
    replaceVars
    meson
    ninja
    pkg-config
    vala
    gettext
    itstool
    desktop-file-utils
    glib
    glib-networking
    gtk4
    coreutils
    libsoup_3
    libsecret
    libadwaita
    wrapGAppsHook4
    libgpg-error
    json-glib
    duplicity
    rclone
    restic
    nix-update-script
    ;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "deja-dup";
  version = "48.4";

  src = fetchFromGitLab {
    domain = "gitlab.gnome.org";
    owner = "World";
    repo = "deja-dup";
    rev = finalAttrs.version;
    hash = "sha256-hFmuJqUHBMSsQW+a9GjI82wNOQjHt5f3rEkGUxYA6Y0=";
  };

  patches = [
    (replaceVars ./fix-paths.patch {
      inherit coreutils;
    })
    ./dejadupignore-file.patch
  ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    gettext
    itstool
    desktop-file-utils
    wrapGAppsHook4
  ];

  buildInputs = [
    libsoup_3
    glib
    glib-networking
    gtk4
    libsecret
    libadwaita
    libgpg-error
    json-glib
  ];

  mesonFlags = [
    "-Dduplicity_command=${lib.getExe duplicity}"
    "-Drclone_command=${lib.getExe rclone}"
    "-Denable_restic=true"
    "-Drestic_command=${lib.getExe restic}"
  ];

  preFixup = ''
    gappsWrapperArgs+=(
      # Required by duplicity
      --prefix PATH : "${lib.makeBinPath [ rclone ]}"
    )
  '';

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = with lib; {
    description = "Simple backup tool";
    longDescription = ''
      Déjà Dup is a simple backup tool. It hides the complexity \
      of backing up the Right Way (encrypted, off-site, and regular) \
      and uses duplicity as the backend.
    '';
    homepage = "https://apps.gnome.org/DejaDup/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ jtojnar ];
    teams = [ teams.gnome-circle ];
    platforms = platforms.linux;
    mainProgram = "deja-dup";
  };
})
