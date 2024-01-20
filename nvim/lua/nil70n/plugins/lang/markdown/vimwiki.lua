return {
  {
    "vimwiki/vimwiki",
    lazy = false,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vault/personal",
          diary_rel_path = "Journal/",
          syntax = "markdown",
          ext = ".md",
          nested_syntaxes = {
            ['c#'] = 'csharp',
            js = 'javascript',
            go = 'golang',
            rust = 'rust',
            html = 'html',
          }
        },
      }
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
    end,
  },
}
