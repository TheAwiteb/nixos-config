{
  ...
}:
let
  prettierFormatterSet = {
    auto-format = true;
    formatter = {
      command = "prettier";
      args = [
        "--stdin-filepath"
        "%{buffer_name}"
      ];
    };
  };
  prettierFn =
    langName:
    (
      {
        name = langName;
      }
      // prettierFormatterSet
    );
in
{
  programs.helix.languages = {
    language-server.scls = {
      command = "simple-completion-language-server";
      config = {
        max_completion_items = 100;
        feature_words = true;
        feature_snippets = true;
        snippets_first = true;
        snippets_inline_by_word_tail = false;
        feature_unicode_input = false;
        feature_paths = false;
        feature_citations = false;
      };
    };

    language-server.tailwindcss = {
      command = "tailwindcss-language-server";
      args = [ "--stdio" ];
    };

    language-server.rust-analyzer.config = {
      # rust-analyzer.check.command
      check.command = "clippy";
      # rust-analyzer.inlayHints
      inlayHints = {
        typeHints.enable = true;
        bindingModeHints.enable = true;
        closingBraceHints.minLines = 15;
      };
      # rust-analyzer.cargo.buildScripts.enable
      cargo.buildScripts.enable = false;
    };

    language-server.yaml-language-server.config.yaml = {
      format.enable = true;
      validation = true;
    };
  };

  programs.helix.languages.language =
    let
      rust = {
        name = "rust";
        language-servers = [
          "scls"
          "rust-analyzer"
        ];
        auto-pairs = {
          "\"" = "\"";
          "(" = ")";
          "[" = "]";
          "`" = "`";
          "{" = "}";
        };
      };
      markdown = {
        name = "markdown";
        language-servers = [
          "scls"
        ];
        comment-tokens = [
          "-"
          "+"
          "*"
          "- [ ]"
          ">"
        ];
      };
      toml = {
        name = "toml";
        language-servers = [
          "scls"
          "taplo"
        ];
        auto-format = true;
      };
      nix = {
        name = "nix";
        language-servers = [
          "scls"
          "nixd"
        ];
        auto-format = true;
      };
      protobuf = {
        name = "protobuf";
        auto-format = true;
      };
      rhai = {
        name = "rhai";
        comment-token = "//";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        file-types = [ "rhai" ];
        grammar = "rust";
        scope = "source.rust";
        language-servers = [ ];
        auto-format = false;
      };
      docker-compose = {
        name = "docker-compose";
        grammar = "yaml";
      };
      tsx = {
        name = "tsx";
        language-servers = [
          "vtsls"
          "tailwindcss"
        ];
      };
      typescript = {
        name = "typescript";
        language-servers = [ "vtsls" ];
      };
      css = {
        name = "css";
        language-servers = [
          "vscode-css-language-server"
          "tailwindcss"
        ];
      };
      html = {
        name = "html";
        language-servers = [
          "vscode-html-language-server"
          "tailwindcss"
        ];
      };
    in
    [
      (prettierFn "javascript")
      (prettierFn "json")
    ]
    ++ [
      (css // prettierFormatterSet)
      docker-compose
      (html // prettierFormatterSet)
      markdown
      nix
      protobuf
      rhai
      rust
      toml
      (tsx // prettierFormatterSet)
      (typescript // prettierFormatterSet)
    ];
}
