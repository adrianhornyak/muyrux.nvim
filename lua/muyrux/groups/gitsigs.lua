local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local s = colorbuddy.styles

local module = {}

function module.setup(c, bg)
	Group.new("GitSignsAdd", c.green_light, bg, s.none)
	Group.new("GitSignsChange", c.orange, bg, s.none)
	Group.new("GitSignsDelete", c.red, bg, s.none)
end

return module
