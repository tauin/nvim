return require("lazy").setup({
  --Plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "jiaoshijie/undotree",
    lazy = true,
    opts = {
      float_diff = false,
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        width = 0.80,
        height = 0.95,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
      },
      on_open = function() vim.opt.laststatus = 0 end,
      on_close = function() vim.opt.laststatus = 3 end,
    },
    lazy = true,
    cmd = "ZenMode",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { triggers_nowait = { "<leader>", "<localleader>" } },
  },
  { "folke/twilight.nvim", lazy = true, cmd = "ZenMode" },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "mfussenegger/nvim-dap",
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        event = "VeryLazy",
        lazy = true,
      },
      { "williamboman/mason-lspconfig.nvim", event = "VeryLazy", lazy = true },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", event = "VeryLazy", lazy = true },
    },
    event = "VeryLazy",
    lazy = true,
  },
  { "hrsh7th/nvim-linkedit", dependencies = { "neovim/nvim-lspconfig" } },
  {
    "mhartington/formatter.nvim",
    lazy = true,
  },
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    },
  },
  { "andymass/vim-matchup"},
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "windwp/nvim-ts-autotag", ft = "html" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    init = function() require("lsp_lines").setup() end,
    lazy = true,
    event = "VeryLazy"
  },
  {
    "nmac427/guess-indent.nvim",
    init = function() require("guess-indent").setup {} end,
  },
  {
    "windwp/nvim-autopairs",
    init = function() require("nvim-autopairs").setup {} end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        error = "X",
        warning = "W",
        hint = "H",
        information = "?",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
    lazy = true,
    cmd = "TroubleToggle",
  },
  { "anuvyklack/hydra.nvim" },
  -- Theming
  {
    "ramojus/mellifluous.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.background = "dark"
      vim.diagnostic.config { signs = false, virtual_text = false }
      vim.cmd("colorscheme mellifluous")
    end,
  },
  "nvim-lualine/lualine.nvim",
  { "uga-rosa/ccc.nvim", event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy", lazy = true },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },

  { "L3MON4D3/LuaSnip", version = "1.*", build = "make install_jsregexp" },
  "saadparwaiz1/cmp_luasnip",

  --Git
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Neogit",
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function() require("gitsigns").setup() end,
    lazy = true,
    event = "VeryLazy"
  },

  --Rust
  { "simrat39/rust-tools.nvim", lazy = true },
  { "Saecki/crates.nvim", lazy = true },

  --Haskell
  {
    "MrcJkb/haskell-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    branch = "1.x.x",
    lazy = true,
  },
  { "itchyny/vim-haskell-indent", ft = "haskell" },

  -- python

  -- webdev

  -- shell scripts
  "dstein64/vim-startuptime"
}, {
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    icons = {
      cmd = "$ ",
      config = "c",
      event = "!",
      ft = "ft",
      init = "in",
      import = "ip",
      keys = "ky",
      lazy = "zz",
      loaded = "●",
      not_loaded = "○",
      plugin = "∈ ",
      runtime = "V ",
      source = "◉",
      start = "▶",
      task = "✓ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
