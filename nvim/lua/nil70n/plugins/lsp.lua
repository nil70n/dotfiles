local options = require("nil70n.configs.lsp_options")

return {
  -- ## General LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "c_sharp",
          "css",
          "scss",
          "elixir",
          "fish",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "php",
          "python",
          "regex",
          "ruby",
          "rust",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "query",
          "dockerfile",
          "go",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "svelte",
            "astro",
            "typescript",
            "typescriptreact",
            "vue",
            "xml",
          },
        },
      })
    end,
  },
  { 
    "williamboman/mason.nvim",
    opts = {
      PATH = "prepend",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "hrsh7th/nvim-cmp" },
    opts = options.mason,
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
          })
        end,
      })
    end,
  },

  -- ## Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = { 
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'treesitter' },
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
          { name = 'emoji' },
          { name = 'vim-dadbod-completion' },
        }, {
          { name = 'buffer' },
        }),
        -- formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  },
    -- Snippets creation
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

 -- ## Formatting
 -- {
 --   'stevearc/conform.nvim',
 --   opts = options.conform
 -- },

  -- ## Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
    },
    opts = options.neotest,
  },
  
  -- ## Helpers
  {
    -- Comment with gc/gcc
    'tpope/vim-commentary',
  },
  {
    -- Show errors in the solution
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  {
    -- Code actions in telescope
    "aznhe21/actions-preview.nvim",
    event = "VeryLazy",
  },
  {
    -- Show all todo comments in solution
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
    event = "VeryLazy",
  },
  {
    -- Copilot
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = options.copilot,
  },
}
