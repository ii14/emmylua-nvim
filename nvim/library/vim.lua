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
---@param callback function?
---@param interval integer?
---@param fast_only boolean?
---@return boolean, integer
function vim.wait(time, callback, interval, fast_only) end


--- Returns a deep copy of the given object. Non-table objects are copied as
--- in a typical Lua assignment, whereas table objects are copied recursively.
--- Functions are naively copied, so functions in the copied table point to the
--- same functions as those in the input table. Userdata and threads are not
--- copied and will throw an error.
---
---@generic T: table
---@param orig T Table to copy
---@return T Table of copied keys and (nested) values.
function vim.deepcopy(orig) end

--- Splits a string at each instance of a separator.
---
--- Example:
---   <pre>lua
---   for s in vim.gsplit(':aa::b:', ':', {plain=true}) do
---     print(s)
---   end
---   </pre>
---
--- If you want to also inspect the separator itself (instead of discarding it), use
--- |string.gmatch()|. Example:
---   <pre>lua
---   for word, num in ('foo111bar222'):gmatch('([^0-9]*)(%d*)') do
---     print(('word: %s num: %s'):format(word, num))
---   end
---   </pre>
---
--- @see |string.gmatch()|
--- @see |vim.split()|
--- @see |luaref-patterns|
--- @see https://www.lua.org/pil/20.2.html
--- @see http://lua-users.org/wiki/StringLibraryTutorial
---
--- @param s string String to split
--- @param sep string Separator or pattern
--- @param opts (table|nil) Keyword arguments |kwargs|:
---       - plain: (boolean) Use `sep` literally (as in string.find).
---       - trimempty: (boolean) Discard empty segments at start and end of the sequence.
---@return fun():string|nil (function) Iterator over the split components
function vim.gsplit(s, sep, opts) end

--- Splits a string at each instance of a separator.
---
--- Examples:
--- <pre>lua
---  split(":aa::b:", ":")                   --> {'','aa','','b',''}
---  split("axaby", "ab?")                   --> {'','x','y'}
---  split("x*yz*o", "*", {plain=true})      --> {'x','yz','o'}
---  split("|x|y|z|", "|", {trimempty=true}) --> {'x', 'y', 'z'}
--- </pre>
---
---@see |vim.gsplit()|
---@see |string.gmatch()|
---
---@param s string String to split
---@param sep string Separator or pattern
---@param opts (table|nil) Keyword arguments |kwargs| accepted by |vim.gsplit()|
---@return string[] List of split components
function vim.split(s, sep, opts) end

--- Return a list of all keys used in a table.
--- However, the order of the return table of keys is not guaranteed.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@generic T: table
---@param t table<T, any> (table) Table
---@return T[] (list) List of keys
function vim.tbl_keys(t) end

--- Return a list of all values used in a table.
--- However, the order of the return table of values is not guaranteed.
---
---@generic T
---@param t table<any, T> (table) Table
---@return T[] (list) List of values
function vim.tbl_values(t) end

--- Apply a function to all values of a table.
---
---@generic T
---@param func fun(value: T): any (function) Function
---@param t table<any, T> (table) Table
---@return table Table of transformed values
function vim.tbl_map(func, t) end

--- Filter a table using a predicate function
---
---@generic T
---@param func fun(value: T): boolean (function) Function
---@param t table<any, T> (table) Table
---@return T[] (table) Table of filtered values
function vim.tbl_filter(func, t) end

--- Checks if a list-like (vector) table contains `value`.
---
---@param t table Table to check
---@param value any Value to compare
---@return boolean `true` if `t` contains `value`
function vim.tbl_contains(t, value) end

--- Checks if a table is empty.
---
---@see https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table Table to check
---@return boolean `true` if `t` is empty
function vim.tbl_isempty(t) end

--- Merges two or more map-like tables.
---
---@see |extend()|
---
---@param behavior string Decides what to do if a key is found in more than one map:
---      - "error": raise an error
---      - "keep":  use value from the leftmost map
---      - "force": use value from the rightmost map
---@param ... table Two or more map-like tables
---@return table Merged table
function vim.tbl_extend(behavior, ...) end

--- Merges recursively two or more map-like tables.
---
---@see |vim.tbl_extend()|
---
---@generic T1: table
---@generic T2: table
---@param behavior "error"|"keep"|"force" (string) Decides what to do if a key is found in more than one map:
---      - "error": raise an error
---      - "keep":  use value from the leftmost map
---      - "force": use value from the rightmost map
---@param ... T2 Two or more map-like tables
---@return T1|T2 (table) Merged table
function vim.tbl_deep_extend(behavior, ...) end

--- Deep compare values for equality
---
--- Tables are compared recursively unless they both provide the `eq` metamethod.
--- All other types are compared using the equality `==` operator.
---@param a any First value
---@param b any Second value
---@return boolean `true` if values are equals, else `false`
function vim.deep_equal(a, b) end

--- Add the reverse lookup values to an existing table.
--- For example:
--- ``tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }``
---
--- Note that this *modifies* the input.
---@param o table Table to add the reverse to
---@return table o
function vim.tbl_add_reverse_lookup(o) end

--- Index into a table (first argument) via string keys passed as subsequent arguments.
--- Return `nil` if the key does not exist.
---
--- Examples:
--- <pre>lua
---  vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true
---  vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil
--- </pre>
---
---@param o table Table to index
---@param ... string Optional strings (0 or more, variadic) via which to index the table
---
---@return any Nested value indexed by key (if it exists), else nil
function vim.tbl_get(o, ...) end

--- Extends a list-like table with the values of another list-like table.
---
--- NOTE: This mutates dst!
---
---@see |vim.tbl_extend()|
---
---@generic T: table
---@param dst T List which will be modified and appended to
---@param src table List from which values will be inserted
---@param start (integer|nil) Start index on src. Defaults to 1
---@param finish (integer|nil) Final index on src. Defaults to `#src`
---@return T dst
function vim.list_extend(dst, src, start, finish) end

--- Creates a copy of a list-like table such that any nested tables are
--- "unrolled" and appended to the result.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table List-like table
---@return table Flattened copy of the given list-like table
function vim.tbl_flatten(t) end

--- Enumerate a table sorted by its keys.
---
---@see Based on https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table List-like table
---@return iterator over sorted keys and their values
function vim.spairs(t) end

--- Tests if a Lua table can be treated as an array.
---
--- Empty table `{}` is assumed to be an array, unless it was created by
--- |vim.empty_dict()| or returned as a dict-like |API| or Vimscript result,
--- for example from |rpcrequest()| or |vim.fn|.
---
---@param t table Table
---@return boolean `true` if array-like table, else `false`
function vim.tbl_islist(t) end

--- Counts the number of non-nil values in table `t`.
---
--- <pre>lua
--- vim.tbl_count({ a=1, b=2 })  --> 2
--- vim.tbl_count({ 1, 2 })      --> 2
--- </pre>
---
---@see https://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
---@param t table Table
---@return integer Number of non-nil values in table
function vim.tbl_count(t) end

--- Creates a copy of a table containing only elements from start to end (inclusive)
---
---@generic T
---@param list T[] (list) Table
---@param start integer|nil Start range of slice
---@param finish integer|nil End range of slice
---@return T[] (list) Copy of table sliced from start to finish (inclusive)
function vim.list_slice(list, start, finish) end

--- Trim whitespace (Lua pattern "%s") from both sides of a string.
---
---@see |luaref-patterns|
---@see https://www.lua.org/pil/20.2.html
---@param s string String to trim
---@return string String with whitespace removed from its beginning and end
function vim.trim(s) end

--- Escapes magic chars in |lua-patterns|.
---
---@see https://github.com/rxi/lume
---@param s string String to escape
---@return string %-escaped pattern string
function vim.pesc(s) end

--- Tests if `s` starts with `prefix`.
---
---@param s string String
---@param prefix string Prefix to match
---@return boolean `true` if `prefix` is a prefix of `s`
function vim.startswith(s, prefix) end

--- Tests if `s` ends with `suffix`.
---
---@param s string String
---@param suffix string Suffix to match
---@return boolean `true` if `suffix` is a suffix of `s`
function vim.endswith(s, suffix) end

--- Validates a parameter specification (types and values).
---
--- Usage example:
--- <pre>lua
---  function user.new(name, age, hobbies)
---    vim.validate{
---      name={name, 'string'},
---      age={age, 'number'},
---      hobbies={hobbies, 'table'},
---    }
---    ...
---  end
--- </pre>
---
--- Examples with explicit argument values (can be run directly):
--- <pre>lua
---  vim.validate{arg1={{'foo'}, 'table'}, arg2={'foo', 'string'}}
---     --> NOP (success)
---
---  vim.validate{arg1={1, 'table'}}
---     --> error('arg1: expected table, got number')
---
---  vim.validate{arg1={3, function(a) return (a % 2) == 0 end, 'even number'}}
---     --> error('arg1: expected even number, got 3')
--- </pre>
---
--- If multiple types are valid they can be given as a list.
--- <pre>lua
---  vim.validate{arg1={{'foo'}, {'table', 'string'}}, arg2={'foo', {'table', 'string'}}}
---     --> NOP (success)
---
---  vim.validate{arg1={1, {'string', 'table'}}}
---     --> error('arg1: expected string|table, got number')
---
--- </pre>
---
---@param opt table Names of parameters to validate. Each key is a parameter
---          name; each value is a tuple in one of these forms:
---          1. (arg_value, type_name, optional)
---             - arg_value: argument value
---             - type_name: string|table type name, one of: ("table", "t", "string",
---               "s", "number", "n", "boolean", "b", "function", "f", "nil",
---               "thread", "userdata") or list of them.
---             - optional: (optional) boolean, if true, `nil` is valid
---          2. (arg_value, fn, msg)
---             - arg_value: argument value
---             - fn: any function accepting one argument, returns true if and
---               only if the argument is valid. Can optionally return an additional
---               informative error message as the second returned value.
---             - msg: (optional) error string if validation fails
function vim.validate(opt) end


function vim.validate(opt) end

--- Returns true if object `f` can be called as a function.
---
---@param f any Any object
---@return boolean `true` if `f` is callable, else `false`
function vim.is_callable(f) end

--- Creates a table whose members are automatically created when accessed, if they don't already
--- exist.
---
--- They mimic defaultdict in python.
---
--- If {create} is `nil`, this will create a defaulttable whose constructor function is
--- this function, effectively allowing to create nested tables on the fly:
---
--- <pre>lua
--- local a = vim.defaulttable()
--- a.b.c = 1
--- </pre>
---
---@param create function?(key:any):any The function called to create a missing value.
---@return table Empty table with metamethod
function vim.defaulttable(create) end


function vim._system(cmd) end


function vim._os_proc_info(pid) end


function vim._os_proc_children(ppid) end

--- Paste handler, invoked by |nvim_paste()| when a conforming UI
--- (such as the |TUI|) pastes text into the editor.
---
--- Example: To remove ANSI color codes when pasting:
--- <pre>lua
--- vim.paste = (function(overridden)
---   return function(lines, phase)
---     for i,line in ipairs(lines) do
---       -- Scrub ANSI color codes from paste input.
---       lines[i] = line:gsub('\27%[[0-9;mK]+', '')
---     end
---     overridden(lines, phase)
---   end
--- end)(vim.paste)
--- </pre>
---
---@see |paste|
---@alias paste_phase -1 | 1 | 2 | 3
---
---@param lines  string[] # |readfile()|-style list of lines to paste. |channel-lines|
---@param phase paste_phase  -1: "non-streaming" paste: the call contains all lines.
---              If paste is "streamed", `phase` indicates the stream state:
---                - 1: starts the paste (exactly once)
---                - 2: continues the paste (zero or more times)
---                - 3: ends the paste (exactly once)
---@returns boolean # false if client should cancel the paste.
function vim.paste(lines, phase) end

--- Defers callback `cb` until the Nvim API is safe to call.
---
---@see |lua-loop-callbacks|
---@see |vim.schedule()|
---@see |vim.in_fast_event()|
---@param cb function
---@return function
function vim.schedule_wrap(cb) end

--- Execute Vim script commands.
---
--- Note that `vim.cmd` can be indexed with a command name to return a callable function to the
--- command.
---
--- Example:
--- <pre>lua
---   vim.cmd('echo 42')
---   vim.cmd([[
---     augroup My_group
---       autocmd!
---       autocmd FileType c setlocal cindent
---     augroup END
---   ]])
---
---   -- Ex command :echo "foo"
---   -- Note string literals need to be double quoted.
---   vim.cmd('echo "foo"')
---   vim.cmd { cmd = 'echo', args = { '"foo"' } }
---   vim.cmd.echo({ args = { '"foo"' } })
---   vim.cmd.echo('"foo"')
---
---   -- Ex command :write! myfile.txt
---   vim.cmd('write! myfile.txt')
---   vim.cmd { cmd = 'write', args = { "myfile.txt" }, bang = true }
---   vim.cmd.write { args = { "myfile.txt" }, bang = true }
---   vim.cmd.write { "myfile.txt", bang = true }
---
---   -- Ex command :colorscheme blue
---   vim.cmd('colorscheme blue')
---   vim.cmd.colorscheme('blue')
--- </pre>
---
---@param command string|table Command(s) to execute.
---                            If a string, executes multiple lines of Vim script at once. In this
---                            case, it is an alias to |nvim_exec2()|, where `opts.output` is set
---                            to false. Thus it works identical to |:source|.
---                            If a table, executes a single command. In this case, it is an alias
---                            to |nvim_cmd()| where `opts` is empty.
---@see |ex-cmd-index|
function vim.cmd(command) end

--- Get a table of lines with start, end columns for a region marked by two points.
--- Input and output positions are (0,0)-indexed and indicate byte positions.
---
---@param bufnr integer number of buffer
---@param pos1 integer[] (line, column) tuple marking beginning of region
---@param pos2 integer[] (line, column) tuple marking end of region
---@param regtype string type of selection, see |setreg()|
---@param inclusive boolean indicating whether column of pos2 is inclusive
---@return table region Table of the form `{linenr = {startcol,endcol}}`.
---        `endcol` is exclusive, and whole lines are marked with
---        `{startcol,endcol} = {0,-1}`.
function vim.region(bufnr, pos1, pos2, regtype, inclusive) end

--- Defers calling `fn` until `timeout` ms passes.
---
--- Use to do a one-shot timer that calls `fn`
--- Note: The {fn} is |vim.schedule_wrap()|ped automatically, so API functions are
--- safe to call.
---@param fn function Callback to call once `timeout` expires
---@param timeout integer Number of milliseconds to wait before calling `fn`
---@return table timer luv timer object
function vim.defer_fn(fn, timeout) end

--- Display a notification to the user.
---
--- This function can be overridden by plugins to display notifications using a
--- custom provider (such as the system notification provider). By default,
--- writes to |:messages|.
---
---@param msg string Content of the notification to show to the user.
---@param level integer|nil One of the values from |vim.log.levels|.
---@param opts table|nil Optional parameters. Unused by default.
function vim.notify(msg, level, opts) end

--- Display a notification only one time.
---
--- Like |vim.notify()|, but subsequent calls with the same message will not
--- display a notification.
---
---@param msg string Content of the notification to show to the user.
---@param level integer|nil One of the values from |vim.log.levels|.
---@param opts table|nil Optional parameters. Unused by default.
---@return boolean true if message was displayed, else false
function vim.notify_once(msg, level, opts) end

--- Adds Lua function {fn} with namespace id {ns_id} as a listener to every,
--- yes every, input key.
---
--- The Nvim command-line option |-w| is related but does not support callbacks
--- and cannot be toggled dynamically.
---
---@param fn function: Callback function. It should take one string argument.
---                   On each key press, Nvim passes the key char to fn(). |i_CTRL-V|
---                   If {fn} is nil, it removes the callback for the associated {ns_id}
---@param ns_id integer? Namespace ID. If nil or 0, generates and returns a new
---                    |nvim_create_namespace()| id.
---
---@return integer Namespace id associated with {fn}. Or count of all callbacks
---if on_key() is called without arguments.
---
---@note {fn} will be removed if an error occurs while calling.
---@note {fn} will not be cleared by |nvim_buf_clear_namespace()|
---@note {fn} will receive the keys after mappings have been evaluated
function vim.on_key(fn, ns_id) end

--- Executes the on_key callbacks.
---@private
function vim._on_key(char) end

--- Generate a list of possible completions for the string.
--- String has the pattern.
---
---     1. Can we get it to just return things in the global namespace with that name prefix
---     2. Can we get it to return things from global namespace even with `print(` in front.
function vim._expand_pat(pat, env) end

--- Omnifunc for completing lua values from from the runtime lua interpreter,
--- similar to the builtin completion for the `:lua` command.
---
--- Activate using `set omnifunc=v:lua.vim.lua_omnifunc` in a lua buffer.
function vim.lua_omnifunc(find_start, _) end

---@private
function vim.pretty_print(...) end

--- "Pretty prints" the given arguments and returns them unmodified.
---
--- Example:
--- <pre>lua
---   local hl_normal = vim.print(vim.api.nvim_get_hl_by_name('Normal', true))
--- </pre>
---
--- @see |vim.inspect()|
--- @return any # given arguments.
function vim.print(...) end


function vim._cs_remote(rcid, server_addr, connect_error, args) end

--- Shows a deprecation message to the user.
---
---@param name        string     Deprecated feature (function, API, etc.).
---@param alternative string|nil Suggested alternative feature.
---@param version     string     Version when the deprecated function will be removed.
---@param plugin      string|nil Name of the plugin that owns the deprecated feature.
---                              Defaults to "Nvim".
---@param backtrace   boolean|nil Prints backtrace. Defaults to true.
---
---@returns Deprecated message, or nil if no message was shown.
function vim.deprecate(name, alternative, version, plugin, backtrace) end

--- Create builtin mappings (incl. menus).
--- Called once on startup.
function vim._init_default_mappings() end


function vim._init_default_autocmds() end


function vim._init_defaults() end