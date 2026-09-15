-- Move active window to a workspace with SUPER + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 1"))
hl.bind("SUPER + SHIFT + 2", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 2"))
hl.bind("SUPER + SHIFT + 3", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 3"))
hl.bind("SUPER + SHIFT + 4", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 4"))
hl.bind("SUPER + SHIFT + 5", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 5"))
hl.bind("SUPER + SHIFT + 6", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 6"))
hl.bind("SUPER + SHIFT + 7", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 7"))


-- Switch workspaces with SUPER + [0-9]
hl.bind("SUPER + 1", hl.dsp.exec_cmd("hyprctl dispatch workspace 1"))
hl.bind("SUPER + 2", hl.dsp.exec_cmd("hyprctl dispatch workspace 2"))
hl.bind("SUPER + 3", hl.dsp.exec_cmd("hyprctl dispatch workspace 3"))
hl.bind("SUPER + 4", hl.dsp.exec_cmd("hyprctl dispatch workspace 4"))
hl.bind("SUPER + 5", hl.dsp.exec_cmd("hyprctl dispatch workspace 5"))
hl.bind("SUPER + 6", hl.dsp.exec_cmd("hyprctl dispatch workspace 6"))
hl.bind("SUPER + 7", hl.dsp.exec_cmd("hyprctl dispatch workspace 7"))


hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "m+1" }))

hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "m+1" }))


hl.bind("SUPER + SHIFT + LEFT", hl.dsp.exec_cmd("sh ~/Config/home-manager/programs/hypr/scripts/currentWorkspace.sh left"))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.exec_cmd("sh ~/Config/home-manager/programs/hypr/scripts/currentWorkspace.sh right"))
