local battery_helper = {}

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

function battery_helper.is_battery ()
	local battery = require("battery")
	local f = io.open(battery.path1)
	if f~=nil
	then
		io.close(f)
		return true
	else
		return false
	end
end

return battery_helper
