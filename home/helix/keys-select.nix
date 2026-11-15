{
  ...
}:
{
  programs.helix.settings.keys.select = {
    # Reflow the text
    A-q = [ ":reflow" ];

    A-c = {
      label = "Text case changer";
      u = {
        command = ":pipe ccase -t upper";
        label = "Transform to UPPER CASE";
      };
      l = {
        command = ":pipe ccase -t lower";
        label = "Transform to lower case";
      };
      t = {
        command = ":pipe ccase -t title";
        label = "Transform to Title Case";
      };
      c = {
        command = ":pipe ccase -t camel";
        label = "Transform to camelCase";
      };
      p = {
        command = ":pipe ccase -t pascal";
        label = "Transform to PascalCase";
      };
      s = {
        command = ":pipe ccase -t snake";
        label = "Transform to snake_case";
      };
      k = {
        command = ":pipe ccase -t kebab";
        label = "Transform to kebab-case";
      };
    };

    # Goto selected file/url
    g.f = {
      label = "Goto selected file/url";
      c = {
        command = [ "goto_file" ];
        label = "Go to file/url in current window";
      };
      v = {
        command = [
          "vsplit"
          "jump_view_up"
          "goto_file"
        ];
        label = "Go to file/url in vertical split";
      };
      h = {
        command = [
          "hsplit"
          "jump_view_up"
          "goto_file"
        ];
        label = "Go to file/url in horizontal split";
      };
    };
  };
}
