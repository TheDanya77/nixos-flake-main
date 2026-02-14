{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin = "5px";

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          all-outputs = false;
          active-only = false;
          persistent-workspaces = {
            "DP-3" = [ 1 2 3 4 ];
            "HDMI-A-1" = [ 5 6 7 ];
          };
        };

        clock = {
          tooltip = false;
          format = "{:%d of %B - %H:%M:%S}";
          interval = 1;
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
        };

        network = {
          format = "{ifname}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰌗 {ipaddr}";
          format-disconnected = "";
          # tooltip-format = "{ifname} via {gwaddr} 󰊗";
          # tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          # tooltip-format-ethernet = "{ifname} ";
          # tooltip-format-disconnected = "Disconnected";

          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

          max-length = 50;
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "{volume}% 󰝟";
          format-icons = {
            default = ["󰕿" "󰖀" "󰖀" "󰕾" "󰕾"];
          };
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }

      window#waybar {
        border: 1px solid #45475a;
        border-radius: 5px;
      }

      #workspaces button {
        padding: 0 7px;
        color: #cdd6f4;
        transition: all 0.3s ease;
        border-radius: 5px;
      }

      #workspaces button:hover {
        background-color: #45475a;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        background-color: #89b4fa;
        color: #1e1e2e;
      }

      #pulseaudio {

        margin-right: 10px;
      }

      #network {

        margin-right: 10px;
      }
    '';
  };
}
