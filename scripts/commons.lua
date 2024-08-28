local commons = {} 
package.path = 'statusbar/?.lua;' .. package.path
function commons.getoutput(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

function commons.split(inputstr, sep)
  if sep == nil then
    sep = "%s"   -- default is whitespace
  end
  local splitted = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(splitted, str)
  end
  return splitted
end

function commons.round(x)
  return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

return commons