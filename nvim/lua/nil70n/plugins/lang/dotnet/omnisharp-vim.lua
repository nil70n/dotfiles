return {
  'OmniSharp/omnisharp-vim',
  config = function()
    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp = require('lspconfig')
    local pid = vim.fn.getpid()

    lspconfig.omnisharp.setup({
      cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) },
      capabilities = lsp_capabilities,
      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_demand = false,
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = false,
      sdk_include_prereleases = true,
      analyze_open_documents_only = false,
      root_dir = lsp.util.root_pattern("*.sln", ".git", "cwd", "*.csproj"),
      handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
      }
    })

    vim.g.OmniSharp_server_stdio = 1 -- Use the stdio version of OmniSharp-roslyn - this is the default
    vim.g.OmniSharp_server_path = '/home/nilton/.local/share/nvim/mason/bin/omnisharp'
    vim.g.OmniSharp_want_snippet = 1 -- Use snippets
  end,
}
