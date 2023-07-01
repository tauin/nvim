local setKey = vim.keymap.set
local hydra = require("hydra")
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
  function() require("undotree").toggle() end,
  { silent = true, noremap = true, desc = "Toggle Undo Tree" }
)

setKey(
  "n",
  "<leader>ff",
  "<cmd>Format<cr>",
  { silent = true, noremap = true, desc = "Format file" }
)

setKey(
  "n",
  "<leader>fw",
  "<cmd>FormatWrite<cr>",
  { silent = true, noremap = true, desc = "Format & write file" }
)

local function slew_hydra() print("Hercules slew the Hydra.") end
hydra {
  name = "Window resizing",

  mode = "n",
  body = "<C-W>",
  heads = {
    { "+", "<C-W>+", { timeout = false } },
    { "-", "<C-W>-", { timeout = false } },
    { ">", "<C-W>>", { timeout = false } },
    { "<", "<C-W><", { timeout = false } },
    { "=", "<C-W>=", { exit = true, timeout = false } },
  },
  config = {
    hint = false,
    on_enter = function() vim.bo.modifiable = false end,
    on_exit = slew_hydra,
  },
}
