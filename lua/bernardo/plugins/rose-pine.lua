return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup({
      styles = {
        bold = false
      },
      highlight_groups = {
        ["String"] = { fg = "#2bcf75" },
        ["@type.qualifier"] = { fg = "pine" },
        ["@variable"] = { fg = "#ffffff" },
        ["@variable.builtin"] = { fg = "#ffffff" },
        ["@parameter"] = { fg = "gold" },
        ["@property"] = { fg = "#ffffff" },
        ["@new_expression"] = { fg = "pine" },
        ["@keyword.operator"] = { fg = "pine" },
        ["@named_imports"] = { fg = "#ffffff" },
        ["Operator"] = { fg = "pine" },
        ["Function"] = { fg = "rose" },
        ["@function.method.call"] = { fg = "rose" },
        ["Special"] = { fg = "rose" },
        ["@constant.builtin"] = { fg = "gold" },
      }
    })
  end
}
