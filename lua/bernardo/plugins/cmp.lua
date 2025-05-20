return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for cmp
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lua',     -- Source for nvim_lua
      'hrsh7th/cmp-path',         -- Source for path
      'hrsh7th/cmp-buffer',       -- Source for buffer
      'saadparwaiz1/cmp_luasnip', -- Source for luasnip
    },
    config = function()
      local cmp = require('cmp')
      local lsp_zero = require('lsp-zero')
      local remaps = require('bernardo.remap')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' }, -- Ensure lsp source is enabled
          { name = 'nvim_lua' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'path' },
          { name = 'buffer',  keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert(remaps.cmp(cmp)),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        }
      })
    end
  }
}
