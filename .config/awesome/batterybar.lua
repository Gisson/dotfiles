
local wibox = require("wibox")
local battery = require("battery")
local gears = require("gears")
local beautiful = require("beautiful")

local batterybar = {
	max_value = 100,
	min_value = 0,
	widget = wibox.widget.progressbar(),
	value = 50,
	shape = gears.shape.rounded_bar,
	border_color = beautiful.border_color,
}

local function init()
	batterybar.max_value = battery.getMaxBattery()
	batterybar.value = battery.getCurrentBattery()
end

init()
return batterybar
