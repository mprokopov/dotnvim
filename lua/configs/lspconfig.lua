-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "solargraph", "terraformls", "rubocop", "eslint", "ansiblels", "ts_ls", "helm_ls", "yamlls", "clojure_lsp", "nushell" }

-- Configure and enable LSP servers using vim.lsp.config (Neovim 0.11+)
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
  vim.lsp.enable(lsp)
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
