return {
  'dfendr/clipboard-image.nvim',
  config = function()
    local wk = require('which-key')

    wk.register({
      i = {
        name = 'Image',
        p = { '<cmd>PasteImg<CR>', 'Paste' },
      },
    }, { prefix = '<leader>' })
  end,
}
