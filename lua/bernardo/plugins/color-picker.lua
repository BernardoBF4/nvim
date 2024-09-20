return {
  "ziontee113/color-picker.nvim",
  config = function()
    require("color-picker").setup({
      ["icons"] = { "|", ">" },
      ["border"] = "rounded",
      ["background_highlight_group"] = "Normal",
      ["border_highlight_group"] = "FloatBorder",
      ["text_highlight_group"] = "Normal",
    })
  end,
}
