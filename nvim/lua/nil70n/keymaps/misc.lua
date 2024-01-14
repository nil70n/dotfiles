local wk = require('which-key')

wk.register({
  ["<ESC>"] = { "<cmd>noh<CR>", "No Highlighting" },
})

wk.register({
  t = {
    name = "Toggle",
    d = { "<cmd>DBUIToggle<CR>", "DB UI (dadbod)" },
    j = { "<cmd>TSJToggle<CR>", "Split/Join (treesj)" },
    t = { "<cmd>lua TermToggle()<CR>", "Terminal" },
  },
}, { prefix = "<leader>" })
