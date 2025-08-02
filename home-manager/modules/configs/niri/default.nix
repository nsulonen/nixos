{ config, lib, pkgs, ... }:

{
  imports = [
		./settings.nix
		./niripkgs.nix
	];
}