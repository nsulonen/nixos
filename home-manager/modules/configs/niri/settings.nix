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
			{ command = ["swaybg" "-o" "*" "-i" "/home/niko/System/home-manager/walls/gradient3.png" "-m" "fill"]; }
		];

		environment = {
			QT_QPA_PLATFORM = "wayland";
			NIXOS_OZONE_WL = "1";
			DISPLAY = ":0";
		};

		prefer-no-csd = true;

		animations.enable = true;

		binds = with config.lib.niri.actions; {

			"Mod+T".action = spawn "alacritty";
			"Mod+D".action = spawn "fuzzel";
			"Mod+Alt+L".action = spawn "swaylock";

			"XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
    		"XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
			"XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
			"XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
			"XF86AudioPlay".action = spawn "playerctl" "play-pause";
			"XF86AudioNext".action = spawn "playerctl" "next";
			"XF86AudioPrev".action = spawn "playerctl" "previous";

			"Mod+O" = {
				repeat = false;
				action = toggle-overview;
			};

			"Mod+Q" = {
				repeat = false;
				action = close-window;
			};

			"Mod+Left".action = focus-column-left;
			"Mod+Right".action = focus-column-right;
			"Mod+Up".action = focus-window-up;
			"Mod+Down".action = focus-window-down;

			"Mod+Ctrl+Left".action = move-column-left;
			"Mod+Ctrl+Right".action = move-column-right;
			"Mod+Ctrl+Up".action = move-window-up;
			"Mod+Ctrl+Down".action = move-window-down;

			"Mod+Home".action = focus-column-first;
			"Mod+End".action = focus-column-last;
			"Mod+Ctrl+Home".action = move-column-to-first;
			"Mod+Ctrl+End".action = move-column-to-last;

			"Mod+Shift+Left".action = focus-monitor-left;
			"Mod+Shift+Right".action = focus-monitor-right;
			"Mod+Shift+Up".action = focus-monitor-up;
			"Mod+Shift+Down".action = focus-monitor-down;

			"Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
			"Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
			"Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
			"Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;

			"Mod+Page_Down".action = focus-workspace-down;
			"Mod+Page_Up".action = focus-workspace-up;
			"Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
			"Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;

			"Mod+Shift+Page_Down".action = move-workspace-down;
			"Mod+Shift+Page_Up".action = move-workspace-up;

			"Mod+WheelScrollDown" = {
				cooldown-ms = 150;
				action = focus-workspace-down;
			};
			"Mod+WheelScrollUp" = {
				cooldown-ms = 150;
				action = focus-workspace-up;
			};
			"Mod+Ctrl+WheelScrollDown" = {
				cooldown-ms = 150;
				action = move-column-to-workspace-down;
			};
			"Mod+Ctrl+WheelScrollUp" = {
				cooldown-ms = 150;
				action = move-column-to-workspace-up;
			};

			"Mod+WheelScrollLeft".action = focus-column-left;
			"Mod+WheelScrollRight".action = focus-column-right;
			"Mod+Ctrl+WheelScrollLeft".action = move-column-left;
			"Mod+Ctrl+WheelScrollRight".action = move-column-right;

			"Mod+Shift+WheelScrollUp".action = focus-column-left;
			"Mod+Shift+WheelScrollDown".action = focus-column-right;
			"Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;
			"Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;

			"Mod+1".action = focus-workspace 1;
			"Mod+2".action = focus-workspace 2;
			"Mod+3".action = focus-workspace 3;
			"Mod+4".action = focus-workspace 4;
			"Mod+5".action = focus-workspace 5;
			"Mod+6".action = focus-workspace 6;
			"Mod+7".action = focus-workspace 7;
			"Mod+8".action = focus-workspace 8;
			"Mod+9".action = focus-workspace 9;
			"Mod+Ctrl+1".action = move-column-to-index 1;
			"Mod+Ctrl+2".action = move-column-to-index 2;
			"Mod+Ctrl+3".action = move-column-to-index 3;
			"Mod+Ctrl+4".action = move-column-to-index 4;
			"Mod+Ctrl+5".action = move-column-to-index 5;
			"Mod+Ctrl+6".action = move-column-to-index 6;
			"Mod+Ctrl+7".action = move-column-to-index 7;
			"Mod+Ctrl+8".action = move-column-to-index 8;
			"Mod+Ctrl+9".action = move-column-to-index 9;

			"Mod+BracketLeft".action = consume-or-expel-window-left;
			"Mod+BracketRight".action = consume-or-expel-window-right;

			"Mod+Comma".action = consume-window-into-column;

			"Mod+Period".action = expel-window-from-column;

			"Mod+R".action = switch-preset-column-width;
			"Mod+Shift+R".action = switch-preset-window-height;
			"Mod+Ctrl+R".action = reset-window-height;
			"Mod+F".action = maximize-column;
			"Mod+Shift+F".action = fullscreen-window;

			"Mod+Ctrl+F".action = expand-column-to-available-width;

			"Mod+C".action = center-column;

			"Mod+Minus".action = set-column-width "-10%";
			"Mod+Equal".action = set-column-width "+10%";

			"Mod+Shift+Minus".action = set-window-height "-10%";
			"Mod+Shift+Equal".action = set-window-height "+10%";

			"Mod+V".action = toggle-window-floating;
			"Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

			"Mod+W".action = toggle-column-tabbed-display;

			"Print".action = screenshot;
			"Alt+Print".action = screenshot-window;

			"Mod+Escape" = {
				allow-inhibiting = false;
				action = toggle-keyboard-shortcuts-inhibit;
			};

			"Mod+Shift+E".action = quit;

			"Mod+Shift+P".action = power-off-monitors;
		};
	};
}