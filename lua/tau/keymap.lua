local set = vim.keymap.set
local hydra = require("hydra")
local wk = require("which-key")

local opts = { silent = true, noremap = true }
local mode = "force"
local optMap = vim.tbl_extend

set(
  "n",
  "<leader>x",
  require("trouble").toggle,
  optMap(mode, opts, { desc = "View Probelms" })
)

set(
  "n",
  "<leader>z",
  require("zen-mode").toggle,
  optMap(mode, opts, { desc = "Zen Mode" })
)

set(
  "n",
  "<leader>m",
  require("undotree").toggle,
  optMap(mode, opts, { desc = "Toggle Undo Tree" })
)


wk.register {
  ["<leader>f"] = {
    name = "+formatting"
  }
}

set("n", "<leader>ff", "<cmd>Format<cr>", optMap(mode, opts, { desc = "Format file" }))

set(
  "n",
  "<leader>fw",
  "<cmd>FormatWrite<cr>",
  optMap(mode, opts, { desc = "Format & write file" })
)

set(
  "n",
  "<leader>g",
  function ()
   require("neogit").open {}
  end,
  optMap(mode, opts, {desc = "Open Neogit"})
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
hydra {
  name = "Swap params",
  mode = "n",
  body = "<leader>",
  heads = {
    { "a", "<cmd>TSTextobjectSwapNext @parameter.inner<cr>", {desc = "Swap to next param"} },
    { "A", "<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>", {desc = "Swap to previous param"} },
  },
  config = {
    hint = false,
    on_exit = slew_hydra,
  },
}


local dap = require("dap")
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    wk.register {
      ["<leader>l"] = {
        name = "+lsp"
      }
    }
    local lspopts = { buffer = ev.buf, silent = true, noremap = true }
    set("n", "<leader>lD", vim.lsp.buf.declaration, optMap(mode, lspopts, {desc = "Jump to symbol declaration"}))
    set("n", "<leader>lh", vim.lsp.buf.hover, optMap(mode, lspopts, {desc = "Hover Info"}))
    set("n", "<leader>ls", vim.lsp.buf.signature_help, optMap(mode, lspopts, {desc = "Symbol Signature"}))
    set("n", "<leader>lt", vim.lsp.buf.type_definition, optMap(mode, lspopts, {desc = "Jump to type definition"}))
    set("n", "<leader>lr", vim.lsp.buf.rename, optMap(mode, lspopts, {desc = "Rename Symbol"}))
    set({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, optMap(mode, lspopts, {desc = "Code Action"}))
    set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
    set("n", "<F7>", dap.step_into, { desc = "DAP: Step Into" })
    set("n", "<F8>", dap.step_over, { desc = "DAP: Step Over" })
    set("n", "<F9>", dap.step_out, { desc = "DAP: Step Out" })
    set("n", "<F12>", dap.close, { desc = "DAP: Close" })
    set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
  end,
})
