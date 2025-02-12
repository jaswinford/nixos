{...}: {
  fileSystems."/export/tvshows" = {
    device = "/mnt/tvshows";
    options = ["bind"];
  };

  fileSystems."/export/movies" = {
    device = "/mnt/movies";
    options = ["bind"];
  };

  fileSystems."/export/music" = {
    device = "/mnt/music";
    options = ["bind"];
  };

  fileSystems."/export/books" = {
    device = "/mnt/books";
    options = ["bind"];
  };

  fileSystems."/export/audiobooks" = {
    device = "/mnt/audiobooks";
    options = ["bind"];
  };

  fileSystems."/export/downloads" = {
    device = "/mnt/downloads";
    options = ["bind"];
  };

  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;

    exports = ''
      /export             10.0.1.0/24(rw,sync,no_subtree_check,crossmnt,fsid=0) 100.119.133.6(rw,sync,no_subtree_check,crossmnt,fsid=0)
      /export/tvshows     10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
      /export/movies      10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
      /export/music       10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
      /export/books       10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
      /export/audiobooks  10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
      /export/downloads   10.0.1.0/24(rw,sync,no_subtree_check) 100.119.133.6(rw,sync,no_subtree_check)
    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [111 2049 4000 4001 4002 20048];
    allowedUDPPorts = [111 2049 4000 4001 4002 20048];
  };
}
