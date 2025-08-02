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
				max-scroll-amount = "0%";
			};
		};

		outputs = {

			"DP-1" = {
				enable = true;
				focus-at-startup = true;
				scale = 1.0;

				mode = {
					width = 2560;
					height = 1440;
					refresh = 143.972;
				};

				position = {
					x = 1080;
					y = 480;
				};
			};

			"DP-3" = {
				enable = true;
				scale = 1.0;
				transform.rotation = 270;

				position = {
					x = 0;
					y = 0;
				};  
			};
		};

		layout = {

			gaps = 0;

			center-focused-column = "never";

			preset-column-widths = [
				{ proportion = 2. / 3.; }
				{ proportion = 1. / 2.; }
				{ proportion = 1. / 3.; }
			];

			default-column-width = { proportion = 1. / 1.; };

			focus-ring.enable = false;

			border.enable = false;

			shadow.enable = false;
		};

		spawn-at-startup = [
			{ command = ["waybar"]; }
			{ command = ["xwayland-satellite"]; }
			{ command = ["swaybg" "-o" "*" "-i" "/home/niko/System/home-manager/walls/wall9.jpg" "-m" "fill"]; }
		];

		environment = {
			QT_QPA_PLATFORM = "wayland";
			NIXOS_OZONE_WL = "1";
			DISPLAY = ":0";
		};

		prefer-no-csd = true;

		animations.enable = true;
	};
}