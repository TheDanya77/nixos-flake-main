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
        modules-right = [ "cpu" "custom/gpu" "custom/keyboard-layout" "pulseaudio" "bluetooth" "network" "custom/shutdown" ];

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

        cpu = {
          interval = 2;
          format = " {usage}%";
          tooltip = true;
        };

        "custom/gpu" = {
          exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
          interval = 2;
          format = "󱤓 {}%";
          tooltip = false;
        };

        "custom/keyboard-layout" = {
          exec = "hyprctl devices -j | jq -r '.keyboards[] | select(.name==\"royuan-2.4g-wireless-keyboard\") | .active_keymap' | awk '{if ($1==\"English\") print \"EN\"; else if ($1==\"Ukrainian\") print \"UA\"}'";
          interval = 0.5;
          format = "⌨ {}";
          on-click = "hyprctl switchxkblayout royuan-2.4g-wireless-keyboard next";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            default = ["󰕿" "󰕿" "󰖀" "󰖀" "󰖀" "󰖀" "󰕾" "󰕾"];
          };
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };

        network = {
          format = "{ifname}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰌗 {ipaddr}";
          format-disconnected = "";

          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

          max-length = 50;
        };

        "custom/shutdown" = {

          format = "";
          on-click = "alacritty";
        };
      };
    };

    style =
      let
        bg-main = "#1e1e2e";
        bg-second = "#313244";
        border-color = "#45475a";
        text-color = "#cdd6f4";
        active-color = "#89b4fa";
        hover-color = "#45475a";
      in
      ''
        * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 13px;
          color: ${text-color};
        }

        window#waybar {

          border: 1px solid ${border-color};
          border-radius: 5px;
        }

        #workspaces button {
          padding: 0 7px;
          transition: all 0.3s ease;
          border-radius: 5px;
        }

        #workspaces button:hover {
          background-color: ${hover-color};
        }

        #workspaces button.active {
          background-color: ${active-color};
        }

        #clock, #cpu, #custom-gpu, #custom-keyboard-layout, #pulseaudio, #bluetooth, #network, #custom-shutdown {
          border: 1px solid ${border-color};
          background-color: ${bg-second};
          border-radius: 5px;
          padding: 0 7px;
        }

        #cpu, #custom-gpu, #custom-keyboard-layout, #pulseaudio, #bluetooth, #network {

          margin-right: 10px;
        }
      '';
  };
}
