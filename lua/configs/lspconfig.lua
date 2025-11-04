-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "terraformls", "eslint", "ansiblels", "ts_ls", "helm_ls", "yamlls", "clojure_lsp", "nushell", "ruby_lsp" }

-- Configure and enable LSP servers using vim.lsp.config (Neovim 0.11+)
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
  vim.lsp.enable(lsp)
end

-- Configure rubocop separately to use system rubocop with rbenv
vim.lsp.config.rubocop = {
  cmd = { vim.fn.expand("~/.rbenv/shims/rubocop"), "--lsp" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = vim.fs.root(0, { ".rubocop.yml", "Gemfile" }),
}
vim.lsp.enable("rubocop")

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
