{ lib
, stdenv
, meson
, fetchurl
, python3
, pkg-config
, gtk4
, glib
, gtksourceview5
, gsettings-desktop-schemas
, wrapGAppsHook4
, ninja
, gnome
, cairo
, enchant
, icu
, itstool
, libadwaita
, editorconfig-core-c
, libxml2
, appstream-glib
, desktop-file-utils
}:

stdenv.mkDerivation rec {
  pname = "gnome-text-editor";
  version = "45.3";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-text-editor/${lib.versions.major version}/${pname}-${version}.tar.xz";
    sha256 = "sha256-8//LEakt/QS6PDs9DmZ4R9REmiHgEq428H3aBax9OlI=";
  };

  nativeBuildInputs = [
    appstream-glib
    desktop-file-utils
    itstool
    libxml2 # for xmllint
    meson
    ninja
    pkg-config
    python3
    wrapGAppsHook4
  ];

  buildInputs = [
    cairo
    enchant
    icu
    glib
    gsettings-desktop-schemas
    gtk4
    gtksourceview5
    libadwaita
    editorconfig-core-c
  ];

  passthru = {
    updateScript = gnome.updateScript {
      packageName = "gnome-text-editor";
    };
  };

  meta = with lib; {
    homepage = "https://gitlab.gnome.org/GNOME/gnome-text-editor";
    description = "A Text Editor for GNOME";
    mainProgram = "gnome-text-editor";
    maintainers = teams.gnome.members;
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
  };
}
