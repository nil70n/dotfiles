return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      require("nil70n.keymaps.harpoon")
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    config = function(_,_)
      require("nil70n.keymaps.misc")
    end,
  },
}
