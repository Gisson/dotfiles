wibox = require("wibox")
awful = require("awful")
naughty = require("naughty")

local battery = {
	widget = wibox.widget.textbox(),
	path1 = "/sys/class/power_supply/BAT1/",
	color = {
		danger = "#f44242",
		warning = "#f4b942",
		ok = "#088403"
	}
}

function battery.getMaxBattery()
	local f = io.open(battery.path1 ..  "charge_full" , "rb")
	full = f:read("*all")
	f:close()
	return full
end

function battery.getCurrentBattery()
	local f = io.open(battery.path1 .. "charge_now", "rb")
	now = f:read("*all")
	f:close()
	return now
end


function battery.getBatteryPercent()
	return (battery.getCurrentBattery()*100) / battery.getMaxBattery()
end

local function getBattery()
	full = battery.getMaxBattery()
	now = battery.getCurrentBattery()
	value = (now * 100) / full
	percentage = string.format(" %.2f%% ", battery.getBatteryPercent())
	if (value < 20) then
		percentage = "<span fgcolor='".. battery.color.danger .. "'>" .. percentage .. "</span>"
	elseif (value < 50 ) then
		percentage = "<span fgcolor='".. battery.color.warning .. "'>" .. percentage .. "</span>"
	else
		percentage = "<span fgcolor='".. battery.color.ok .. "'>" .. percentage .. "</span>"
	end
	return percentage
end

local function init()
	battery.widget:buttons(awful.util.table.join(
		awful.button({},1,function() info() end),
		awful.button({},3,function() battery.reload() end)
	))
	battery.reload()
end


function info()
	local file = io.open(battery.path1 .. "uevent")
	naughty.notify({text=file:read("*all"), timeout=5, replaces_id=0 })
	file:close()
end

function battery.reload()
	battery.widget.markup = getBattery()
end

init()
return battery
