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
      local secrets = require('nil70n.settings.secrets')

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          if server_name == 'grammarly' then
            lspconfig[server_name].setup({
              capabilities = lsp_capabilities,
              init_options = { client_id = secrets.grammarly.client_id }
            })
          else
            lspconfig[server_name].setup({ capabilities = lsp_capabilities })
          end
        end,
      })
    end,
  },
}
