return {
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "prepend",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "hrsh7th/nvim-cmp" },
    opts = {
      ensure_installed = {
        "gopls",
        "sqlls",
        "eslint",
        "tsserver",
        "svelte",
        "tailwindcss",
        "html",
        "astro",
        "intelephense",
        "rust_analyzer",
        "omnisharp",
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ capabilities = lsp_capabilities })
        end,
        ["omnisharp"] = function()
          local lsp = require('lspconfig')
          local pid = vim.fn.getpid()

          lspconfig.omnisharp.setup({
            cmd = { 'omnisharp', '--languageserver' , '--hostPID', tostring(pid) },
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
        end,
      })
    end,
  },
}
