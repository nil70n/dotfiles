return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-completion' },
    },
    config = function()
      vim.g.db_ui_save_location = '~/.config/db_ui'
      vim.keymap.set('n', '<leader>td', '<cmd>DBUIToggle<CR>',
        { noremap = true, silent = true, desc = 'Toggle DB UI' })
    end,
  },
}
