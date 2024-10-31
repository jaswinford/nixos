{
  config,
  pkgs,
  ...
}: {
  nix.settings.trusted-users = ["adam"];
  users.users.adam = {
    extraGroups = ["wheel" "video" "docker" "media" "audio" "pipewire" "libvirtd" "scanner" "lp" "adbuser" "screen"];
    isNormalUser = true;
    home = "/home/adam";
    createHome = true;
    description = "Adam Swinford";
    hashedPassword = "$y$j9T$KEAbwUDRA25EKDkfg97et1$hu2NzPoMA9SasQqlxqlbvzcb/yZBI5LjsqN1YUJRDsD";
    shell = pkgs.zsh;
    uid = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIHgUdwMOZw1gVU6NlO91SchfVpwK8CU1PS/+FJvaxx0 adam@Freyr"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDt82hOsW8Jjz+mES7Y3bu1I5/+UKYVXkdXYKRa8xZtOtikbegjetGsua9HbKYViBNkPlyBXW0MFRR0bx9IuDPuSvDKKzJXgkclQa7y6Up1v5MIGEAR3RIU5mOdqwxahj+o5CQfTtAf2TNDLvkyMxiYcrfLbGANCmmHXkRNWcFApqdrLNX9atouVpASXi6nFPrC8xhhirxpdeJ02xipcxif6f6d2Da65NM9jICX+o0SNIy8hRcBZD05uvcaKNrk20fTIpLIAUQl6ELZw2SPwaNeGXIjTtB8lF6cWaTsardulj3DX7x+SoidQDK2XqrRc70O1rc+uxU17VyfdOTcaTlnnpTwodtrhrtTPRDob3/4ai7TZTq1RXNT/oWk0ZDWuVyNs5zGKix+W1ZAETcdmTuA6RYsl6eYadL9QVbrHYcS3tVFj6AWbarjwKvr1w/4IIjE6OoxZX/Is+kANRbBdffjjItx3wnvqZT0K4aibvLaioyK8ww3Ukzkwrj+FDOZo70="
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFoYQpT2tCHFrah/VGzBFIbjoS44dVY8YW38jSYlG8tF"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr4r4RDBqu4J/M/KOGKN4nDnvFB3Ve5jir9jlnws7Pc adam@wx-nixos"
    ];
    packages = with pkgs; [
      texliveFull
      rclone
    ];
  };
  programs.zsh.enable = true;
  home-manager.users.adam = import ./home.nix;
}
