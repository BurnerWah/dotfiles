-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "awk_ls",
  "basedpyright",
  "bashls",
  "biome",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "fish_lsp",
  "html",
  "jsonls",
  "nushell",
  "powershell_es",
  "ruff",
  "stylelint_lsp",
  "tailwindcss",
  "taplo",
  "vimls",
  "yamlls",
}

vim.lsp.enable(servers)
