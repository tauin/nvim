require("mason-tool-installer").setup({
  ensure_installed = {
    -- shell
    "shellcheck",
    "shellharden",
    "shfmt",
    "bash-language-server",

    --lua
    "lua-language-server",
    "stylua",

    --python
    "pyright",

    --rust
    "rust-analyzer",

    --Haskell
    "haskell-language-server",

    --webdev
    --  css
    "css-lsp",
    "stylelint",
    "tailwindcss-language-server",
    --  html
    "html-lsp",
    "emmet-ls",
    -- javascript
    "rome"


  },

  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 5,
})
require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
  capabilities = cmp_capabilities,
  }
  end
}
require("tau.masonry.languages.lua")
require("tau.masonry.languages.rust")
require("tau.masonry.languages.html")
require("tau.masonry.languages.haskell")
