return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  config = function()
    require('kanagawa').setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      bold = false,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function()
        return {}
      end,
      theme = "wave",
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })
  end
}
