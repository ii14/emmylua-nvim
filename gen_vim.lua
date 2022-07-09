local fns = {}

local RUNTIME = vim.env.VIMRUNTIME

local files = { 'shared.lua', '_editor.lua' }

local lines = {[[
---@meta

vim.F          = require('vim.F')
vim.filetype   = require('vim.filetype')
vim.fs         = require('vim.fs')
vim.health     = require('vim.health')
vim.highlight  = require('vim.highlight')
vim.keymap     = require('vim.keymap')
vim.lsp        = require('vim.lsp')
vim.treesitter = require('vim.treesitter')
vim.ui         = require('vim.ui')
vim.inspect    = require('vim.inspect')

vim.log = {
  levels = {
    TRACE = 0,
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
    OFF = 5,
  },
}

--- Gets the version of the current Nvim build.
---@return table
function vim.version() end

--- Schedules callback to be invoked soon by the main event-loop. Useful
--- to avoid textlock or other temporary restrictions.
---@param cb function
function vim.schedule(cb) end

--- Returns true if the code is executing as part of a "fast" event
--- handler, where most of the API is disabled. These are low-level events
--- (e.g. lua-loop-callbacks) which can be invoked whenever Nvim polls
--- for input. When this is `false` most API functions are callable (but
--- may be subject to other restrictions such as textlock).
---@return boolean
function vim.in_fast_event() end

--- Invokes vim-function or user-function {func} with arguments {...}.
--- See also vim.fn.
--- Equivalent to: `vim.fn[func]({...})`
---@param func string
function vim.call(func, ...) end

function vim.rpcrequest(channel, method, ...) end

function vim.rpcnotify(channel, method, ...) end

--- Wait for {time} in milliseconds until {callback} returns `true`.
---
--- Executes {callback} immediately and at approximately {interval}
--- milliseconds (default 200). Nvim still processes other events during
--- this time.
---
--- Parameters:
---  - {time}      Number of milliseconds to wait
---  - {callback}  Optional callback. Waits until {callback} returns true
---  - {interval}  (Approximate) number of milliseconds to wait between polls
---  - {fast_only} If true, only api-fast events will be processed.
---                If called from while in an api-fast event, will
---                automatically be set to `true`.
---
--- Returns:
--- - If {callback} returns `true` during the {time}: `true, nil`
--- - If {callback} never returns `true` during the {time}: `false, -1`
--- - If {callback} is interrupted during the {time}: `false, -2`
--- - If {callback} errors, the error is raised.
---
--- Examples:
---
--- ```
---     -- Wait for 100 ms, allowing other events to process
---     vim.wait(100, function() end)
---     -- Wait for 100 ms or until global variable set.
---     vim.wait(100, function() return vim.g.waiting_for_var end)
---     -- Wait for 1 second or until global variable set, checking every ~500 ms
---     vim.wait(1000, function() return vim.g.waiting_for_var end, 500)
---     -- Schedule a function to set a value in 100ms
---     vim.defer_fn(function() vim.g.timer_result = true end, 100)
---     -- Would wait ten seconds if results blocked. Actually only waits  100 ms
---     if vim.wait(10000, function() return vim.g.timer_result end) then
---       print('Only waiting a little bit of time!')
---     end
--- ```
---
---@param time integer
---@param callback function
---@param interval integer
---@param fast_only boolean
---@return boolean, integer
function vim.wait(time, callback, interval, fast_only) end
]]}

local function ins(s)
  table.insert(lines, s)
end


local buf = {}
for _, file in ipairs(files) do
  for line in io.lines(RUNTIME..'/lua/vim/'..file) do
    local doc = line:match('^%s*(%-%-%-.*)')
    if doc then
      buf[#buf+1] = doc
    else
      local sig = line:match('^%s*function%s+(vim%..*%(.*%))')
      if sig then
        fns[#fns+1] = { doc = buf, sig = sig }
      end
      buf = {}
    end
  end
end

for _, fn in ipairs(fns) do
  ins('')
  ins(table.concat(fn.doc, '\n'))
  ins(('function %s end'):format(fn.sig))
end

local f = io.open('./nvim/library/vim.lua', 'w+b')
f:write(table.concat(lines, '\n'))
f:flush()
