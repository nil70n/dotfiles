local wk = require('which-key')

wk.register({
  ["<ESC>"] = { "<cmd>noh<CR>", "No Highlighting" },
})

wk.register({
  s = {
    name = "Show",
    d = { "<cmd>DBUIToggle<CR>", "Toggle DB UI" },
    t = { function() TermToggle() end, "Show Terminal" },
    p = { function() require('harpoon').ui.toggle_quick_menu() end, "Pinned Files Menu" },
    h = { require('floating-help').toggle, "Toggle Help" },
    -- ['?'] = {
    --   function() require('floating-help').open('t=cppman', vim.fn.expand('<cword>')) end,
    --   "Word Help",
    -- }
  },
}, { prefix = "<leader>" })
