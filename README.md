# theme.nvim

Neovim Theme convenient for me.

A fork of: [redbug312/cactusbuddy](https://github.com/redbug312/cactusbuddy).

Based on [tjdevries/colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim).

## Installation

- [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "adrianhornyak/theme.nvim",
    dependencies = "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("muyrux")
    end,
},
```

## Supported Plugins

- diagnostics,
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter),
- [lewis6991/gitsigns.nvim: Git integration for buffers](https://github.com/lewis6991/gitsigns.nvim),
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim),
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive).

## Examples

You can find them in [wiki](https://github.com/IlyasYOY/theme.nvim/wiki/Example).
