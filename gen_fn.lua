local txt do
  -- TODO: parse it from current runtime
  local f = io.open('./fns.txt', 'rb')
  txt = f:read('*a')
  f:close()
end

local KEYWORDS = {
  ['and'] = true,
  ['break'] = true,
  ['do'] = true,
  ['else'] = true,
  ['elseif'] = true,
  ['end'] = true,
  ['false'] = true,
  ['for'] = true,
  ['function'] = true,
  ['if'] = true,
  ['in'] = true,
  ['local'] = true,
  ['nil'] = true,
  ['not'] = true,
  ['or'] = true,
  ['repeat'] = true,
  ['return'] = true,
  ['then'] = true,
  ['true'] = true,
  ['until'] = true,
  ['while'] = true,
}

local lines = {[[
---@meta
]]}

local function ins(s)
  table.insert(lines, s)
end

local fns = {}

for line in txt:gmatch('([^\n]*)\n?') do
  if line:find('^\t') then
    fns[#fns] = fns[#fns] .. line:match('[^\t].*$'):gsub('\t', ' ')
  else
    fns[#fns+1] = line:gsub('\t', ' ')
  end
end

local function parse_fn(line)
  local name, args = line:match('^([%w%d_]+)%((.-)%)(.*)')
  if not name then return end
  args = args:gsub('[%[%]{}]', '')
  args = vim.split(args, '%s*,%s*')
  for i, arg in ipairs(args) do
    if KEYWORDS[arg] then
      args[i] = arg..'_'
    elseif arg:find('%.%.%.$') then
      args[i] = '...'
    elseif arg:find('%-') and arg:find('%a') then
      args[i] = arg:gsub('-', '_')
    elseif arg:find('^[%d%-]*$') then
      return
    end
  end
  if not KEYWORDS[name] then
    ins(('function vim.fn.%s(%s) end'):format(name, table.concat(args, ', ')))
  else
    ins(('vim.fn["%s"] = function(%s) end'):format(name, table.concat(args, ', ')))
  end
end

for _, line in ipairs(fns) do
  parse_fn(line)
end

local f = io.open('./nvim/library/vim.fn.lua', 'w+b')
f:write(table.concat(lines, '\n'))
f:flush()
