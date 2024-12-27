{
  config,
  pkgs,
  ...
}: {
  users.groups = {
    media.gid = 1023;
    aria2.gid = 277;
  };
}
