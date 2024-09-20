local lsp_zero = require('lsp-zero')
local remaps = require('bernardo.remap')

lsp_zero.on_attach(function(_, bufnr) remaps.lsp(_, bufnr) end)

lsp_zero.setup()

return lsp_zero
