{pkgs}:
pkgs.writeShellApplication {
  name = "commit";
  runtimeInputs = [pkgs.gum pkgs.git];
  text = ''
    TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
    SCOPE=$(gum input --placeholder "scope")

    # Since the scope is optional, wrap it in parentheses if it has a value.
    test -n "$SCOPE" && SCOPE="($SCOPE)"

    # Pre-populate the input with the type(scope): so that the user may change it
    SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
    DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

    # Commit these changes
    gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

    # Offer to push changes
    gum confirm "Push changes to origin?" && git push

    # Source: <github.com/charmbracelete/gum>
  '';
}
