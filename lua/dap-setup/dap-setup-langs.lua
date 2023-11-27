local dap = require("dap")

dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    vim.fn.expand("~/.virtualenvs/local-lua-debugger-vscode/extension/debugAdapter.js")
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      c.extensionPath = vim.fn.expand("~/.virtualenvs/local-lua-debugger-vscode/")
      on_config(c)
    else
      on_config(config)
    end
  end,
}

dap.configurations.lua = {
  {
    name = 'Current file (local-lua-dbg, lua)',
    type = 'local-lua',
    request = 'launch',
    cwd = '${workspaceFolder}',
    program = {
      lua = 'lua5.4',
      file = '${file}',
    },
    args = {},
  },
}


dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = vim.fn.expand('~/.virtualenvs/debugpy/bin/python'),
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python';
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy 
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode-14",
    name = "lldb",
}

dap.configurations.c= {
  {
      name = "C/C++ Lauch",
      type = "lldb",
      request = "launch",
      program = "${workspaceFolder}/file",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
  },
}
dap.configurations.cpp = dap.configurations.c

