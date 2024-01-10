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
  callback = function(ev)
    local wk = require('which-key')

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    local lead_opts = { prefix = "<leader>", buffer = ev.buf }

    wk.register({
      g = {
        name = "Go to",
        D = { vim.lsp.buf.declaration, 'Declaration' },
        d = { vim.lsp.buf.definition, 'Definition' },
        i = { vim.lsp.buf.implementation, 'Implementation' },
        r = { '<cmd>Telescope lsp_references<CR>', 'References' },
        s = { '<cmd>AdvancedGitSearch<CR>', 'Advanced Git Search' },
        c = { '<cmd>Telescope git_commits<CR>', 'Search Git Commits' },
        b = { '<cmd>Telescope git_bcommits<CR>', 'Search Git Commits for Buffer' },
      },
      K = { vim.lsp.buf.hover, 'Hover' },
      ['<C-k>'] = { vim.lsp.buf.signature_help, "Signature help" }
    }, opts)

    wk.register({
      w = {
        name = "Workspace",
        a = { vim.lsp.buf.add_workspace_folder, 'Add folder' },
        r = { vim.lsp.buf.remove_workspace_folder, 'Remove folder' },
        l = { print(vim.inspect(vim.lsp.buf.list_workspace_folders())), 'List folders' },
      },
      D = { vim.lsp.buf.type_definition, 'Type definition' },
      r = {
        name = 'Rename',
        s = { vim.lsp.buf.rename, 'Symbol' },
      },
      c = {
        name = 'Code',
        a = { vim.lsp.buf.code_action, 'Actions', mode = {'n', 'v'} },
        d = { '<cmd>Telescope diagnostics<CR>', 'Diagnostics' },
        f = { function() vim.lsp.buf.format { async = true } end, 'Format Document' },
      }
    }, lead_opts)
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
