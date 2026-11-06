_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

--Rename legendary weapons
Hooks:PostHook(BlackMarketManager, "_set_weapon_cosmetics", "DSA-PostHook-BlackMarketManager:_set_weapon_cosmetics", function(self, category, slot, instance_id)
	local crafted = self:get_crafted_category_slot(category, slot)
	if not crafted then
		return
	end

	crafted.locked_name = nil
end)

--Clear the skin so parts are added to inventory.
Hooks:PreHook(BlackMarketManager, "on_sell_weapon", "DSA-PreHook-BlackMarketManager:on_sell_weapon", function(self, category, slot, skip_verification)
	local crafted = self:get_crafted_category_slot(category, slot)
	if not crafted then
		return
	end

	local skin_id = crafted.cosmetics and crafted.cosmetics.id
	local skin_data = skin_id and tweak_data.blackmarket.weapon_skins[skin_id]
	if skin_data and skin_data.default_blueprint and not skin_data.locked then
		crafted.cosmetics = nil
	end
end)

--The game can automatically call this to remove skins that don't exist or you don't own.
--If we are not in weapon customization, default_blueprint will be set.
--Remove for this single entry and restore afterwards.
Hooks:PreHook(BlackMarketManager, "on_remove_weapon_cosmetics", "DSA-PreHook-BlackMarketManager:on_remove_weapon_cosmetics", function(self, category, slot, skip_update)
	local crafted = self:get_crafted_category_slot(category, slot)
	if not crafted then
		return
	end

	local skin_id = crafted.cosmetics and crafted.cosmetics.id
	local skin_data = skin_id and tweak_data.blackmarket.weapon_skins[skin_id]
	if skin_data and skin_data.default_blueprint and not skin_data.locked then
		DSA.flags.restore_skin = skin_id
		--Just in case.
		skin_data._dsa_blueprint = skin_data.default_blueprint
		skin_data.default_blueprint = nil
	end
end)

Hooks:PostHook(BlackMarketManager, "on_remove_weapon_cosmetics", "DSA-PostHook-BlackMarketManager:on_remove_weapon_cosmetics", function(self, category, slot, instance_id)
	local skin_id = DSA.flags.restore_skin
	DSA.flags.restore_skin = nil
	if skin_id then
		local skin_data = tweak_data.blackmarket.weapon_skins[skin_id]
		skin_data.default_blueprint = skin_data._dsa_blueprint
	end

	local crafted = self:get_crafted_category_slot(category, slot)
	if not crafted then
		return
	end

	--Bugfix: locked name is not reset when skin is removed in base game.
	crafted.locked_name = nil
end)
