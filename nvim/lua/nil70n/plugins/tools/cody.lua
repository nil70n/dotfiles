return {
  'sourcegraph/sg.nvim',
  config = function()
    require('sg').setup()
    vim.keymap.set('n', '<leader>cs', function() require('sg.extensions.telescope').fuzzy_search_results() end)
  end,
}
