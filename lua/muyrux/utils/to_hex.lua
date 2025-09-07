local module = {}

function module.to_hex(color_obj)
	if not color_obj or type(color_obj.to_vim) ~= "function" then
		return nil
	end
	local s = color_obj:to_vim()
	-- искать первый #rrggbb
	local hex = s:match("#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]")
	return hex
end

return module
