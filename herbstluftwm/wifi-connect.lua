#!/usr/bin/lua
function wificonn (uuid)
  local command = "nmcli c up uuid " .. uuid .. " passwd-file ~/.config/wifi-pass"
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end
local uuid = "8b430421-49e6-4fac-9c14-cb9cfca9fa00"
print("Trying to connect")
while true do
  local response = wificonn(uuid)
  print(response)
  if string.find(response,"successfully activated") > 0 then
    print("Done")
    os.exit(0)
  else
    print("Failed!")
    os.exit(1)
  end
end
