_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

--Clear stats from inventory loadout menu when skin mini-icon is highlighted.
--Leave the stats for first-generation legendary skins.
Hooks:PostHook(PlayerInventoryGui, "_update_stats", "DSA-PostHook-PlayerInventoryGui:_update_stats", function(self, name)
	local box = self._boxes_by_name[name]
	local data = box and box.params and box.params.mod_data

	if data and data.selected_tab == "weapon_cosmetics" then
		local cosmetics = managers.blackmarket:get_weapon_cosmetics(data.category, data.slot)
		if cosmetics then
			local skin_data = tweak_data.blackmarket.weapon_skins[cosmetics.id]
			if skin_data and not skin_data.locked then
				self._info_panel:clear()
			end
		end
	end
end)
