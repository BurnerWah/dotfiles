local options = {
  formatters_by_ft = {
    css = { "stylelint", "prettierd" },
    fish = { "fish_indent" },
    html = { "prettierd" },
    javascript = { "biome-check", "eslint_d", "prettierd" },
    javascriptreact = { "biome-check", "eslint_d", "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    less = { "prettierd" },
    lua = { "stylua" },
    markdown = { "markdownlint-cli2", "prettierd" },
    python = { "ruff_fix", "black" },
    scss = { "prettierd" },
    toml = { "taplo" },
    typescript = { "biome-check", "eslint_d", "prettierd" },
    typescriptreact = { "biome-check", "eslint_d", "prettierd" },
    vue = { "prettierd" },
    yaml = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
