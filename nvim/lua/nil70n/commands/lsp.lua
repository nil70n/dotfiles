local keymaps = require("nil70n.keymaps.lsp")

local indentSettingsGroup = vim.api.nvim_create_augroup('IndentSettings', { clear = true })
local userLspConfigGroup = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

-- Indentation
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
  pattern = { '*.cs' },
  callback = function()
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.autoindent = true
  end,
})

-- Settings
vim.api.nvim_create_autocmd('LspAttach', {
  group = userLspConfigGroup,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client.server_capabilities.completionProvider then
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end

    if client.server_capabilities.definitionProvider then
      vim.bo[ev.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    keymaps.register_maps(ev.buf)

    if (client.name == 'omnisharp') then
      -- require("nil70n.commands.omnisharp-vim")
      keymaps.register_maps_omnisharp(ev.buf)
    end
  end,
})
