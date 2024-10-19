{
  lib,
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [
    23231
    80
  ];
  services.soft-serve = {
    enable = true;
    settings = {
      name = "Adam's repos";
      log_format = "text";
      ssh = {
        listen_addr = ":23231";
        public_url = "ssh://git.jadam.space";
        max_timeout = 30;
        idle_timeout = 120;
      };
      http = {
        listen_addr = ":80";
        public_url = "https://git.jadam.space";
      };
      initial_admin_keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDt82hOsW8Jjz+mES7Y3bu1I5/+UKYVXkdXYKRa8xZtOtikbegjetGsua9HbKYViBNkPlyBXW0MFRR0bx9IuDPuSvDKKzJXgkclQa7y6Up1v5MIGEAR3RIU5mOdqwxahj+o5CQfTtAf2TNDLvkyMxiYcrfLbGANCmmHXkRNWcFApqdrLNX9atouVpASXi6nFPrC8xhhirxpdeJ02xipcxif6f6d2Da65NM9jICX+o0SNIy8hRcBZD05uvcaKNrk20fTIpLIAUQl6ELZw2SPwaNeGXIjTtB8lF6cWaTsardulj3DX7x+SoidQDK2XqrRc70O1rc+uxU17VyfdOTcaTlnnpTwodtrhrtTPRDob3/4ai7TZTq1RXNT/oWk0ZDWuVyNs5zGKix+W1ZAETcdmTuA6RYsl6eYadL9QVbrHYcS3tVFj6AWbarjwKvr1w/4IIjE6OoxZX/Is+kANRbBdffjjItx3wnvqZT0K4aibvLaioyK8ww3Ukzkwrj+FDOZo70="
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFoYQpT2tCHFrah/VGzBFIbjoS44dVY8YW38jSYlG8tF"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr4r4RDBqu4J/M/KOGKN4nDnvFB3Ve5jir9jlnws7Pc"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvF2MKcrH9mBfyP35oFQz1qHSrtPVrQ1KZGvO4lEdQawCU1h9M7LzmwmuzzL4G6FqlLcESdFtMOK0BCEAOX2T4Kh991jjriiamSi7jazQ5vVSTSVqkPAPmZQQVDId51ZpZAu5vZVa9U3BfFVWFVPXUAOyXPv1nli9xlmFZEYE/kvS9RRLS9kYHbNy3cSMd0LqWCCcoNDYYWM4juN3VOdKnU2TAmC1Gm5qrIdPU8RtdRURwSKeQ5yXGQtSE9OgGOmEZD0JSBCNzPR6vrwM31r1DUzUD98ySm0xxhYXyFqJKUdXH08V0nHC36PfMAB/eLHyn4Bao688i3A/9kxbwXXQAs9HaLy3rh/35+tMZ9vZ3A6ydw/iZDsV6tuTAf/NG/bKB0IM8dl6W/1RUMIlr+Wr2RrIpzHNzWS3GL2hEzVwaKT2zLCQkbUJe+zysel0o9bWADXR/XOdL0vsp6ycpHzTxY/QptOzKNYS2Zr3DFUUKp2Xcu62GhV66f/hJWqa9b7R8VyWR3DseqZY7ftO2PAM/1vcvspshnv0mXvgcWhywVPLT/3iiR5n+dyb3OpE4NVlL87TKKBF4yNoTj0WEGO0Dl5sFS8lY+IIq2nKOyNS9xDtJskQFVw7MkxsZmieUIGr2wbzcOVh0lIgfvHXt1YvKeGkfOe5U2eULzzPkF31E9Q=="
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBwjQbvOMVb2ae3VHS/vNsQVOSv4ucsqs4aHGy4KdtQT"
      ];
    };
  };
}
