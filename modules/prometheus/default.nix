{
  lib,
  config,
  pkgs,
  ...
}: {

  services.prometheus = {
    enable = true;
    port = 9001;
    scrapeConfigs = [
      {
        job_name = "factorio";
        static_configs = [{
          targets = [ "10.0.1.60:]
        }]
      }
    ]
  };
}
