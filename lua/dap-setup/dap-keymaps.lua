local M = {}

vim.fn.sign_define('DapBreakpoint', { text = '🔴' })
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

M.setup = function()
  local dap = require("dap")
  local ui = require("dapui")
  -- Start debugging session
  vim.keymap.set("n", "<leader>ds", function()
    dap.continue()
    ui.toggle({})
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  end, { desc = "Debug: Start debugging session" })

  -- Set breakpoints, get variable values, step into/out of functions, etc.
  vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Debug: Step Over"})
  vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
  vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
  vim.keymap.set("n", "<leader>dC", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
  end, { desc = "Debug: Clear Breakpoints" })

  -- Close debugger and clear breakpoints
  vim.keymap.set("n", "<leader>de", function()
    dap.clear_breakpoints()
    ui.toggle({})
    dap.terminate()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
  end, { desc = 'Debug: Close Debugger/Clear Breakpoints' })
end

return M

-- vim: ts=2 sts=2 sw=2 et
