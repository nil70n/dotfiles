-- Close all buffers but the current one
vim.api.nvim_create_user_command('BufOnly', function()
  pcall(function()
    vim.fn.Preserve("exec '%bd|e#|bd#'")
  end)
end, {})
