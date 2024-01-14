return {
  {
    "exosyphon/telescope-color-picker.nvim",
    config = function()
      require("telescope").load_extension("colors")
    end
  },
}
