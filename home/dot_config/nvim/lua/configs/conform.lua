local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "stylelint", "prettier" },
    html = { "prettier" },
    javascript = { "biome-check", "eslint_d", "prettier" },
    typescript = { "biome-check", "eslint_d", "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    fish = { "fish_indent" },
    toml = { "taplo" },
    python = { "ruff_fix", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
