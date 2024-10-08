-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "solargraph", "terraformls", "rubocop", "eslint", "ansiblels", "ansible-lint", "ts_ls", "helm_ls", "yamlls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
