{pkgs}:
pkgs.writeShellApplication {
  name = "vmm";
  runtimeInputs = [pkgs.govc pkgs.pass];
  text = ''
       GOVC_PASSWORD="$(gopass -o IEL/adm-jaswinford)"

       export GOVC_URL=https://bapdv-esxi-vc01.iel.local
       export GOVC_USERNAME=adm-jaswinford@iel.local
    export GOVC_PASSWORD
       export GOVC_TLS_KNOWN_HOSTS=~/.govc/known_hosts

       govc "$@"
  '';
}
