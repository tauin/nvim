return require("lazy").setup({
  --Plugins
  { "simnalamburt/vim-mundo", lazy = true },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        width = 0.80,
        height = 1,
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
      on_open = function()
        vim.opt.laststatus = 0
        vim.opt.cmdheight = 0
      end,
      on_close = function()
        vim.opt.laststatus = 3
        vim.opt.cmdheight = 1
      end,
    },
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
  "folke/twilight.nvim",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  "mfussenegger/nvim-dap",
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
  },
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "HiPhish/nvim-ts-rainbow2",
    },
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
        -- icons / text used for a diagnostic
        error = "X",
        warning = "!",
        hint = "H",
        information = "?",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Theming
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = false },
  "nvim-lualine/lualine.nvim",
  "uga-rosa/ccc.nvim",
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

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  --Git
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },

    init = function() require("neogit").setup {} end,
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function() require("gitsigns").setup() end,
  },

  --Rust
  {
    "simrat39/rust-tools.nvim",
    init = function() require("rust-tools").setup {} end,
  },

  --Haskell
  {
    "MrcJkb/haskell-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    branch = "1.x.x",
    lazy = true,
  },
  "itchyny/vim-haskell-indent",

  -- python

  -- webdev

  -- shell scripts
}, {
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      paths = {}, -- add any custom paths here that you want to includes in the rtp
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
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {
      -- you can define custom key maps here.
      -- To disable one of the defaults, set it to false

      -- open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,

      -- open a terminal for the plugin dir
      ["<localleader>t"] = function(plugin)
        require("lazy.util").float_term(nil, {
          cwd = plugin.dir,
        })
      end,
    },
  },
})
