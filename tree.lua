-- Tree, by mtvjr
-- Displays a recursive list of files and directories in a file system

local fs = require("filesystem")   --Gets filesystem details
local shell = require("shell")     --Required to get current directory

local shapes = {T='├── ', L='└── ', I='│   ', _='    '} -- Stores shapes used in ouput

function printTable(table)
  for key,value in pairs(table) do
    print(key,value)
  end
end

function getTableSize(table)
  local count = 0
  for _ in pairs(table) do
    count = count + 1
  end
  return count
end

function getIterSize(iter)
  local iter = iter
  local i = 0
  for _ in iter do
	  i = i + 1
  end
  return  i
end

function tree(dir, start)
  -- Creates file list and num of files
  local flist = fs.list(dir)
  local fsize = getIterSize(fs.list(dir))
  local fnum = 0
  local line = ''
  for file in flist do
    local fpath = fs.concat(dir, file)
    fnum = fnum + 1
    if fnum < fsize then
      line = start .. shapes.T
    else
      line = start .. shapes.L
    end
    print(line .. fs.name(file))
    -- Recurse if the file is a directory
    if fs.isDirectory(fpath) then
      local nextShape = fnum < fsize and shapes.I or shapes._
      tree(fpath, start .. nextShape)
    end
  end
end

local curDir = shell.getWorkingDirectory()

print(curDir)
tree(curDir, '')


