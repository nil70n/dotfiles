return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local wk       = require('which-key')
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

      wk.register({
        t = {
          name = "Toggle",
          t = { "<cmd>lua TermToggle()<CR>", "Terminal" },
        },
      }, { prefix = "<leader>", noremap = true })
    end
  },
  {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension "toggleterm"
    end
  }
}
