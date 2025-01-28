{...}: {
  fileSystems."/mnt/tvshows" = {
    device = "fs01:/tvshows";
    fsType = "nfs";
  };

  fileSystems."/mnt/movies" = {
    device = "fs01:/movies";
    fsType = "nfs";
  };

  fileSystems."/mnt/music" = {
    device = "fs01:/music";
    fsType = "nfs";
  };

  fileSystems."/mnt/books" = {
    device = "fs01:/books";
    fsType = "nfs";
  };

  fileSystems."/mnt/audiobooks" = {
    device = "fs01:/audiobooks";
    fsType = "nfs";
  };

  fileSystems."/mnt/downloads" = {
    device = "fs01:/downloads";
    fsType = "nfs";
  };
}
