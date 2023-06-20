require("colorizer").setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = false,
    AARRGGBB = false,
    rgb_fn = true,
    hsl_fn = true,
    css = false,
    css_fn = false,
    mode = "background",
    tailwind = true,
    virtualtext = "■",
    always_update = false,
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "bash", "html", "javascript", "css" },

  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { "python" } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<M-space>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
  endwise = {
    enable = true,
  },
  rainbow = {
    enable = true,
    disable = { "jsx", "cpp" },
    query = "rainbow-parens",
    strategy = require("ts-rainbow").strategy.global,
  },
})
