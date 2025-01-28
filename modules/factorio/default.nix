{...}: {
  services.factorio = {
    enable = true;
    openFirewall = true;

    # Factorio.com login
    username = "talwyn";
    token = "0813c19fe29f1696a0411c5e9595ff";

    # Save management
    autosave-interval = 5;
    nonBlockingSaving = true;
    loadLatestSave = true;
    saveName = "grotto";

    # Game listing
    public = true;
    game-password = "bathysphere";
    game-name = "Gamers Grotto";
    description = "Private server for the members of the Gamers Grotto";

    # Player Management
    admins = [
      "talwyn"
    ];
  };
}
