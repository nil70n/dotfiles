local wk = require('which-key')

local nolead_opts = { noremap = true }
local lead_opts = { prefix = "<leader>", noremap = true }
local insert_opts = { mode = "i", noremap = true }
local visual_opts = { mode = "v", noremap = true }

wk.register({
    ["<ESC>"] = { "<cmd>noh<CR>", "No Highlighting" },
}, nolead_opts)

wk.register({
  t = {
    name = "Toggle",
    d = { "<cmd>DBUIToggle<CR>", "DB UI (dadbod)"},
    j = { "<cmd>TSJToggle<CR>", "Split/Join (treesj)" },
  },
  f = {
    name = "Find",
  }
}, lead_opts)

