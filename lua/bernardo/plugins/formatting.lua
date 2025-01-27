return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local function find_prettier()
      local local_prettier = vim.fn.findfile("node_modules/.bin/prettier", vim.fn.getcwd() .. ";")
      return local_prettier ~= "" and vim.fn.fnamemodify(local_prettier, ":p") or "prettier"
    end

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
        vue = { "prettier" },
        lua = { "stylua" },
        php = { "php_cs_fixer", "pint" },
      },
      formatters = {
        prettier = {
          command = find_prettier(),
          extra_args = { '--config ./.prettierrc.json', '--no-semi', '--double-quote', '--arrow-parens avoid', '--single-attribute-per-line', '--trailing-comma es5' }
        }
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      }
    })
  end
}
