local keymap = function()
  local wk = require('which-key')
  local tc = require('todo-comments')

  wk.register({
    [']t'] = { function() tc.jump_next() end, "Next todo" },
    ['[t'] = { function() tc.jump_prev() end, "Previous todo" },
    [']T'] = { function() tc.jump_next({ keywords = { 'ERROR', 'WARNING' } }) end, "Next error/warning" },
    ['[T'] = { function() tc.jump_prev({ keywords = { 'ERROR', 'WARNING' } }) end, "Previous error/warning" },
  })

  wk.register({
    T = { '<cmd>TodoTelescope<CR>', "Open todo comments in telescope" }
  }, { prefix = "<leader>" })
end

return {
  {
    -- Show all todo comments in solution
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
      keymap()
    end,
    event = "VeryLazy",
  },
}
