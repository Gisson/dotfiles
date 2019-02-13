
local function getMaxBattery()
	local f = io.open(battery.path1 ..  "charge_full" , "rb")
	full = f:read("*all")
	f:close()
	return full
end

local function getCurrentBattery()
	local f = io.open(battery.path1 .. "charge_now", "rb")
	now = f:read("*all")
	f:close()
	return now
end


local function getBatteryPercent()
	return (getCurrentBattery()*100) / getMaxBattery()
end
