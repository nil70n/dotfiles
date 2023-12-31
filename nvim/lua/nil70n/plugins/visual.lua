return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup() 
    end,
  },
  'MunifTanjim/nui.nvim',
  {
    'rcarriga/nvim-notify',
    config = function ()
      require('notify').setup({
        background_colour = '#000000'
      })
    end
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    depencencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      routes = {
        {
          view = "notify",
          filter = { event = 'notify', find = 'No information available' },
          opts = { skip = true },
        },
        {
          view = "cmdline",
          filter = { event = 'msg_showmode' },
        },
      },
      presets = {
        lsp_doc_border = true,
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        }
      }
    }
  },
}
