return {
  {
    dir = "~/nil70n/repo/csharp.nvim",
    config = function()
      require('csharp').setup()
    end
  },
  {
    'JesperLundberg/projektgunnar.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'echasnovski/mini.pick', version = false },
    }
  },
  { "Issafalcon/neotest-dotnet" },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
}
