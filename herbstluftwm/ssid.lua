#!/usr/bin/lua
local command = "nmcli -t -f active,ssid dev wifi | grep '^yes:'"
-- Execute command, get SSID out of it--
while true do
    -- Example command output:
    -- yes:M&D INTERNET
    -- no:
    -- no:pomberg
    -- the yes: we cut out, the rest out
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    -- the currently active SSID
    local active = string.sub(result,5)
    print(active)
    os.execute("sleep 10")
end
