local wk = require('which-key')

wk.register({
  h = {
    name = "Harpoon",
    m = { function() require('harpoon.ui').toggle_quick_menu() end, "Menu" },
    h = { function() require('harpoon.mark').add_file() end, "Add File" },
    a = { function() require('harpoon.ui').nav_file(1) end, "File 1" },
    s = { function() require('harpoon.ui').nav_file(2) end, "File 2" },
    d = { function() require('harpoon.ui').nav_file(3) end, "File 3" },
    f = { function() require('harpoon.ui').nav_file(4) end, "File 4" },
    g = { function() require('harpoon.ui').nav_file(5) end, "File 5" },
  }
}, { prefix = "<leader>", noremap = true })
