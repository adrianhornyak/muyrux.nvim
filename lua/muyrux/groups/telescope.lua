local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local g = colorbuddy.groups

local module = {}

function module.setup()
	Group.link("TelescopeBorder", g.Noise)
	Group.link("TelescopeMatching", g.User1)
	Group.link("TelescopePromptCounter", g.Noise)
end

return module
