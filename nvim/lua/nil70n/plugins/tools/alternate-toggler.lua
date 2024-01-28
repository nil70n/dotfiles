local keymap = function()
  local wk = require('which-key')

  wk.register({
      i = { '<cmd>ToggleAlternate<CR>', 'Alternate' },
    },
    { prefix = '<leader>' })
end

return {
  {
    'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup({
        alternates = {
          ['==='] = '!==',
          ['=='] = '!=',
          ['error'] = 'warn',
        }
      })

      keymap()
    end
  }
}
