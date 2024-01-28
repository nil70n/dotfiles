local keymap = function()
  local wk = require('which-key')

  wk.register({
    h = { require('floating-help').toggle, "Help" },
    -- ['?'] = {
    --   function() require('floating-help').open('t=cppman', vim.fn.expand('<cword>')) end,
    --   "Word Help",
    -- }
  }, { prefix = "<leader>" })
end

return {
  {
    'Tyler-Barham/floating-help.nvim',
    config = function()
      require('floating-help').setup({
        width = 120,
        position = 'C'
      })
      -- Only replace cmds, not search; only replace the first instance
      local function cmd_abbrev(abbrev, expansion)
        local cmd = 'cabbr ' ..
            abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
        vim.cmd(cmd)
      end

      -- Redirect `:h` to `:FloatingHelp`
      cmd_abbrev('h', 'FloatingHelp')
      cmd_abbrev('help', 'FloatingHelp')
      cmd_abbrev('helpc', 'FloatingHelpClose')
      cmd_abbrev('helpclose', 'FloatingHelpClose')

      keymap()
    end
  },
}
