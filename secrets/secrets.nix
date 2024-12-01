let
  adam-legion = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr4r4RDBqu4J/M/KOGKN4nDnvFB3Ve5jir9jlnws7Pc adam@wx-nixos";
  adam-Freyr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIHgUdwMOZw1gVU6NlO91SchfVpwK8CU1PS/+FJvaxx0 adam@Freyr";
  adam-IEL = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDt82hOsW8Jjz+mES7Y3bu1I5/+UKYVXkdXYKRa8xZtOtikbegjetGsua9HbKYViBNkPlyBXW0MFRR0bx9IuDPuSvDKKzJXgkclQa7y6Up1v5MIGEAR3RIU5mOdqwxahj+o5CQfTtAf2TNDLvkyMxiYcrfLbGANCmmHXkRNWcFApqdrLNX9atouVpASXi6nFPrC8xhhirxpdeJ02xipcxif6f6d2Da65NM9jICX+o0SNIy8hRcBZD05uvcaKNrk20fTIpLIAUQl6ELZw2SPwaNeGXIjTtB8lF6cWaTsardulj3DX7x+SoidQDK2XqrRc70O1rc+uxU17VyfdOTcaTlnnpTwodtrhrtTPRDob3/4ai7TZTq1RXNT/oWk0ZDWuVyNs5zGKix+W1ZAETcdmTuA6RYsl6eYadL9QVbrHYcS3tVFj6AWbarjwKvr1w/4IIjE6OoxZX/Is+kANRbBdffjjItx3wnvqZT0K4aibvLaioyK8ww3Ukzkwrj+FDOZo70=";

  aria = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBjgGCDTQJvuztaJD/zOYUkWoY4px5LP/jpANqyD2abZ";
  legion = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICkFQWYIqE/SEYMrLMuG6IEEC+k+yJSBoGVSsmjIdNdI root@wx-nixos";
  Freyr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFh6Zsb31NHYk8WhJ7W9CmCBGQOP4/jiAMLMn/SuuxqU root@Freyr";
  IEL-100123 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILK/Lgc17htGdHHVDvSo42H83uhdTmVTTMPg7aoO3oEQ root@IEL-100123";
in {
  "aria2-rpc-token.age".publicKeys = [aria adam-legion adam-Freyr];
  "legion.syncthing.key.age".publicKeys = [legion adam-legion];
  "legion.syncthing.cert.age".publicKeys = [legion adam-legion];  
  "freyr.syncthing.key.age".publicKeys = [Freyr adam-Freyr];
  "freyr.syncthing.cert.age".publicKeys = [Freyr adam-Freyr];
  "IEL-100123.syncthing.key.age".publicKeys = [adam-IEL IEL-100123];
  "IEL-100123.syncthing.cert.age".publicKeys = [adam-IEL IEL-100123];
  "wireless-keys.age".publicKeys = [adam-Freyr Freyr];
  "openai_api_key.age".publicKeys = [adam-Freyr adam-IEL Freyr IEL-100123];
}
