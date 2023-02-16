local opt_keys = vim.api.nvim_get_all_options_info()
local inspect = vim.inspect

local opt_lines = {[[
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

local o_lines = {[[
---@meta
]]}

local function opt_ins(s)
  table.insert(opt_lines, s)
end

local function o_ins(s)
  table.insert(o_lines, s)
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

  o_ins('')
  if doc then o_ins(doc) end
  o_ins(('---@type %s'):format(opt.type))
  o_ins(('vim.o.%s = %s'):format(opt.name, default))

  opt_ins('')
  if doc then opt_ins(doc) end
  opt_ins('---@type vim.opt.Opt')
  opt_ins(('vim.opt.%s = %s'):format(opt.name, default))

  -- vim.bo and vim.wo sucks anyway
  -- if opt.scope == 'buf' then
  --   o_ins(('---@type %s'):format(opt.type))
  --   o_ins(('vim.bo.%s = %s'):format(opt.name, default))
  -- elseif opt.scope == 'win' then
  --   o_ins(('---@type %s'):format(opt.type))
  --   o_ins(('vim.wo.%s = %s'):format(opt.name, default))
  -- end

  -- no short options
  -- if opt.shortname and opt.shortname ~= '' then
  --   o_ins(('--- %s'):format(opt.name))
  --   o_ins(('---@type %s'):format(opt.type))
  --   o_ins(('vim.o.%s = %s'):format(opt.shortname, default))
  --   if opt.scope == 'buf' then
  --     o_ins(('---@type %s'):format(opt.type))
  --     o_ins(('vim.bo.%s = %s'):format(opt.shortname, default))
  --   elseif opt.scope == 'win' then
  --     o_ins(('---@type %s'):format(opt.type))
  --     o_ins(('vim.wo.%s = %s'):format(opt.shortname, default))
  --   end
  -- end
end

opt_ins('')
opt_ins('vim.opt_local = vim.opt')
opt_ins('vim.opt_global = vim.opt')

do
  local f = io.open('./nvim/library/vim.opt.lua', 'w+b')
  f:write(table.concat(opt_lines, '\n'))
  f:flush()
end

do
  local f = io.open('./nvim/library/vim.o.lua', 'w+b')
  f:write(table.concat(o_lines, '\n'))
  f:flush()
end
