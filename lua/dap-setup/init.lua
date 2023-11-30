local M = {}

M.setup = function ()
  local dap_setup = require("dap-setup.dap-setup")
  dap_setup.setup()

  local dap_setup_keymaps = require("dap-setup.dap-keymaps")
  dap_setup_keymaps.setup()

  local dap_setup_cfg = require("dap-setup.dap-setup-cfg")
  dap_setup_cfg.setup()
end

return M

-- vim: ts=2 sts=2 sw=2 et
