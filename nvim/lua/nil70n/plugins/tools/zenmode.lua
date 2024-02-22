return {
  {
    'folke/zen-mode.nvim',
    init = function()
      vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<CR>',
        { noremap = true, silent = true, desc = 'Toggle Zen Mode' })
    end,
    opts = {
      window = {
        options = {
          number = false,
          relativenumber = false,
          cursorline = false,
        },
      },
    },
  },
  { 'folke/twilight.nvim', config = true },
}
