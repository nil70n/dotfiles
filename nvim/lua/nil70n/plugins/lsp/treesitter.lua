return {
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
            "json",
          },
        },
      })
    end,
  },
}