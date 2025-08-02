{ config, lib, pkgs, ... }:

{
  imports = [
		./config.nix
		./niripkgs.nix
	];
}