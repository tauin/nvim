local setKey = vim.keymap.set
setKey(
  "n",
  "<leader>x",
  "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true, desc = "View Problems" }
)

setKey(
  "n",
  "<leader>z",
  function() require("zen-mode").toggle() end,
  { silent = true, noremap = true, desc = "Zen Mode" }
)

setKey(
  "n",
  "<leader>m",
  "<cmd>MundoToggle<cr>",
  { silent = true, noremap = true, desc = "Toggle Mundo Tree" }
)
