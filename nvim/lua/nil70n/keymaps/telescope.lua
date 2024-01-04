local wk = require('which-key')

wk.register({
  g = {
    name = "Git",
    g = { '<cmd>LazyGitCurrentFile<CR>', 'Current Git Repo' },
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
