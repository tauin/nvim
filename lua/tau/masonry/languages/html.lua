local lspconfig = require("lspconfig")
local lsp_comf = vim.lsp.protocol.make_client_capabilities()
lsp_comf.textDocument.completion.completionItem.snippetSupport = true
lsp_comf.textDocument.completion.dynamicRegistration = true
local cap = require("cmp_nvim_lsp").default_capabilities(lsp_comf)

lspconfig.html.setup {
  capabilities = cap
}

lspconfig.emmet_ls.setup {
  capabilities = cap,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}


