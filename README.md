# EmmyLua library for Neovim

Neovim completion library for [sumneko/lua-language-server](https://github.com/sumneko/lua-language-server)

If you have your entire runtime path as a workspace (like on the code snippet below),
it should just work after installing this just like any other plugin. If not, include
the cloned repository in `Lua.workspace.library`.
```lua
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
}
```

Completion for:
* `vim.api` (no documentation)
* `vim.fn` (no documentation)
* `vim.o`, `vim.opt`, `vim.opt_local`, `vim.opt_global` (with documentation)
* modules:
  `vim.F`, `vim.filetype`, `vim.fs`, `vim.health`, `vim.highlight`, `vim.keymap`,
  `vim.lsp`, `vim.treesitter`, `vim.ui`
* some of the top-level `vim.*` functions
