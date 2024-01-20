local keymaps = function()
  local wk = require('which-key')
  local dap = require('dap')

  --   local conditional_breakpoint = function()
  --     dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  --   end

  --   local logging_breakpoint = function()
  --     dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  --   end

  wk.register({
    ['<M-r>'] = { function() dap.continue() end, 'Debugger: Run / Continue' },
    ['<M-n>'] = { function() dap.step_over() end, 'Debugger: Step Over' },
    ['<M-i>'] = { function() dap.step_into() end, 'Debugger: Step Into' },
    ['<M-o>'] = { function() dap.step_out() end, 'Debugger: Step Out' },
  })

  wk.register({
    d = {
      name = 'Debugging',
      b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
      B = {
        function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        'Set Conditional Breakpoint',
      },
      lb = {
        function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
        'Set Logging Breakpoint',
      },
      m = { dap.repl.open, 'Reply Open' },
      rl = { dap.run_last, 'Run Last' },
    }
  }, { prefix = '<leader>' })
end

local configurations = function()
  local dap = require('dap')

  dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = { '--interpreter=vscode' }
  }

  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
  }
end

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      configurations()
      keymaps()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end
  },
}
