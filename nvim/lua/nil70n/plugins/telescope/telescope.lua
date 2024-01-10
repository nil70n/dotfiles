return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require("nil70n.configs.telescope")
      require("nil70n.keymaps.telescope")
    end
  },
  { 'nvim-telescope/telescope-fzf-native.nvim',    build = "make" },
  { "exosyphon/telescope-color-picker.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "debugloop/telescope-undo.nvim" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-frecency.nvim" }
}
