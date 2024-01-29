return {
  {
    'gelguy/wilder.nvim',
    config = function()
      local wilder = require('wilder')

      wilder.setup({
        modes = { ':', '/', '?' },
        next_key = '<C-n>',
        previous_key = '<C-p>',
        accept_key = '<C-y>',
        reject_key = '<C-x>',
      })

      -- wilder.set_option('renderer', wilder.popupmenu_renderer({
      --   highlighter = wilder.basic_highlighter(),
      -- }))
    end
  }
}
