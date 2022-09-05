local opt_keys = vim.api.nvim_get_all_options_info()
local inspect = vim.inspect

local lines = {[[
---@meta

---@class vim.opt.Opt
local Opt = {}

---@return any
function Opt:get() end

---@param value any
function Opt:append(value) end

---@param value any
function Opt:prepend(value) end

---@param value any
function Opt:remove(value) end
]]}

local function ins(s)
  table.insert(lines, s)
end

local docs = dofile('gen_opt_doc.lua')

local opts = {}
for opt in pairs(opt_keys) do
  table.insert(opts, opt)
end
table.sort(opts)

local IGNORED_DEFAULTS = {
  runtimepath = true,
  packpath = true,
  helpfile = true,
  backupdir = true,
  directory = true,
  shell = true,
  undodir = true,
  viewdir = true,
}

for _, key in ipairs(opts) do
  local opt = opt_keys[key]
  local doc = docs[key]
  local default = inspect(opt.default)
  if IGNORED_DEFAULTS[opt.name] then
    default = '""'
  end

  if doc then
    for i, line in ipairs(doc) do
      doc[i] = '---'..line
    end
    doc[#doc+1] = '---'
    doc = table.concat(doc, '\n')
  end

  ins('')
  if doc then ins(doc) end
  ins(('---@type %s'):format(opt.type))
  ins(('vim.o.%s = %s'):format(opt.name, default))

  ins('')
  if doc then ins(doc) end
  ins('---@type vim.opt.Opt')
  ins(('vim.opt.%s = %s'):format(opt.name, default))

  -- vim.bo and vim.wo sucks anyway
  -- if opt.scope == 'buf' then
  --   ins(('---@type %s'):format(opt.type))
  --   ins(('vim.bo.%s = %s'):format(opt.name, default))
  -- elseif opt.scope == 'win' then
  --   ins(('---@type %s'):format(opt.type))
  --   ins(('vim.wo.%s = %s'):format(opt.name, default))
  -- end

  -- no short options
  -- if opt.shortname and opt.shortname ~= '' then
  --   ins(('--- %s'):format(opt.name))
  --   ins(('---@type %s'):format(opt.type))
  --   ins(('vim.o.%s = %s'):format(opt.shortname, default))
  --   if opt.scope == 'buf' then
  --     ins(('---@type %s'):format(opt.type))
  --     ins(('vim.bo.%s = %s'):format(opt.shortname, default))
  --   elseif opt.scope == 'win' then
  --     ins(('---@type %s'):format(opt.type))
  --     ins(('vim.wo.%s = %s'):format(opt.shortname, default))
  --   end
  -- end
end

ins('')
ins('vim.opt_local = vim.opt')
ins('vim.opt_global = vim.opt')

local f = io.open('./nvim/library/vim.opt.lua', 'w+b')
f:write(table.concat(lines, '\n'))
f:flush()
