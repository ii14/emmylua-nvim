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
--- Note: `noref=true` is much more performant on tables with unique table
--- fields, while `noref=false` is more performant on tables that reuse table
--- fields.
---
---@generic T: table
---@param orig T Table to copy
---@param noref? boolean
--- When `false` (default) a contained table is only copied once and all
--- references point to this single copy. When `true` every occurrence of a
--- table results in a new copy. This also means that a cyclic reference can
--- cause `deepcopy()` to fail.
---@return T Table of copied keys and (nested) values.
function vim.deepcopy(orig, noref) end

--- Gets an |iterator| that splits a string at each instance of a separator, in "lazy" fashion
--- (as opposed to |vim.split()| which is "eager").
---
--- Example:
---
--- ```lua
--- for s in vim.gsplit(':aa::b:', ':', {plain=true}) do
---   print(s)
--- end
--- ```
---
--- If you want to also inspect the separator itself (instead of discarding it), use
--- |string.gmatch()|. Example:
---
--- ```lua
--- for word, num in ('foo111bar222'):gmatch('([^0-9]*)(%d*)') do
---   print(('word: %s num: %s'):format(word, num))
--- end
--- ```
---
--- @see |string.gmatch()|
--- @see |vim.split()|
--- @see |lua-patterns|
--- @see https://www.lua.org/pil/20.2.html
--- @see http://lua-users.org/wiki/StringLibraryTutorial
---
--- @param s string String to split
--- @param sep string Separator or pattern
--- @param opts? vim.gsplit.Opts Keyword arguments |kwargs|:
--- @return fun():string? : Iterator over the split components
function vim.gsplit(s, sep, opts) end

--- Splits a string at each instance of a separator and returns the result as a table (unlike
--- |vim.gsplit()|).
---
--- Examples:
---
--- ```lua
--- split(":aa::b:", ":")                   --> {'','aa','','b',''}
--- split("axaby", "ab?")                   --> {'','x','y'}
--- split("x*yz*o", "*", {plain=true})      --> {'x','yz','o'}
--- split("|x|y|z|", "|", {trimempty=true}) --> {'x', 'y', 'z'}
--- ```
---
---@see |vim.gsplit()|
---@see |string.gmatch()|
---
---@param s string String to split
---@param sep string Separator or pattern
---@param opts? vim.gsplit.Opts Keyword arguments |kwargs|:
---@return string[] : List of split components
function vim.split(s, sep, opts) end

--- Return a list of all keys used in a table.
--- However, the order of the return table of keys is not guaranteed.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@generic T
---@param t table<T, any> (table) Table
---@return T[] : List of keys
function vim.tbl_keys(t) end

--- Return a list of all values used in a table.
--- However, the order of the return table of values is not guaranteed.
---
---@generic T
---@param t table<any, T> (table) Table
---@return T[] : List of values
function vim.tbl_values(t) end

--- Apply a function to all values of a table.
---
---@generic T
---@param func fun(value: T): any Function
---@param t table<any, T> Table
---@return table : Table of transformed values
function vim.tbl_map(func, t) end

--- Filter a table using a predicate function
---
---@generic T
---@param func fun(value: T): boolean (function) Function
---@param t table<any, T> (table) Table
---@return T[] : Table of filtered values
function vim.tbl_filter(func, t) end

--- Checks if a table contains a given value, specified either directly or via
--- a predicate that is checked for each value.
---
--- Example:
---
--- ```lua
--- vim.tbl_contains({ 'a', { 'b', 'c' } }, function(v)
---   return vim.deep_equal(v, { 'b', 'c' })
--- end, { predicate = true })
--- -- true
--- ```
---
---@see |vim.list_contains()| for checking values in list-like tables
---
---@param t table Table to check
---@param value any Value to compare or predicate function reference
---@param opts? vim.tbl_contains.Opts Keyword arguments |kwargs|:
---@return boolean `true` if `t` contains `value`
function vim.tbl_contains(t, value, opts) end

--- Checks if a list-like table (integer keys without gaps) contains `value`.
---
---@see |vim.tbl_contains()| for checking values in general tables
---
---@param t table Table to check (must be list-like, not validated)
---@param value any Value to compare
---@return boolean `true` if `t` contains `value`
function vim.list_contains(t, value) end

--- Checks if a table is empty.
---
---@see https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table Table to check
---@return boolean `true` if `t` is empty
function vim.tbl_isempty(t) end

--- Merges two or more tables.
---
---@see |extend()|
---
---@param behavior 'error'|'keep'|'force' Decides what to do if a key is found in more than one map:
---      - "error": raise an error
---      - "keep":  use value from the leftmost map
---      - "force": use value from the rightmost map
---@param ... table Two or more tables
---@return table : Merged table
function vim.tbl_extend(behavior, ...) end

--- Merges recursively two or more tables.
---
--- Only values that are empty tables or tables that are not |lua-list|s (indexed by consecutive
--- integers starting from 1) are merged recursively. This is useful for merging nested tables
--- like default and user configurations where lists should be treated as literals (i.e., are
--- overwritten instead of merged).
---
---@see |vim.tbl_extend()|
---
---@generic T1: table
---@generic T2: table
---@param behavior 'error'|'keep'|'force' Decides what to do if a key is found in more than one map:
---      - "error": raise an error
---      - "keep":  use value from the leftmost map
---      - "force": use value from the rightmost map
---@param ... T2 Two or more tables
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
--- `tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }`
---
--- Note that this *modifies* the input.
---@deprecated
---@param o table Table to add the reverse to
---@return table o
function vim.tbl_add_reverse_lookup(o) end

--- Index into a table (first argument) via string keys passed as subsequent arguments.
--- Return `nil` if the key does not exist.
---
--- Examples:
---
--- ```lua
--- vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true
--- vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil
--- ```
---
---@param o table Table to index
---@param ... any Optional keys (0 or more, variadic) via which to index the table
---@return any # Nested value indexed by key (if it exists), else nil
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
---@param start integer? Start index on src. Defaults to 1
---@param finish integer? Final index on src. Defaults to `#src`
---@return T dst
function vim.list_extend(dst, src, start, finish) end

--- @deprecated
--- Creates a copy of a list-like table such that any nested tables are
--- "unrolled" and appended to the result.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table List-like table
---@return table Flattened copy of the given list-like table
function vim.tbl_flatten(t) end

--- Enumerates key-value pairs of a table, ordered by key.
---
---@see Based on https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@generic T: table, K, V
---@param t T Dict-like table
---@return fun(table: table<K, V>, index?: K):K, V # |for-in| iterator over sorted keys and their values
---@return T
function vim.spairs(t) end

--- Tests if `t` is an "array": a table indexed _only_ by integers (potentially non-contiguous).
---
--- If the indexes start from 1 and are contiguous then the array is also a list. |vim.islist()|
---
--- Empty table `{}` is an array, unless it was created by |vim.empty_dict()| or returned as
--- a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.
---
---@see https://github.com/openresty/luajit2#tableisarray
---
---@param t? table
---@return boolean `true` if array-like table, else `false`.
function vim.isarray(t) end

--- @deprecated
function vim.tbl_islist(t) end

--- Tests if `t` is a "list": a table indexed _only_ by contiguous integers starting from 1 (what
--- |lua-length| calls a "regular array").
---
--- Empty table `{}` is a list, unless it was created by |vim.empty_dict()| or returned as
--- a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.
---
---@see |vim.isarray()|
---
---@param t? table
---@return boolean `true` if list-like table, else `false`.
function vim.islist(t) end

--- Counts the number of non-nil values in table `t`.
---
--- ```lua
--- vim.tbl_count({ a=1, b=2 })  --> 2
--- vim.tbl_count({ 1, 2 })      --> 2
--- ```
---
---@see https://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
---@param t table Table
---@return integer : Number of non-nil values in table
function vim.tbl_count(t) end

--- Creates a copy of a table containing only elements from start to end (inclusive)
---
---@generic T
---@param list T[] Table
---@param start integer|nil Start range of slice
---@param finish integer|nil End range of slice
---@return T[] Copy of table sliced from start to finish (inclusive)
function vim.list_slice(list, start, finish) end

--- Trim whitespace (Lua pattern "%s") from both sides of a string.
---
---@see |lua-patterns|
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

--- Validate function arguments.
---
--- This function has two valid forms:
---
--- 1. vim.validate(name: str, value: any, type: string, optional?: bool)
--- 2. vim.validate(spec: table)
---
--- Form 1 validates that argument {name} with value {value} has the type
--- {type}. {type} must be a value returned by |lua-type()|. If {optional} is
--- true, then {value} may be null. This form is significantly faster and
--- should be preferred for simple cases.
---
--- Example:
---
--- ```lua
--- function vim.startswith(s, prefix)
---   vim.validate('s', s, 'string')
---   vim.validate('prefix', prefix, 'string')
---   ...
--- end
--- ```
---
--- Form 2 validates a parameter specification (types and values). Specs are
--- evaluated in alphanumeric order, until the first failure.
---
--- Usage example:
---
--- ```lua
--- function user.new(name, age, hobbies)
---   vim.validate{
---     name={name, 'string'},
---     age={age, 'number'},
---     hobbies={hobbies, 'table'},
---   }
---   ...
--- end
--- ```
---
--- Examples with explicit argument values (can be run directly):
---
--- ```lua
--- vim.validate{arg1={{'foo'}, 'table'}, arg2={'foo', 'string'}}
---    --> NOP (success)
---
--- vim.validate{arg1={1, 'table'}}
---    --> error('arg1: expected table, got number')
---
--- vim.validate{arg1={3, function(a) return (a % 2) == 0 end, 'even number'}}
---    --> error('arg1: expected even number, got 3')
--- ```
---
--- If multiple types are valid they can be given as a list.
---
--- ```lua
--- vim.validate{arg1={{'foo'}, {'table', 'string'}}, arg2={'foo', {'table', 'string'}}}
--- -- NOP (success)
---
--- vim.validate{arg1={1, {'string', 'table'}}}
--- -- error('arg1: expected string|table, got number')
--- ```
---
---@param opt table<vim.validate.Type,vim.validate.Spec> (table) Names of parameters to validate. Each key is a parameter
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
--- @overload fun(name: string, val: any, expected: string, optional?: boolean)
function vim.validate(opt, ...) end

--- Returns true if object `f` can be called as a function.
---
---@param f any Any object
---@return boolean `true` if `f` is callable, else `false`
function vim.is_callable(f) end

--- Creates a table whose missing keys are provided by {createfn} (like Python's "defaultdict").
---
--- If {createfn} is `nil` it defaults to defaulttable() itself, so accessing nested keys creates
--- nested tables:
---
--- ```lua
--- local a = vim.defaulttable()
--- a.b.c = 1
--- ```
---
---@param createfn? fun(key:any):any Provides the value for a missing `key`.
---@return table # Empty table with `__index` metamethod.
function vim.defaulttable(createfn) end

--- Create a ring buffer limited to a maximal number of items.
--- Once the buffer is full, adding a new entry overrides the oldest entry.
---
--- ```lua
--- local ringbuf = vim.ringbuf(4)
--- ringbuf:push("a")
--- ringbuf:push("b")
--- ringbuf:push("c")
--- ringbuf:push("d")
--- ringbuf:push("e")    -- overrides "a"
--- print(ringbuf:pop()) -- returns "b"
--- print(ringbuf:pop()) -- returns "c"
---
--- -- Can be used as iterator. Pops remaining items:
--- for val in ringbuf do
---   print(val)
--- end
--- ```
---
--- Returns a Ringbuf instance with the following methods:
---
--- - |Ringbuf:push()|
--- - |Ringbuf:pop()|
--- - |Ringbuf:peek()|
--- - |Ringbuf:clear()|
---
---@param size integer
---@return vim.Ringbuf ringbuf
function vim.ringbuf(size) end

--- @private
--- @generic T
--- @param root string
--- @param mod T
--- @return T
function vim._defer_require(root, mod) end

--- Executes function `f` with the given context specification.
---
--- Notes:
--- - Context `{ buf = buf }` has no guarantees about current window when
---   inside context.
--- - Context `{ buf = buf, win = win }` is yet not allowed, but this seems
---   to be an implementation detail.
--- - There should be no way to revert currently set `context.sandbox = true`
---   (like with nested `vim._with()` calls). Otherwise it kind of breaks the
---   whole purpose of sandbox execution.
--- - Saving and restoring option contexts (`bo`, `go`, `o`, `wo`) trigger
---   `OptionSet` events. This is an implementation issue because not doing it
---   seems to mean using either 'eventignore' option or extra nesting with
---   `{ noautocmd = true }` (which itself is a wrapper for 'eventignore').
---   As `{ go = { eventignore = '...' } }` is a valid context which should be
---   properly set and restored, this is not a good approach.
---   Not triggering `OptionSet` seems to be a good idea, though. So probably
---   only moving context save and restore to lower level might resolve this.
---
--- @param context vim.context.mods
--- @param f function
--- @return any
function vim._with(context, f) end

--- Runs a system command or throws an error if {cmd} cannot be run.
---
--- Examples:
---
--- ```lua
--- local on_exit = function(obj)
---   print(obj.code)
---   print(obj.signal)
---   print(obj.stdout)
---   print(obj.stderr)
--- end
---
--- -- Runs asynchronously:
--- vim.system({'echo', 'hello'}, { text = true }, on_exit)
---
--- -- Runs synchronously:
--- local obj = vim.system({'echo', 'hello'}, { text = true }):wait()
--- -- { code = 0, signal = 0, stdout = 'hello', stderr = '' }
---
--- ```
---
--- See |uv.spawn()| for more details. Note: unlike |uv.spawn()|, vim.system
--- throws an error if {cmd} cannot be run.
---
--- @param cmd (string[]) Command to execute
--- @param opts vim.SystemOpts? Options:
---   - cwd: (string) Set the current working directory for the sub-process.
---   - env: table<string,string> Set environment variables for the new process. Inherits the
---     current environment with `NVIM` set to |v:servername|.
---   - clear_env: (boolean) `env` defines the job environment exactly, instead of merging current
---     environment.
---   - stdin: (string|string[]|boolean) If `true`, then a pipe to stdin is opened and can be written
---     to via the `write()` method to SystemObj. If string or string[] then will be written to stdin
---     and closed. Defaults to `false`.
---   - stdout: (boolean|function)
---     Handle output from stdout. When passed as a function must have the signature `fun(err: string, data: string)`.
---     Defaults to `true`
---   - stderr: (boolean|function)
---     Handle output from stderr. When passed as a function must have the signature `fun(err: string, data: string)`.
---     Defaults to `true`.
---   - text: (boolean) Handle stdout and stderr as text. Replaces `\r\n` with `\n`.
---   - timeout: (integer) Run the command with a time limit. Upon timeout the process is sent the
---     TERM signal (15) and the exit code is set to 124.
---   - detach: (boolean) If true, spawn the child process in a detached state - this will make it
---     a process group leader, and will effectively enable the child to keep running after the
---     parent exits. Note that the child process will still keep the parent's event loop alive
---     unless the parent process calls |uv.unref()| on the child's process handle.
---
--- @param on_exit? fun(out: vim.SystemCompleted) Called when subprocess exits. When provided, the command runs
---   asynchronously. Receives SystemCompleted object, see return of SystemObj:wait().
---
--- @return vim.SystemObj Object with the fields:
---   - cmd (string[]) Command name and args
---   - pid (integer) Process ID
---   - wait (fun(timeout: integer|nil): SystemCompleted) Wait for the process to complete. Upon
---     timeout the process is sent the KILL signal (9) and the exit code is set to 124. Cannot
---     be called in |api-fast|.
---     - SystemCompleted is an object with the fields:
---       - code: (integer)
---       - signal: (integer)
---       - stdout: (string), nil if stdout argument is passed
---       - stderr: (string), nil if stderr argument is passed
---   - kill (fun(signal: integer|string))
---   - write (fun(data: string|nil)) Requires `stdin=true`. Pass `nil` to close the stream.
---   - is_closing (fun(): boolean)
function vim.system(cmd, opts, on_exit) end


function vim._os_proc_info(pid) end


function vim._os_proc_children(ppid) end

--- Paste handler, invoked by |nvim_paste()|.
---
--- Note: This is provided only as a "hook", don't call it directly; call |nvim_paste()| instead,
--- which arranges redo (dot-repeat) and invokes `vim.paste`.
---
--- Example: To remove ANSI color codes when pasting:
---
--- ```lua
--- vim.paste = (function(overridden)
---   return function(lines, phase)
---     for i,line in ipairs(lines) do
---       -- Scrub ANSI color codes from paste input.
---       lines[i] = line:gsub('\27%[[0-9;mK]+', '')
---     end
---     overridden(lines, phase)
---   end
--- end)(vim.paste)
--- ```
---
---@see |paste|
---
---@param lines  string[] # |readfile()|-style list of lines to paste. |channel-lines|
---@param phase (-1|1|2|3)  -1: "non-streaming" paste: the call contains all lines.
---              If paste is "streamed", `phase` indicates the stream state:
---                - 1: starts the paste (exactly once)
---                - 2: continues the paste (zero or more times)
---                - 3: ends the paste (exactly once)
---@return boolean result false if client should cancel the paste.
function vim.paste(lines, phase) end

--- Returns a function which calls {fn} via |vim.schedule()|.
---
--- The returned function passes all arguments to {fn}.
---
--- Example:
---
--- ```lua
--- function notify_readable(_err, readable)
---   vim.notify("readable? " .. tostring(readable))
--- end
--- vim.uv.fs_access(vim.fn.stdpath("config"), "R", vim.schedule_wrap(notify_readable))
--- ```
---
---@see |lua-loop-callbacks|
---@see |vim.schedule()|
---@see |vim.in_fast_event()|
---@param fn function
---@return function
function vim.schedule_wrap(fn) end

--- @deprecated
--- Gets a dict of line segment ("chunk") positions for the region from `pos1` to `pos2`.
---
--- Input and output positions are byte positions, (0,0)-indexed. "End of line" column
--- position (for example, |linewise| visual selection) is returned as |v:maxcol| (big number).
---
---@param bufnr integer Buffer number, or 0 for current buffer
---@param pos1 integer[]|string Start of region as a (line, column) tuple or |getpos()|-compatible string
---@param pos2 integer[]|string End of region as a (line, column) tuple or |getpos()|-compatible string
---@param regtype string [setreg()]-style selection type
---@param inclusive boolean Controls whether the ending column is inclusive (see also 'selection').
---@return table region Dict of the form `{linenr = {startcol,endcol}}`. `endcol` is exclusive, and
---whole lines are returned as `{startcol,endcol} = {0,-1}`.
function vim.region(bufnr, pos1, pos2, regtype, inclusive) end

--- Defers calling {fn} until {timeout} ms passes.
---
--- Use to do a one-shot timer that calls {fn}
--- Note: The {fn} is |vim.schedule_wrap()|ped automatically, so API functions are
--- safe to call.
---@param fn function Callback to call once `timeout` expires
---@param timeout integer Number of milliseconds to wait before calling `fn`
---@return table timer luv timer object
function vim.defer_fn(fn, timeout) end

--- Displays a notification to the user.
---
--- This function can be overridden by plugins to display notifications using
--- a custom provider (such as the system notification provider). By default,
--- writes to |:messages|.
---@param msg string Content of the notification to show to the user.
---@param level integer|nil One of the values from |vim.log.levels|.
---@param opts table|nil Optional parameters. Unused by default.
---@diagnostic disable-next-line: unused-local
function vim.notify(msg, level, opts) end

--- Displays a notification only one time.
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
---@note {fn} will be removed on error.
---@note {fn} will not be cleared by |nvim_buf_clear_namespace()|
---
---@param fn fun(key: string, typed: string)?
---                   Function invoked on every key press. |i_CTRL-V|
---                   {key} is the key after mappings have been applied, and
---                   {typed} is the key(s) before mappings are applied, which
---                   may be empty if {key} is produced by non-typed keys.
---                   When {fn} is nil and {ns_id} is specified, the callback
---                   associated with namespace {ns_id} is removed.
---@param ns_id integer? Namespace ID. If nil or 0, generates and returns a
---                     new |nvim_create_namespace()| id.
---
---@return integer Namespace id associated with {fn}. Or count of all callbacks
---if on_key() is called without arguments.
function vim.on_key(fn, ns_id) end

--- Executes the on_key callbacks.
---@private
function vim._on_key(buf, typed_buf) end

--- Generates a list of possible completions for the string.
--- String has the pattern.
---
--- 1. Can we get it to just return things in the global namespace with that name prefix
--- 2. Can we get it to return things from global namespace even with `print(` in front.
---
--- @param pat string
--- @return any[], integer
function vim._expand_pat(pat, env) end

--- Omnifunc for completing Lua values from the runtime Lua interpreter,
--- similar to the builtin completion for the `:lua` command.
---
--- Activate using `set omnifunc=v:lua.vim.lua_omnifunc` in a Lua buffer.
--- @param find_start 1|0
function vim.lua_omnifunc(find_start, _) end

--- "Pretty prints" the given arguments and returns them unmodified.
---
--- Example:
---
--- ```lua
--- local hl_normal = vim.print(vim.api.nvim_get_hl(0, { name = 'Normal' }))
--- ```
---
--- @see |vim.inspect()|
--- @see |:=|
--- @param ... any
--- @return any # given arguments.
function vim.print(...) end

--- Translates keycodes.
---
--- Example:
---
--- ```lua
--- local k = vim.keycode
--- vim.g.mapleader = k'<bs>'
--- ```
---
--- @param str string String to be converted.
--- @return string
--- @see |nvim_replace_termcodes()|
function vim.keycode(str) end

--- @param server_addr string
--- @param connect_error string
function vim._cs_remote(rcid, server_addr, connect_error, args) end


function vim._truncated_echo_once(msg) end

--- Shows a deprecation message to the user.
---
---@param name        string     Deprecated feature (function, API, etc.).
---@param alternative string|nil Suggested alternative feature.
---@param version     string     Version when the deprecated function will be removed.
---@param plugin      string|nil Name of the plugin that owns the deprecated feature.
---                              Defaults to "Nvim".
---@param backtrace   boolean|nil Prints backtrace. Defaults to true.
---
---@return string|nil # Deprecated message, or nil if no message was shown.
function vim.deprecate(name, alternative, version, plugin, backtrace) end