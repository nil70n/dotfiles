local wk = require('which-key')

wk.register({
  ["<ESC>"] = { "<cmd>noh<CR>", "No Highlighting" },
})

wk.register({
  s = {
    name = "Show",
    d = { "<cmd>DBUIToggle<CR>", "Toggle DB UI" },
    t = { function() TermToggle() end, "Show Terminal" },
    p = { '<cmd>Telescope neovim-project discover<CR>', 'List projects' },
    h = { '<cmd>Telescope neovim-project history<CR>', 'Project history' },
  },
}, { prefix = "<leader>" })
