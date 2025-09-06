local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local g = colorbuddy.groups

local module = {}

function module.setup()
	Group.link("@markup.list.unchecked.markdown", g.Error)
	Group.link("@markup.list.checked.markdown", g.Number)
	Group.link("@markup.link.label.markdown_inline", g.Special)
	Group.link("@markup.link.url.markdown_inline", g.Noise)
end

return module
