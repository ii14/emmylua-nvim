local RUNTIME = vim.env.VIMRUNTIME

local opts = {}
local opt

local section = 0
local got_tag = false

local function iter(line)
  if line:find('^================') then
    section = section + 1
    return
  elseif section ~= 3 then
    return
  elseif line:find("^%s*%*'%S+'%*") then
    got_tag = true
    return
  end

  if got_tag and line:find("^'") then
    opt = { line }
    opts[#opts+1] = opt
  elseif opt then
    opt[#opt+1] = line
  end

  got_tag = false
end

for line in io.lines(RUNTIME..'/doc/options.txt') do
  iter(line)
end

do
  -- remove modeline
  local last = opts[#opts]
  if last and last[#last]:find('^%s*vim:') then
    last[#last] = nil
  end
end

local res = {}

for _, o in ipairs(opts) do
  -- remove lines with just tags
  while o[#o] and o[#o]:find("^<?%s*%*'%S+'%*") and o[#o]:gsub("^'%S+'", ''):match('^%s*$') do
    if o[#o]:find('^<') then
      o[#o] = '<'
    else
      o[#o] = nil
    end
  end

  -- parse name
  local name = assert(assert(o[1]):match("^'(%l+)'"))

  -- remove type and default info
  if o[1]:find('(', 1, true) and not o[1]:find('%)$') then
    for i = 2, #o do
      if o[i]:find('%)$') then
        for j = i, 2, -1 do
          table.remove(o, j)
        end
        break
      end
    end
  end

  -- remove first line with option names
  table.remove(o, 1)

  -- remove global/local info
  if o[1] and (o[1]:find('^\t\t\tglobal') or o[1]:find('^\t\t\tlocal')) then
    table.remove(o, 1)
  end

  --- format code blocks
  local closed = true
  do
    local i = 1
    while true do
      if o[i] == '>' then
        o[i] = '```'
        closed = false
        i = i + 1
      elseif o[i]:find(' >$') then
        o[i] = o[i]:gsub('%s*>$', '')
        table.insert(o, i + 1, '```')
        closed = false
        i = i + 2
      elseif o[i]:find('^<%s*$') then
        o[i] = '```'
        closed = true
        i = i + 1
      elseif o[i]:find('^<') then
        o[i] = o[i]:sub(2)
        table.insert(o, i, '```')
        closed = true
        i = i + 2
      else
        i = i + 1
      end
      if i > #o then
        break
      end
    end
  end

  -- remove leading and trailing empty lines
  while o[1] and not o[1]:find('%S') do
    table.remove(o, 1)
  end
  while o[#o] and not o[#o]:find('%S') do
    o[#o] = nil
  end

  --- close code blocks
  if not closed then
    o[#o+1] = '```'
  end

  -- remove leading indentation (should be just one level)
  for i, v in ipairs(o) do
    o[i] = v:gsub('^\t', '')
  end

  res[name] = o
end

return res
