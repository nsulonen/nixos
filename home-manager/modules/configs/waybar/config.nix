{ config, lib, pkgs, ... }:

{
	home.file = {
    ".config/waybar/config.jsonc".text = ''
		[    
				{
						"layer": "top", // Waybar at top layer
						"position": "left", // Waybar position (top|bottom|left|right)
						"spacing": 4, // Gaps between modules (4px)
						// "margin-top": 8,
						// "margin-bottom": 8,
						// "margin-left": 8,
								
						"modules-left": [
								"niri/workspaces"
								//"network"
								//"pulseaudio"
						],
								
						"modules-center": [
								
						],

						"modules-right": [
								"clock"
						],

						"clock": {
								// "timezone": "America/New_York",
								"format": "{:%H\n%M}",
								"tooltip": "false"
						},

						"niri/workspaces": {
							"format": "{icon}",
							"format-icons": {
								"active": "",
								"default": ""
							}
						},

						"network": {
								// "interface": "wlp2*", // (Optional) To force the use of this interface
								"format-wifi": "{essid} ({signalStrength}%) ",
								"format-ethernet": "{ipaddr}/{cidr} ",
								"tooltip-format": "{ifname} via {gwaddr} ",
								"format-linked": "{ifname} (No IP) ",
								"format-disconnected": "Disconnected ⚠",
								"format-alt": "{ifname}: {ipaddr}/{cidr}"
						},

						"pulseaudio": {
								// "scroll-step": 1, // %, can be a float
								"format": "{volume}% {icon} {format_source}",
								"format-bluetooth": "{volume}% {icon} {format_source}",
								"format-bluetooth-muted": " {icon} {format_source}",
								"format-muted": " {format_source}",
								"format-source": "{volume}% ",
								"format-source-muted": "",
								"format-icons": {
										"headphone": "",
										"hands-free": "",
										"headset": "",
										"phone": "",
										"portable": "",
										"car": "",
										"default": ["", "", ""]
								},
								"on-click": "pavucontrol"
						}
				},

				// Not in use at the moment
				{
						"layer": "top", // Waybar at top layer
						"position": "top", // Waybar position (top|bottom|left|right)
						"spacing": 4, // Gaps between modules (4px)
						"mode": "invisible",
								
						"modules-left": [

						],
								
						"modules-center": [
								
						],

						"modules-right": [
								"clock"
						],

						"clock": {
								// "timezone": "America/New_York",
								"format": "{:%b %d  %H:%M}"
						}
				}
				
		]
		'';
  };
}