#!/usr/bin/lua
-- Ping a thing
function testconn()
	local handler = io.popen("ping -c 3 -i 0.5 8.8.8.8")
	local response = handler:read("*a")
	print("RESPONSE: ".. response)
	if string.find(response,"time") then
		os.exit(0)
	else
		return false
	end

end
function wificonn (uuid)
	local command = "nmcli c up uuid " .. uuid .. " passwd-file ~/.config/wifi-pass"
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle:close()
	return result
end
	-- Check if we're connected to the internet --
print("Init...")
if testconn() == false then
	local place = os.getenv("place")
	local uuid = "8b430421-49e6-4fac-9c14-cb9cfca9fa00"
	if place == "work" then
	    uuid = "f21a4603-41d5-4fa9-9656-a8bad25b7cef"
	end

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
	else
		print("Already connected to the internet")
end
