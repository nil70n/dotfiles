--local neotest_dotnet = require("neotest-dotnet")

local M = {}

M.mason = {
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
}

M.conform = {
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
    cs = { "csharpier" },
    html = { "prettier" },
    json = { "prettier" },
    astro = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier", "injected" },
    xml = { "xmlformat" },
  },
}

--M.neotest = {
--  adapters = {
--    neotest_dotnet
--  }
--}

M.copilot = {
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<C-CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
}

return M
