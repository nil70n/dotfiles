-- **********
-- filetype.lua
-- > load filetypes that needs to be recognized by neovim
-- **********

vim.filetype.add({
  extension = {
    { astro = "astro" },
    { mdx = "markdown.mdx" },
  },
  filename = {},
  pattern = {},
})
