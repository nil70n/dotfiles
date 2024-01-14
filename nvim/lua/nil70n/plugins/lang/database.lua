return {
  { 'tpope/vim-dadbod' },
  { 
    'kristijanhusak/vim-dadbod-ui',
    config = function ()
      vim.g.db_ui_save_location = '~/.config/db_ui'
    end,
  },
  { 'kristijanhusak/vim-dadbod-completion' },
}
