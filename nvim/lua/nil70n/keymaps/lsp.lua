local M = {}

M.register_maps_omnisharp = function(buf)
  local wk = require('which-key')
  local lead_opts = { prefix = "<leader>", buffer = buf }

  wk.register({
    c = {
      name = 'Code',
      w = { '<cmd>OmniSharpHighlightEcho<CR>', 'Type of the Symbol' },
      h = { '<cmd>OmniSharpDocumentation<CR>', 'Documentation' },
      p = {
        name = 'Preview',
        d = { '<cmd>OmniSharpPreviewDefinition<CR>', 'Definition' },
        i = { '<cmd>OmniSharpPreviewImplementation<CR>', 'Implementation' },
      },
      t = {
        name = 'Tests',
        c = { '<cmd>OmniSharpRunTest<CR>', 'Run Current' },
        d = { '<cmd>OmniSharpDebugTest<CR>', 'Debug Current' },
        f = { '<cmd>OmniSharpRunTestsInFile<CR>', 'Run Tests in File' },
        F = { "<cmd>OmniSharpRunTestsInFile % input('File: ')<CR>", 'Run Tests in current and informed file' },
      },
      r = {
        name = 'Run Debug',
        p = { '<cmd>OmniSharpDebugProject<CR>', 'Current Project' },
        c = { '<cmd>OmniSharpCreateDebugConfig<CR>', 'Create .vimspector Debug Config' },
      }
    }
  }, lead_opts)
end

M.register_maps = function(buf)
  local wk = require('which-key')

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = buf }
  local lead_opts = { prefix = "<leader>", buffer = buf }

  wk.register({
    g = {
      name = "Go to",
      D = { vim.lsp.buf.declaration, 'Declaration' },
      d = { '<cmd>Telescope lsp_definitions<CR>', 'Definition' },
      i = { '<cmd>Telescope lsp_implementations<CR>', 'Implementation' },
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
      l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List folders' },
    },
    D = { vim.lsp.buf.type_definition, 'Type definition' },
    r = {
      name = 'Rename',
      s = { vim.lsp.buf.rename, 'Symbol' },
    },
    c = {
      name = 'Code',
      a = { vim.lsp.buf.code_action, 'Actions', mode = { 'n', 'v' } },
      d = { '<cmd>Telescope diagnostics<CR>', 'Diagnostics' },
      f = { function() vim.lsp.buf.format { async = true } end, 'Format Document' },
    }
  }, lead_opts)
end

return M
