local filetypes = {
  'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
  'xml',
  'php',
  'markdown',
  'astro', 'glimmer', 'handlebars', 'hbs',
  'cshtml',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'c_sharp',
          'css',
          'scss',
          'elixir',
          'fish',
          'graphql',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'php',
          'python',
          'regex',
          'ruby',
          'rust',
          'scss',
          'sql',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
          'query',
          'dockerfile',
          'go',
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = filetypes,
        },
      })

      require('template-string').setup()

      -- Folding
      local opt = vim.opt
      opt.foldmethod = 'expr'
      opt.foldexpr = 'nvim_treesitter#foldexpr()'
      opt.foldenable = false -- Disable folding at startup.
    end,
  },
}
