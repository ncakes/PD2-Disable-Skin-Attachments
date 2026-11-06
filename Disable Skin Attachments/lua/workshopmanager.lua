_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

--Remove attachments from custom skins after they have been initialized.
--Set _dsa_blueprint=nil just in case. But they should not have been captured.
Hooks:PostHook(WorkshopManager, "init", "DSA-PostHook-WorkshopManager:init", function(...)
	for skin_id, skin_data in pairs(tweak_data.blackmarket.weapon_skins) do
		if skin_data.custom and skin_data.default_blueprint then
			skin_data.default_blueprint = nil
			skin_data._dsa_blueprint = nil
		end
	end
end)
