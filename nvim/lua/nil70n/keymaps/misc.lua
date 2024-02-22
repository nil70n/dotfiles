local wk = require('which-key')

wk.register({
  ["<ESC>"] = { "<cmd>noh<CR>", "No Highlighting" },
  ['<C-q>'] = { '<cmd>q<CR>', 'Quit' },
})

wk.register({
  s = {
    name = "Show",
    t = { function() TermToggle() end, "Show Terminal" },
    p = { '<cmd>Telescope neovim-project discover<CR>', 'List projects' },
    h = { '<cmd>Telescope neovim-project history<CR>', 'Project history' },
  },
  t = {
    name = "Toggle",
  },
}, { prefix = "<leader>" })
