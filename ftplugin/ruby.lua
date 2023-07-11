
local lspconfig = require'lspconfig'

local function attacher(client)
  print('Attaching LSP: ' .. client.name)
end

lspconfig.solargraph.setup{
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true
    }
  },
  on_attach = attacher
}
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
