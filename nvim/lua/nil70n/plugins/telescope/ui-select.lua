return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require('telescope').load_extension('ui-select')
      vim.g.zoxide_use_select = true
    end
  },
}
