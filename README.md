# cursor-dark.nvim

Neovim colorscheme port of Cursor's default dark theme. No runtime dependencies.

This project and structure was highly inspired by
[cursor-light.nvim](https://github.com/vpoltora/cursor-light.nvim). Go check it
out, the theme and styling is superb.

All of the colours are taken from [Anysphere
Dark](https://github.com/hasokeric/cursor-anysphere-theme.).

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
    italics = true,
})
```

## Usage
```lua
vim.cmd.colorscheme("cursor-dark")
```
