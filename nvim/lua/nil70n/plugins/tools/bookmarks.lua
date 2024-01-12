return {
  {
    'MattesGroeger/vim-bookmarks',
    init = function ()
      vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160]])
      vim.cmd([[highlight BookmarkLine ctermbg=194 ctermfg=NONE]])
      vim.g.bookmark_sign = '♥'
      vim.g.bookmark_highlight_lines = 1
    end
  },
  {
    'tom-anders/telescope-vim-bookmarks.nvim',
    config = function ()
      require('telescope').load_extension('vim_bookmarks')
    end
  },
}
