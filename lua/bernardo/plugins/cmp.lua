return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for cmp
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require('cmp')
      local lsp_zero = require('lsp-zero')
      local remaps = require('bernardo.remap')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },  -- Ensure lsp source is enabled
          { name = 'nvim_lua' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'path' },
          { name = 'buffer', keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert(remaps.cmp(cmp)),
      })
    end
  }
}
