require("mason-tool-installer").setup {
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
    --  html
    "html-lsp",
    "emmet-ls",
    -- javascript
    "typescript-language-server",
    "rome",
  },

  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 5,
}
require("mason").setup {
  ui = {
    icons = {
      package_installed = "●",
      package_pending = "◔",
      package_uninstalled = "◯",
    },
  },
}
require("mason-lspconfig").setup()

local cmp = require("cmp")
local luasnips = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  snippet = {
    expand = function(args) luasnips.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "function" },
    { name = "luasnip" },
    { name = "buffer" },
  }, {
    { name = "buffer" },
  }),
  sorting = {
        comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = {
    ghost_test = true
  }
}

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
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason-lspconfig").setup_handlers {
  function(server_name)
    if server_name == "hls" or server_name == "html" or server_name == "emmet_ls" then
      return
    end
    require("lspconfig")[server_name].setup {
      capabilities = cmp_capabilities,
    }
  end,
}
require("tau.masonry.languages.lua")
require("tau.masonry.languages.rust")
