return {
  "aaronhallaert/advanced-git-search.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
  },
  config = function()
    require("telescope").load_extension("advanced_git_search")
  end
}
