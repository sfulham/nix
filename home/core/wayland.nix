{
  inputs,
  pkgs,
  ...
}:
{
  #home.file.".icons/default".source = pkgs.catppuccin-cursors.mochaMauve;
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Black";
    size = 22;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprtrails
      #            pkgs.hyprlandPlugins.hyprspace
      pkgs.hyprlandPlugins.csgo-vulkan-fix
    ];
    systemd.variables = [ "--all" ];
    settings = {
      exec-once = [
        "waybar"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor Posy_Cursor_Black 22"
      ];
      monitor = [
        "eDP-1,highres,0x0,1.25,vrr,1,bitdepth,10"
        "DP-1,highres,0x-1082,auto"
        "HDMI-A-1,highres,0x-1082,auto"
      ];
      env = [
        "QT_QPA_PLATFORM,wayland"
        "XCURSOR_THEME,Posy_Cursor_Black"
        "XCURSOR_SIZE,22"
        "HYPRCURSOR_THEME,Posy_Cursor_Black"
        "HYPRCURSOR_SIZE,22"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "_JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
      ];
      "$mod" = "SUPER";
      bind = [
        # Launch
        "$mod, space, exec, ${pkgs.tofi}/bin/tofi-drun --drun-launch=true"
        "$mod, T, exec, ${pkgs.ghostty}/bin/ghostty"
        # "$mod, Tab, overview:toggle"
        "$mod, E, exit"
        "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        # Windows
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, J, togglesplit"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "$mod SHIFT, l, resizeactive, 15, 0"
        "$mod SHIFT, h, resizeactive, -15, 0"
        "$mod SHIFT, k, resizeactive, 0, -15"
        "$mod SHIFT, j, resizeactive, 0, 15"

        "$mod CTRL, 1, movetoworkspace, 1"
        "$mod CTRL, 2, movetoworkspace, 2"
        "$mod CTRL, 3, movetoworkspace, 3"
        "$mod CTRL, 4, movetoworkspace, 4"
        "$mod CTRL, 5, movetoworkspace, 5"
        "$mod CTRL, 6, movetoworkspace, 6"
        "$mod CTRL, 7, movetoworkspace, 7"
        "$mod CTRL, 8, movetoworkspace, 8"
        "$mod CTRL, 9, movetoworkspace, 9"
        "$mod CTRL, 0, movetoworkspace, 10"
        "$mod CTRL, -, movetoworkspace, special"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, equal, togglespecialworkspace"

      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

    package = null;
    portalPackage = null;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          color = "rgb(36, 39, 58)";
          path = "${pkgs.hyprland}/share/hypr/wall2.png";

          new_optimizations = true;
          blur_size = 3;
          blur_passes = 2;
          noise = 0.0117;
          contrast = 1.000;
          brightness = 1.0000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 3;
          outer_color = "rgb(198, 160, 246)";
          inner_color = "rgb(36, 39, 58)";
          font_color = "rgb(198, 160, 246)";
          fail_color = "rgb(237, 135, 150)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;
          fade_on_empty = false;
          placeholder_text = "Password...";
          dots_size = 0.2;
          dots_spacing = 0.64;
          dots_center = true;
          position = "0, 140";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        {
          monitor = "";
          # text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
          text = "$TIME";
          font_size = 64;
          font_family = "JetBrains Mono Nerd Font 10";
          color = "rgb(198, 160, 246)";
          position = "0, 16";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "Hello <span text_transform=\"capitalize\" size=\"larger\">$USER!</span>";
          color = "rgb(198, 160, 246)";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Current Layout : $LAYOUT";
          color = "rgb(198, 160, 246)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 20";
          halign = "center";
          valign = "bottom";
        }
        /*
             {
            monitor = "";
            text = "Enter your password to unlock.";
            color = "rgb(198, 160, 246)";
            font_size = 14;
            font_family = "JetBrains Mono Nerd Font 10";
            position = "0, 60";
            halign = "center";
            valign = "bottom";
          }
        */
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        "eDP-1,${pkgs.hyprland}/share/hypr/wall2.png"
      ];
    };
  };
}
