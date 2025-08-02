{ config, lib, pkgs, ... }:

{
	programs.gh = {
		enable = true;
		hosts = {
			"github.com" = {
				user = "nsulonen";
			};
		};
	};
}