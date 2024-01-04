local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local M = {}

M.setup = function()
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
end

return M
