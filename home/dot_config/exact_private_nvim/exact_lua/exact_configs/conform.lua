local options = {
  -- Avoid prettierd as it tends to create leftover processes
  formatters_by_ft = {
    css = { "stylelint", "prettier" },
    fish = { "fish_indent", lsp_fallback = "prefer" },
    html = { "prettier" },
    javascript = { "biome-check", "prettier" },
    javascriptreact = { "biome-check", "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    less = { "prettier" },
    lua = { "stylua" },
    markdown = { "rumdl", "prettier" },
    python = { "ruff_fix", "ruff_format" },
    ps1 = { lsp_fallback = "prefer" },
    scss = { "prettier" },
    toml = { "tombi", lsp_fallback = "prefer" },
    typescript = { "biome-check", "prettier" },
    typescriptreact = { "biome-check", "prettier" },
    vue = { "prettier" },
    yaml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = "fallback",
  },

  formatters = {
    taplo = {
      -- Don't run if taplo hasn't been configured
      cwd = require("conform.util").root_file { ".taplo.toml", "taplo.toml" },
      require_cwd = true,
    },
  },
}

return options
