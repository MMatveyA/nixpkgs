# Evince.

{ config, pkgs, lib, ... }:

with lib;

let cfg = config.programs.evince;

in {

  # Added 2019-08-09
  imports = [
    (mkRenamedOptionModule
      [ "services" "gnome3" "evince" "enable" ]
      [ "programs" "evince" "enable" ])
  ];

  ###### interface

  options = {

    programs.evince = {

      enable = mkEnableOption "Evince, the GNOME document viewer";

      package = mkPackageOption pkgs "evince" { };

    };

  };


  ###### implementation

  config = mkIf config.programs.evince.enable {

    environment.systemPackages = [ cfg.package ];

    services.dbus.packages = [ cfg.package ];

    systemd.packages = [ cfg.package ];

  };

}
