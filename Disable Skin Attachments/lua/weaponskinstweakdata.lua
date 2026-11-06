_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

Hooks:PostHook(BlackMarketTweakData, "_init_weapon_skins", "DSA-PostHook-BlackMarketTweakData:_init_weapon_skins", function(self)
	DSA.blueprint_skin_ids = {}
	for skin_id, skin_data in pairs(self.weapon_skins) do
		if not skin_data.locked then
			if skin_data.default_blueprint then
				table.insert(DSA.blueprint_skin_ids, skin_id)
				skin_data._dsa_blueprint = skin_data.default_blueprint
			end
		end

		--Rename legendary skins.
		skin_data.unique_name_id = nil

		--Remove "MODIFICATIONS INCLUDED" description from non-legendary skins.
		if skin_data.rarity ~= "legendary" then
			skin_data.desc_id = nil
		end
	end
end)
