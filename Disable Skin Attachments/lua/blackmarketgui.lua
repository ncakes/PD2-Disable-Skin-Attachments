_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

Hooks:PreHook(BlackMarketGui, "choose_weapon_mods_callback", "DSA-PreHook-BlackMarketGui:choose_weapon_mods_callback", function()
	DSA:remove_blueprints()
end)
