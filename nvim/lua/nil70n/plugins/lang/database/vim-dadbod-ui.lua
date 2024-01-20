return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-completion' },
    },
    config = function()
      vim.g.db_ui_save_location = '~/.config/db_ui'
    end,
  },
}
