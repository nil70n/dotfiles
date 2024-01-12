local keymaps = require("nil70n.keymaps.lsp")

local visualSettingsGroup = vim.api.nvim_create_augroup('VisualSettings', { clear = true })
local indentSettingsGroup = vim.api.nvim_create_augroup('IndentSettings', { clear = true })
local userLspConfigGroup = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

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

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = indentSettingsGroup,
  callback = function()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
    vim.o.expandtab = true
    vim.o.autoindent = true
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = indentSettingsGroup,
  pattern = { '.cs' },
  callback = function()
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.autoindent = true
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = userLspConfigGroup,
  callback = function(ev) keymaps.register_maps(ev) end,
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
