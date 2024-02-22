return {
  {
    'github/copilot.vim',
    enable = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.b.copilot_enabled = false

      vim.keymap.set('i', '<C-r>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
    end
  }
}
