local opts = {
  use_default_keymaps = false,
  max_join_length = 920
}

local keymap = function()
  local wk = require('which-key')
  local treesj = require('treesj')

  wk.register({
    j = { function() treesj.toggle() end, "Join/Split" },
    J = { function() treesj.toggle({ split = { recursive = true } }) end, "Recursive Join/Split" },
  }, { prefix = "<leader>" })
end

return {
  "Wansmer/treesj",
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup(opts)
    keymap()
  end
}
