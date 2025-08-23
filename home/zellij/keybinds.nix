{
  ...
}:
{
  programs.zellij.settings = {
    "keybinds clear-defaults=true" = {
      normal = {
        "bind \"Alt n\"" = {
          SwitchToMode = "Resize";
        };
        "bind \"Alt p\"" = {
          SwitchToMode = "Pane";
        };
        "bind \"Alt h\"" = {
          SwitchToMode = "Move";
        };
        "bind \"Alt t\"" = {
          SwitchToMode = "Tab";
        };
        "bind \"Alt s\"" = {
          SwitchToMode = "Scroll";
        };
      };

      resize = {
        "bind \"Alt n\"" = {
          SwitchToMode = "Normal";
        };
        "bind \"h\" \"Left\"" = {
          Resize = "Increase Left";
        };
        "bind \"j\" \"Down\"" = {
          Resize = "Increase Down";
        };
        "bind \"k\" \"Up\"" = {
          Resize = "Increase Up";
        };
        "bind \"l\" \"Right\"" = {
          Resize = "Increase Right";
        };
        "bind \"H\"" = {
          Resize = "Decrease Left";
        };
        "bind \"J\"" = {
          Resize = "Decrease Down";
        };
        "bind \"K\"" = {
          Resize = "Decrease Up";
        };
        "bind \"L\"" = {
          Resize = "Decrease Right";
        };
        "bind \"=\" \"+\"" = {
          Resize = "Increase";
        };
        "bind \"-\"" = {
          Resize = "Decrease";
        };
      };

      pane = {
        "bind \"Alt p\"" = {
          SwitchToMode = "Normal";
        };
        "bind \"h\" \"Left\"" = {
          MoveFocus = "Left";
        };
        "bind \"l\" \"Right\"" = {
          MoveFocus = "Right";
        };
        "bind \"j\" \"Down\"" = {
          MoveFocus = "Down";
        };
        "bind \"k\" \"Up\"" = {
          MoveFocus = "Up";
        };
        "bind \"p\"" = {
          SwitchFocus = { };
          SwitchToMode = "Normal";
        };
        "bind \"n\"" = {
          NewPane = { };
          SwitchToMode = "Normal";
        };
        "bind \"d\"" = {
          NewPane = "Down";
          SwitchToMode = "Normal";
        };
        "bind \"r\"" = {
          NewPane = "Right";
          SwitchToMode = "Normal";
        };
        "bind \"s\"" = {
          NewPane = "stacked";
          SwitchToMode = "Normal";
        };
        "bind \"x\"" = {
          CloseFocus = { };
          SwitchToMode = "Normal";
        };
        "bind \"w\"" = {
          ToggleFloatingPanes = { };
          SwitchToMode = "Normal";
        };
        "bind \"i\"" = {
          TogglePanePinned = { };
          SwitchToMode = "Normal";
        };
      };

      move = {
        "bind \"Alt h\"" = {
          SwitchToMode = "Normal";
        };
        "bind \"n\" \"Tab\"" = {
          MovePane = { };
        };
        "bind \"p\"" = {
          MovePaneBackwards = { };
        };
        "bind \"h\" \"Left\"" = {
          MovePane = "Left";
        };
        "bind \"j\" \"Down\"" = {
          MovePane = "Down";
        };
        "bind \"k\" \"Up\"" = {
          MovePane = "Up";
        };
        "bind \"l\" \"Right\"" = {
          MovePane = "Right";
        };
      };

      tab = {
        "bind \"Alt t\"" = {
          SwitchToMode = "Normal";
        };
        "bind \"h\" \"Left\"" = {
          GoToPreviousTab = { };
        };
        "bind \"l\" \"Right\"" = {
          GoToNextTab = { };
        };
        "bind \"n\"" = {
          NewTab = { };
          SwitchToMode = "Normal";
        };
        "bind \"x\"" = {
          CloseTab = { };
          SwitchToMode = "Normal";
        };
      };

      scroll = {
        "bind \"Alt s\"" = {
          SwitchToMode = "Normal";
        };
        "bind \"e\"" = {
          EditScrollback = { };
          SwitchToMode = "Normal";
        };
        "bind \"j\" \"Down\"" = {
          ScrollDown = { };
        };
        "bind \"k\" \"Up\"" = {
          ScrollUp = { };
        };
      };
    };
  };
}
