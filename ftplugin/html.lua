local lspconfig = require("lspconfig")
local lsp_comf = vim.lsp.protocol.make_client_capabilities()
lsp_comf.textDocument.completion.completionItem.snippetSupport = true
local cmp_cap = require("cmp_nvim_lsp").default_capabilities(lsp_comf)
lspconfig.html.setup {
  capabilities = cmp_cap,
}
vim.lsp.start {
  cmd = { "emmet-language-server", "--stdio" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
  name = "emmet_lang_server",
  init_options = {
    showExpandedAbbreviation = "always",
    showAbbreviationSuggestions = true,
    showSuggestionsAsSnippets = false,
  },
}
