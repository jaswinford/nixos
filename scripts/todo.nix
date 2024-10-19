{pkgs}:
pkgs.writeShellApplication {
  name = "todo";
  runtimeInputs = [pkgs.glow];
  text = ''
    VAULT_PATH="$HOME/vault"

    get_todo () {
    echo "# $VAULT_PATH"
    echo "| File | LN | Item |"
    echo "|---|---|---|"
    find "$VAULT_PATH" -name "*.md" -exec egrep -Hn "\- \[[ o]\]" {} \; | sed "s,$VAULT_PATH/,," | cut -d: --output-delimiter='|' -f1-3
    }

    get_todo | glow
  '';
}
