local visualSettingsGroup = vim.api.nvim_create_augroup('VisualSettings', { clear = true })
local indentSettingsGroup = vim.api.nvim_create_augroup('IndentSettings', { clear = true })
local userLspConfigGroup = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

vim.api.nvim_create_autocmd({'ColorScheme'}, {
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

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
	group = indentSettingsGroup,
	callback = function()
		vim.o.tabstop = 2
		vim.o.shiftwidth = 2
		vim.o.expandtab = true
		vim.o.autoindent = true
	end,
})

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
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
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Workspace: add folder" })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Workspace: remove folder" })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "Workspace: list folders" })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to References" })
    vim.keymap.set('n', '<C-f>', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = "Format Document" })
  end,
})
