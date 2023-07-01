local rt = require("rust-tools")

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set(
        "n",
        "<C-space>",
        rt.hover_actions.hover_actions,
        { buffer = bufnr }
      )
      vim.keymap.set(
        "n",
        "<Leader>a",
        rt.code_action_group.code_action_group,
        { buffer = bufnr }
      )
    end,
  },
}
require("crates").setup {
  text = {
    loading = "  Loading...",
    version = "  %s",
    prerelease = "  %s",
    yanked = "  %s yanked",
    nomatch = "  Not found",
    upgrade = "  %s",
    error = "  Error fetching crate",
  },
  popup = {
    text = {
      title = "# %s",
      pill_left = "",
      pill_right = "",
      created_label = "created        ",
      updated_label = "updated        ",
      downloads_label = "downloads      ",
      homepage_label = "homepage       ",
      repository_label = "repository     ",
      documentation_label = "documentation  ",
      crates_io_label = "crates.io      ",
      categories_label = "categories     ",
      keywords_label = "keywords       ",
      version = "%s",
      prerelease = "%s pre-release",
      yanked = "%s yanked",
      enabled = "* s",
      transitive = "~ s",
      normal_dependencies_title = "  Dependencies",
      build_dependencies_title = "  Build dependencies",
      dev_dependencies_title = "  Dev dependencies",
      optional = "? %s",
      loading = " ...",
    },
  },
  src = {
    text = {
      prerelease = " pre-release ",
      yanked = " yanked ",
    },
  },
}
