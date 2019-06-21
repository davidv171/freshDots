#!/usr/bin/lua
--Tags on first monitor
tags1={1,3,4,5,6,8,"s","d"}
tags2={2,7}
tags3={9,0}
local handle = io.popen("herbstclient attr tags.focus.name")
local result = handle:read("*a")
handle:close()
local ind = tonumber(result)
print(ind)
local inc = 0
for k,v in pairs(tags1) do
  if v == ind then
      inc = tags1[k+1]
    break
  end
end
print("Incrementing done")
print(inc)
handle = io.popen("herbstclient use " .. inc)
result = handle:read("*a")
