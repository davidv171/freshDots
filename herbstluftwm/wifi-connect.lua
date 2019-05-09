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
local ind = 0
while ind < 4 do
	local response = wificonn(uuid)
	print(response)
	if string.find(response,"successfully activated") > 0 then
		print("Done")
		os.exit(0)
	else
		print("Failed!")
		ind = ind + 1
	end
end
-- If I can't connect to home wifi I'm at work
workconn = "nmcli up LECIP-ITS"
local handle = io.popen(workconn)
local result = handle:read("*a")
handle:close()
