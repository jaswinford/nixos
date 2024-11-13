# /etc/nixos/wireless.nix
{
  config,
  pkgs,
  ...
}: {
  age.secrets.wireless-keys = {
    file = ../../secrets/wireless-keys.age;
  };

  networking.wireless.secretsFile = config.age.secrets.wireless-keys.path;
  networking.wireless.enable = true;

  networking.wireless.networks."Rogers Inc." = {
    pskRaw = "ext:psk_RogersInc";
  };

  networking.wireless.networks."Adam Hotspot cbee" = {
    pskRaw = "ext:psk_AdamHotspotcbee";
    priority = 1000;
  };

  networking.wireless.networks."Grand Geneva" = {
    priority = -100;
  };

  networking.wireless.networks."LAN Down Under" = {
    pskRaw = "ext:psk_LANDownUnder";
  };
  networking.wireless.networks.CCTMBHM = {
    pskRaw = "ext:psk_CCTMBHM";
  };

  networking.wireless.networks.Ragnarok = {
    pskRaw = "ext:psk_Ragnarok";
    priority = 100;
  };
  networking.wireless.networks.IEL-Guest = {
    priority = -100;
  };
  networking.wireless.networks.Thor = {
    pskRaw = "ext:psk_Thor";
  };
}
