local functions = vim.fn.api_info().functions

local types = {}

local TYPEMAP = {
  void = 'nil',
  Boolean = 'boolean',
  Integer = 'integer',
  Float = 'number',
  String = 'string',

  Array = 'table',
  Dictionary = 'table',
  LuaRef = 'function',
  Object = 'any',

  Buffer = 'Buffer',
  Window = 'Window',
  Tabpage = 'Tabpage',
}

local function new_type(s)
  if not types[s] then
    local arrayof = s:match('^ArrayOf%((.*)%)$')
    if arrayof then
      local tp, cnt = arrayof:match('^(%w+), (%d+)$')
      if tp then
        tp = assert(TYPEMAP[tp], 'unknown type: '..tp)
        local tbl = {}
        for i = 1, cnt do
          table.insert(tbl, ('[%d]: %s'):format(i, tp))
        end
        types[s] = '{ '..table.concat(tbl, ', ')..' }'
      else
        types[s] = assert(TYPEMAP[arrayof], 'unknown type: '..arrayof)..'[]'
      end
    else
      types[s] = assert(TYPEMAP[s], 'unknown type: '..s)
    end
  end
  return types[s]
end

local lines = {[[
---@meta

---@class vim.api
vim.api = {}

---@alias Buffer integer
---@alias Tabpage integer
---@alias Window integer
]]}

local function ins(s)
  table.insert(lines, s)
end

for _, f in ipairs(functions) do
  if f.name:find('^nvim_') then
    f.return_type = new_type(f.return_type)
    for _, parameter in ipairs(f.parameters) do
      parameter[1] = new_type(parameter[1])
    end

    local p1, p2 = {}, {}
    for _, param in ipairs(f.parameters) do
      if param[2] == 'end' then param[2] = '_end' end
      table.insert(p1, assert(param[2]))
      table.insert(p2, ('---@param %s %s'):format(param[2], param[1]))
    end

    ins('')
    if #p2 > 0 then
      ins(table.concat(p2, '\n'))
    end
    if f.return_type ~= 'nil' then
      ins(('---@return %s'):format(f.return_type))
    end
    ins(('function vim.api.%s(%s) end'):format(f.name, table.concat(p1, ', ')))
  end
end
ins('')

local f = io.open('./nvim/library/vim.api.lua', 'w+b')
f:write(table.concat(lines, '\n'))
f:flush()
