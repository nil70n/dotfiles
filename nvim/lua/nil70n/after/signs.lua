vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = ' ',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine',
  },
  {
    name = 'DiagnosticSignWarn',
    text = ' ',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarningLine',
    numhl = 'WarningMsg',
  },
  {
    name = 'DiagnosticSignInfo',
    text = ' ',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine',
    numhl = 'InfoMsg',
  },
  {
    name = 'DiagnosticSignHint',
    text = ' ',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine',
    numhl = 'HintMsg',
  },
  {
    name = 'DapBreakpoint',
    text = '',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  {
    name = 'DapBreakpointCondition',
    text = 'ﳁ',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  {
    name = 'DapBreakpointRejected',
    text = '',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  {
    name = 'DapLogPoint',
    text = '',
    texthl = 'DapLogPoint',
    linehl = 'DapLogPoint',
    numhl = 'DapLogPoint',
  },
  {
    name = 'DapStopped',
    text = '',
    texthl = 'DapStopped',
    linehl = 'DapStopped',
    numhl = 'DapStopped',
  }
})
