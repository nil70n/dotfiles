local keymap = function()
  local wk = require('which-key')
  local harpoon = require('harpoon')

  wk.register({
      -- <leader>sp: Pinned Menu
      p = { function() harpoon.mark.add_file() end, "Pin File" },
      ['<M-a>'] = { function() require('harpoon.ui').nav_file(1) end, "Pinned File 1" },
      ['<M-s>'] = { function() require('harpoon.ui').nav_file(2) end, "Pinned File 2" },
      ['<M-d>'] = { function() require('harpoon.ui').nav_file(3) end, "Pinned File 3" },
      ['<M-f>'] = { function() require('harpoon.ui').nav_file(4) end, "Pinned File 4" },
      ['<M-g>'] = { function() require('harpoon.ui').nav_file(5) end, "Pinned File 5" },
    },
    { prefix = "<leader>" })
end

return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      keymap()
    end,
  },
}
