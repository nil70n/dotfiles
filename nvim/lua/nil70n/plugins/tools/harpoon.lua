return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      local wk = require('which-key')
      local harpoon = require('harpoon')

      wk.register({
        h = {
          name = "Harpoon",
          m = { function() harpoon.ui.toggle_quick_menu() end, "Menu" },
          h = { function() harpoon.mark.add_file() end, "Add File" },
        },
        ['<M-a>'] = { function() require('harpoon.ui').nav_file(1) end, "File 1" },
        ['<M-s>'] = { function() require('harpoon.ui').nav_file(2) end, "File 2" },
        ['<M-d>'] = { function() require('harpoon.ui').nav_file(3) end, "File 3" },
        ['<M-f>'] = { function() require('harpoon.ui').nav_file(4) end, "File 4" },
        ['<M-g>'] = { function() require('harpoon.ui').nav_file(5) end, "File 5" },
      }, { prefix = "<leader>", noremap = true })
    end,
  },
}
