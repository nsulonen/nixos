{ config, lib, pkgs, ... }:

{
	fonts.fontconfig.enable = true;

	home.packages = with pkgs; [

		#cursors
		catppuccin-cursors

		#icons
    papirus-icon-theme

		#fonts
		font-awesome

	];

	imports = [
		./gtk.nix
		./cursor.nix
	];
}