{pkgs}:
pkgs.writeShellApplication {
  name = "scan";
  text = ''
    scanimage -d brother5:bus4\;dev1 -o "$1" --AutoDocumentSize=yes --AutoDeskew=yes --resolution 300
  '';
}
