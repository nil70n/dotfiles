local visualSettingsGroup = vim.api.nvim_create_augroup('VisualSettings', { clear = true })

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = visualSettingsGroup,
  callback = function()
    vim.cmd([[
      hi Normal guibg=none
      hi NonText guibg=none
      hi Normal ctermbg=none
      hi NonText ctermbg=none
    ]])
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = visualSettingsGroup,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300
    })
  end
})
