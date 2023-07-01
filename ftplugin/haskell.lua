local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true, }
ht.start_or_attach {
  hls = {
    on_attach = function(client, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })

      vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, vim.tbl_extend("keep", opts, {desc = "Code Lens"}))
      vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, vim.tbl_extend("keep", opts, {desc = "Hoogle Signature"}))
      vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, vim.tbl_extend("keep", opts, {desc = "Evaluate All Snippets"}))
    end,
  },
}
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

ht.dap.discover_configurations(bufnr)
local tele = require('telescope')
tele.load_extension('ht')
