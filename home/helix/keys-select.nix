{
  ...
}:
{
  programs.helix.settings.keys.select = {
    # Text case changer, by ccase <https://github.com/rutrum/ccase>
    A-c = {
      u = ":pipe ccase -t upper";
      l = ":pipe ccase -t lower";
      t = ":pipe ccase -t title";
      c = ":pipe ccase -t camel";
      p = ":pipe ccase -t pascal";
      s = ":pipe ccase -t snake";
      k = ":pipe ccase -t kebab";
    };
    # Reflow the text
    A-q = [ ":reflow" ];
    # Goto selected file/url
    g.f = {
      # In the current window
      c = [ "goto_file" ];
      # In a vertical window
      v = [
        "vsplit"
        "jump_view_up"
        "goto_file"
      ];
      # In a horizontal window
      h = [
        "hsplit"
        "jump_view_up"
        "goto_file"
      ];
    };
  };
}
