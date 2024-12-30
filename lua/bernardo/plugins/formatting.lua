return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        jsx = { "prettier" },
        tsx = { "prettier" },
        json = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        vue = {
          "prettier",
          args = { "--single-attribute-per-line", "--no-semi", "--single-quote" },
        },
        lua = { "stylua" },
        php = { "php_cs_fixer", "pint" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    })
  end
}
