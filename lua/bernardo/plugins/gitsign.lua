return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 0,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '-' },
        changedelete = { text = '§' },
        untracked    = { text = '?' },
      },
    })
  end
}
