-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
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
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
