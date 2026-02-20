{
  languages = {
    desktop = {
      # Parser seems to work fine, but formatting isn't set up
      extensions = ["desktop"],
      grammar.source.git = {
        git = "https://github.com/ValdezFOmar/tree-sitter-desktop.git",
        rev = "27c713cd097f85d3024569adf34e069cade84905"
      }
    },
    # elvish parser breaks on various nodes
    # fish parser works fine, it just isn't needed
    # gitconfig parser has linkage issues
    nu = {
      # Formatting works w/ externals, parsing appears to be fine too
      extensions = ["nu"],
      grammar.source.git = {
        git = "https://github.com/nushell/tree-sitter-nu.git",
        rev = "bb3f533e5792260291945e1f329e1f0a779def6e",
      },
    },
    # powershell parser breaks on various nodes
    # ssh_config parser breaks topiary entirely
    # zsh parser breaks on various nodes
  }
}
