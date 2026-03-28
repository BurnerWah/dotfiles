-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ansiblels",
  "ast_grep",
  "awk_ls",
  "basedpyright",
  "bashls",
  "biome",
  "cssls",
  "denols",
  "docker_compose_language_service",
  "docker_language_server",
  "elvish",
  "eslint",
  "fish_lsp",
  "html",
  "jsonls",
  "nushell",
  "oxfmt",
  "oxlint",
  "powershell_es",
  "ruff",
  "rumdl",
  "stylelint_lsp",
  "stylua",
  "systemd_lsp",
  "tombi",
  "ts_query_ls",
  "tsgo",
  "ty",
  "vimls",
  "yamlls",
}

vim.lsp.enable(servers)
