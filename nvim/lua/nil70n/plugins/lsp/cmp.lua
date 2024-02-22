return {
  {
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'SirVer/ultisnips',
        'honza/vim-snippets',
        'quangnguyen30192/cmp-nvim-ultisnips',
      },
      config = function()
        local cmp = require('cmp')

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            {
              name = 'cmdline',
              -- option = {
              --   ignore_cmds = { 'Man', '!' }
              -- }
            }
          })
        })

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = 'wilder' },
            { name = 'treesitter' },
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'ultisnips' },
            { name = 'emoji' },
            { name = 'vim-dadbod-completion' },
          }, {
            { name = 'buffer' },
          }),
          experimental = {
            ghost_text = true,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-q>'] = cmp.mapping.abort(),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
          }),
        })
      end,
    }
  },
}
