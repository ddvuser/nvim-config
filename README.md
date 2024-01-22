# nvim-config

## Requirements

In order to see `nvim-web-devicons` you have to download and install `patched font` and configure your terminal to use downloaded font: [Patched fonts](https://www.nerdfonts.com/)

PIP:

```bash
sudo apt install python3-pip
```

### LSP configuration

If you don't need any of the package below you can comment it out in `lsp-setup.lua`

Python LSP (jedi_language_server) requires python-venv:

```bash
sudo apt install python3.10-venv
```

HTML LSP requires nodejs:

```bash
sudo apt install nodejs
```

### DAP configuration

Currently configured local-lua, debugpy and lldb debuggers. If you won't use it you don't have to worry about the below configurations.

#### Lua debugger

Install lua:

```bash
sudo apt install lua5.4
```

Install local-lua-debugger-vscode, either via:

```bash
cd ~
mkdir .virtualenvs && cd .virtualenvs
git clone https://github.com/tomblind/local-lua-debugger-vscode && cd local-lua-debugger-vscode
npm install
npm run build
```

#### Python debugger

To use debugpy inside nvim use this command: `:MasonInstall debugpy`

#### C/C++/Rust debugger

Install cpptools: `:MasonInstall cpptools`

Then inside lua/dap-setup/dap-setup-cfg.lua change your username inside command variable:

```lua
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/<your_username>/.local/share/nvim/mason/bin/OpenDebugAD7',
  }
```

