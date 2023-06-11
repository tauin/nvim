local setKey = vim.keymap.set

setKey(
  "n",
  "<leader>xx",
  "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)

setKey("n", "<leader>zz", function ()
  require("zen-mode").toggle()
end)
