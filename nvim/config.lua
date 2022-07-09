name = 'nvim'

files = {
  'lua/.*%.lua',

  'nvim/init.lua',

  'color/.*%.lua',
  'compiler/.*%.lua',
  'ftdetect/.*%.lua',
  'ftplugin/.*%.lua',
  'plugin/.*%.lua',

  'after/color/.*%.lua',
  'after/compiler/.*%.lua',
  'after/ftdetect/.*%.lua',
  'after/ftplugin/.*%.lua',
  'after/plugin/.*%.lua',
}

words = {
  'vim%.'
}

configs = {
  {
    key = 'Lua.runtime.version',
    action = 'set',
    value = 'LuaJIT',
  },
  {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = 'vim',
  },
}
