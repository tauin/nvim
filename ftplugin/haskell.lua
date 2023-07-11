local ht = require("haskell-tools")
local def_opts = { noremap = true, silent = true }
local wk = require("which-key")
local set = vim.keymap.set
ht.start_or_attach {
  hls = {
    on_attach = function(_, bufnr)
      local opts = vim.tbl_extend("keep", def_opts, { buffer = bufnr })
      wk.register({
        s = { desc = "repl" },
      }, { prefix = "<leader>l" })
      set(
        "n",
        "<space>lh",
        ht.hoogle.hoogle_signature,
        vim.tbl_extend("keep", opts, { desc = "Hoogle Signature" })
      )
      set(
        "n",
        "<space>lb",
        ht.lsp.buf_eval_all,
        vim.tbl_extend("keep", opts, { desc = "Evaluate All Snippets" })
      )

      set(
        "n",
        "<leader>lsb",
        function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end,
        vim.tbl_extend("keep", opts, { desc = "Toggle REPL using file" })
      )
      set(
        "n",
        "<leader>lsr",
        ht.repl.toggle,
        vim.tbl_extend("keep", opts, { desc = "Toggle REPL" })
      )
      set(
        "n",
        "<leader>lsq",
        ht.repl.quit,
        vim.tbl_extend("keep", opts, { desc = "Quit REPL" })
      )
    end,
  },
}
local bufnr = vim.api.nvim_get_current_buf()
ht.dap.discover_configurations(bufnr)
local tele = require("telescope")
tele.load_extension("ht")
