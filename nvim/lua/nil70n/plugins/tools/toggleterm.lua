return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local term     = Terminal:new({
        dir = "git_dir",
        direction = "float",
        float_opts = { border = "double" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
        end,
        -- on_close = function(term)
        --   vim.cmd("startinsert!")
        -- end,
      })

      function TermToggle()
        -- TODO: Implement multiple terminal instances using vim.v.count1
        term:toggle()
      end
    end
  },
}
