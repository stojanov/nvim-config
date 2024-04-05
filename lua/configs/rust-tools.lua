local lspconfig = require("plugins.configs.lspconfig")

local opts = {
  server = {
    on_attach = lspconfig.on_attach,
    capabilities = lspconfig.capabilities,
  }
}


return opts
