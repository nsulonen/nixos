{ pkgs, ... }:
{
  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # Add other user-specific programs here
}
