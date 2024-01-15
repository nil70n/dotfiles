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
    h = { require('floating-help').toggle, "Help" },
    -- ['?'] = {
    --   function() require('floating-help').open('t=cppman', vim.fn.expand('<cword>')) end,
    --   "Word Help",
    -- }
  },
}, { prefix = "<leader>" })
