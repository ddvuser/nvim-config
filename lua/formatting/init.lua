local M = {}

M.setup = function()

  local autoformat_setup = require('formatting.autoformat-setup')
  autoformat_setup.setup()

  local cmp_setup = require('formatting.cmp-setup')
  cmp_setup.setup()

end

return M
