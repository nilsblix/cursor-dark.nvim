# cursor-dark.nvim

Neovim colorscheme port of Cursor's default dark theme. No runtime dependencies.

This project and structure was highly inspired by
[cursor-light.nvim](https://github.com/vpoltora/cursor-light.nvim). Go check it
out, the theme and styling is superb.

## Installation

### lazy.nvim
```lua
{
    "nilsblix/cursor-dark.nvim",
    name = "cursor-dark",
    priority = 1000,
}
```

### Configuration
```lua
require("cursor-dark").setup({
    ui = true,
    disable_italics = false,
    integrations = {
        lspsaga = true,
        nvim_tree = true,
        barbar = true,
    },
})
```

## Usage
```lua
vim.cmd.colorscheme("cursor-dark")
```
