local telescope_setup = function()
  local telescope = require("telescope")
  local telescopeConfig = require("telescope.config")
  local actions = require "telescope.actions"

  -- Clone the default Telescope configuration
  local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

  -- I want to search in hidden/dot files.
  table.insert(vimgrep_arguments, "--hidden")
  -- I don't want to search in the `.git` directory.
  table.insert(vimgrep_arguments, "--glob")
  table.insert(vimgrep_arguments, "!**/.git/*")


  local select_one_or_multi = function(prompt_bufnr)
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
      require('telescope.actions').close(prompt_bufnr)
      for _, j in pairs(multi) do
        if j.path ~= nil then
          vim.cmd(string.format("%s %s", "edit", j.path))
        end
      end
    else
      require('telescope.actions').select_default(prompt_bufnr)
    end
  end

  telescope.setup({
    defaults = {
      layout_strategy = 'center',
      -- `hidden = true` is not supported in text grep commands.
      vimgrep_arguments = vimgrep_arguments,
      path_display = { "truncate" },
      mappings = {
        n = {
          ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<CR>"] = actions.select_default,
          ["<C-y>"] = select_one_or_multi,
          ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-S-d>"] = actions.delete_buffer,
        }
      },
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      undo = {
        use_delta = true,
        use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
        side_by_side = false,
        diff_context_lines = vim.o.scrolloff,
        entry_format = "state #$ID, $STAT, $TIME",
        mappings = {
          i = {
            ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            ["<cr>"] = require("telescope-undo.actions").restore,
          },
        },
      },
    },
  })
end

local telescope_keymaps = function()
  local wk = require('which-key')

  wk.register({
    g = {
      name = "Go to",
      s = { '<cmd>AdvancedGitSearch<CR>', 'Advanced Git Search' },
      c = { '<cmd>Telescope git_commits<CR>', 'Search Git Commits' },
      b = { '<cmd>Telescope git_bcommits<CR>', 'Search Git Commits for Buffer' },
    },
    f = {
      name = "Find",
      b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
      c = { '<cmd>Telescope commands<CR>', 'Commands' },
      C = { '<cmd>Telescope colors<CR>', 'Colorschemes' },
      e = { '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', 'File Explorer' },
      f = { '<cmd>Telescope find_files<CR>', 'Files' },
      g = { '<cmd>Telescope live_grep<CR>', 'Live Grep' },
      h = { '<cmd>Telescope help_tags<CR>', 'Help Tags' },
      r = { '<cmd>Telescope frecency<CR>', 'Recent Files' },
      s = { '<cmd>Telescope symbols<CR>', 'Symbols' },
      u = { '<cmd>Telescope undo<CR>', 'Undo' },
      w = { '<cmd>Telescope grep_string<CR>', 'Word Under Cursor' },
      y = { '<cmd>Telescope neoclip<CR>', 'Yank list' },
    },
  }, { prefix = '<leader>' })

  wk.register({
    m = {
      name = "Marks",
      a = { '<cmd>Telescope vim_bookmarks all<CR>', 'All' },
      c = { '<cmd>Telescope vim_bookmarks current_file<CR>', 'Current File' },
    }
  })
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      telescope_setup()
      telescope_keymaps()
    end
  },
}
