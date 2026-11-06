_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

Hooks:PreHook(MenuCallbackHandler, "_left_blackmarket", "DSA-PreHook-MenuCallbackHandler:_left_blackmarket", function()
	DSA:restore_blueprints()
end)
