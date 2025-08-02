{ config, lib, pkgs, ... }:

{
  programs.niri.settings = {

		hotkey-overlay = {
			skip-at-startup = true;
		};

		input = {

			keyboard = {
				xkb = {
					layout = "fi";
				};
				numlock = true;
			};

			touchpad = {
				tap = true;
				natural-scroll = true;
			};

			focus-follows-mouse = {
				enable = true;
			};
		};
	};
}