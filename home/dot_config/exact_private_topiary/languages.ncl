{
  languages = {
    desktop = {
      # Parser seems to work fine, but formatting isn't set up
      extensions = ["desktop"],
      grammar.source.git = {
        git = "https://github.com/ValdezFOmar/tree-sitter-desktop.git",
        rev = "v1.1.1"
      }
    },
    # elvish parser is unmaintained
    fish = {
      # Parser works fine, but formatting isn't really needed
      extensions = ["fish"],
      grammar.source.git = {
        git = "https://github.com/ram02z/tree-sitter-fish.git",
        rev = "3.7.0"
      }
    },
    gitattributes = {
      # Topiary can't see dotfiles, so this is largely unusable
      extensions = ["gitattributes"],
      grammar.source.git = {
        git = "https://github.com/tree-sitter-grammars/tree-sitter-gitattributes.git",
        rev = "1b7af09d45b579f9f288453b95ad555f1f431645"
      }
    },
    # gitconfig parser has linkage issues
    ini = {
      extensions = ["ini"],
      grammar.source.git = {
        git = "https://github.com/justinmk/tree-sitter-ini.git",
        rev = "v1.4.0"
      }
    },
    lua = {
      extensions = ["lua"],
      grammar.source.git = {
        git = "https://github.com/tree-sitter-grammars/tree-sitter-lua.git",
        rev = "v0.5.0"
      }
    },
    nu = {
      # Formatting works w/ externals, parsing appears to be fine too
      extensions = ["nu"],
      grammar.source.git = {
        git = "https://github.com/nushell/tree-sitter-nu.git",
        rev = "bb3f533e5792260291945e1f329e1f0a779def6e",
      },
    },
    powershell = {
      # Parser breaks on various nodes that pwsh accepts
      extensions = ["ps1", "psm1"],
      grammar.source.git = {
        git = "https://github.com/airbus-cert/tree-sitter-powershell.git",
        rev = "v0.26.3"
      }
    },
    python = {
      extensions = ["py"],
      grammar.source.git = {
        git = "https://github.com/tree-sitter/tree-sitter-python.git",
        rev = "v0.25.0"
      }
    },
    # ssh_config parser breaks topiary entirely
    # zsh - https://github.com/topiary/topiary/issues/1173
  }
}
