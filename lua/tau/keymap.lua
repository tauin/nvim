local setKey = vim.keymap.set

setKey(
  "n",
  "<leader>x",
  "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)

setKey("n", "<leader>z", function()
  require("zen-mode").toggle()
end)
