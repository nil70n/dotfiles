local keymap = function()
  local wk = require('which-key')

  wk.register({
    t = { "<cmd>TableModeToggle<CR>", "Table Mode" }
  })
end

return {
  {
    'dhruvasagar/vim-table-mode',
    init = function()
      vim.cmd([[
        function! s:isAtStartOfLine(mapping)
          let text_before_cursor = getline('.')[0 : col('.')-1]
          let mapping_pattern = '\V' . escape(a:mapping, '\')
          let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
          return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
        endfunction

        inoreabbrev <expr> <bar><bar>
                  \ <SID>isAtStartOfLine('\|\|') ?
                  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
        inoreabbrev <expr> __
                  \ <SID>isAtStartOfLine('__') ?
                  \ '<c-o>:silent! TableModeDisable<cr>' : '__'

        " let g:table_mode_corner='+'
        " let g:table_mode_corner_corner='+'
        let g:table_mode_header_fillchar='='
      ]])
    end
  }
}