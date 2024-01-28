return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        xmlformat = {
          cmd = { "xmlformat" },
          args = { "--selfclose", "-" },
        },
      },
      formatters_by_ft = {
        cs = { "omnisharp" },
        html = { "prettier" },
        json = { "prettier" },
        astro = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier", "injected" },
        xml = { "xmlformat" },
      },
    }
  },
}
