return require("lazy").setup({
  --Plugins
  {"folke/zen-mode.nvim", opts={
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
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
  },
  on_open = function()
      vim.opt.cmdheight = 0
  end,
  on_close = function()
      vim.opt.cmdheight = 1
  end,
  }},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

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
    init = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    init = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Theming
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  "nvim-lualine/lualine.nvim",
  "NvChad/nvim-colorizer.lua",

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

    init = function()
      require("neogit").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      require("gitsigns").setup()
    end,
  },

  --Rust
  {"simrat39/rust-tools.nvim", 
    init = function ()
    require("rust-tools").setup({})
    end
  },
  {"Saecki/crates.nvim", 
    init= function ()
    require('crates').setup()
  end}

})
