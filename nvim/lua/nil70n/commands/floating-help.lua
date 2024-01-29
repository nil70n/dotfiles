local floating_help_group = vim.api.nvim_create_augroup('FloatingHelpGroup', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  group = floating_help_group,
  callback = function(args)
    if (args.buf ~= nil and vim.bo[args.buf].filetype == 'help') then
      local help_win = vim.api.nvim_get_current_win()
      local new_win = vim.api.nvim_open_win(args.buf, true,
        vim.lsp.util.make_floating_popup_options(80, 40, {
          border = 'rounded',
          anchor = 'NW',
          relative = 'win',
          offset_x = (vim.api.nvim_win_get_width(0) - 80) / 2,
          offset_y = 1,
          zindex = 49,
          external = false,
          focusable = true,
          noautocmd = true,
        }))

      vim.api.nvim_win_set_height(new_win, 40)
      vim.api.nvim_win_set_var(new_win, 'floating_help', true)

      vim.wo[new_win].scroll = vim.wo[help_win].scroll
      vim.api.nvim_win_close(help_win, false)
    end
  end,
})

-- TODO: Publish as a plugin
-- Centralization: https://github.com/MarioCarrion/videos/blob/269956e913b76e6bb4ed790e4b5d25255cb1db4f/2023/01/nvim/lua/plugins/nvim-tree.lua
-- Centralize in the editor instead of the window
-- Nice Esc keymap: https://github.com/lettertwo/config/blob/0b56ed8f5b0e8c1186ca29cbf8623ed64976568e/nvim/lua/config/keymaps.lua#L33
-- Solution to open in a split (nice try but doesn't work)
-- vim.cmd('vsplit')
-- local new_win = vim.api.nvim_get_current_win()
-- vim.api.nvim_win_set_buf(new_win, args.buf)
