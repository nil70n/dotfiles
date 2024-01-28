local omnisharpExtensionsGroup = vim.api.nvim_create_augroup('OmnisharpExtensions', { clear = true })

-- Autocmd only works as a hook for events.
-- TODO: Discover how to create a command callback
vim.api.nvim_create_autocmd({ 'OmniSharpPreviewDefinition' }, {
  group = omnisharpExtensionsGroup,
  pattern = { '*.cs' },
  callback = function()
    vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
      group = omnisharpExtensionsGroup,
      callback = function(args)
        vim.api.nvim_win_set_config(vim.api.nvim_get_current_win(), {
          focusable = true,
          border = 'shadow',
          enter = true,
        })
      end,
    })
  end
})
