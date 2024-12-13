{
  config,
  pkgs,
  ...
}: {
  users.groups = {
    media.gid = 1023;
  };
}
