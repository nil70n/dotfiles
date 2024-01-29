return {
  {
    'puremourning/vimspector',
    lazy = false,
    config = function()
      local wk = require('which-key')

      wk.register({
        ['<M-r>'] = { '<cmd>call vimspector#Continue()<CR>', 'Debugger: Run / Continue' },
        ['<M-n>'] = { '<cmd>call vimspector#StepOver()<CR>', 'Debugger: Step Over' },
        ['<M-i>'] = { '<cmd>call vimspector#StepInto()<CR>', 'Debugger: Step Into' },
        ['<M-o>'] = { '<cmd>call vimspector#StepOut()<CR>', 'Debugger: Step Out' },
        ['<M-c>'] = { '<cmd>call vimspector#RunToCursor()<CR>', 'Debugger: Run to Cursor' },
        ['<M-p>'] = { '<cmd>call vimspector#Pause()<CR>', 'Debugger: Pause' },
        ['<M-s>'] = { '<cmd>call vimspector#Stop()<CR>', 'Debugger: Stop' },
        ['<M-q>'] = { '<cmd>call vimspector#Reset()<CR>', 'Debugger: Quit' },
        ['<M-u>'] = { '<cmd>call vimspector#UpFrame()<CR>', 'Call Stack Scroll Up' },
        ['<M-d>'] = { '<cmd>call vimspector#DownFrame()<CR>', 'Call Stack Scroll Down' },
      })

      wk.register({
        d = {
          name = 'Debugging',
          b = { '<cmd>call vimspector#ToggleBreakpoint()<CR>', 'Toggle Breakpoint' },
          -- TODO: Learn how to pass arguments for this kind of mapping
          -- B = { '<cmd>call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )<CR>', 'Set Conditional Breakpoint' },
          -- f = { '<cmd>call vimspector#AddFunctionBreakpoint( "<cexpr>" )<CR>', 'Set Function Breakpoint (Expression under Cursor)' },
          a = { '<cmd>call vimspector#ListBreakpoints()<CR>', 'List Breakpoints' },
          i = { '<cmd>VimspectorBalloonEval<CR>', 'Inspect Expression under Cursor' },
          d = { '<cmd>call vimspector#ShowDisassembly()<CR>', 'Disassemble' },
        }
      }, { prefix = '<leader>' })
    end,
  },
}
