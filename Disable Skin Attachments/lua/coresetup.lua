if _G.DSA then return end

---@class DSA
_G.DSA = {}
DSA.flags = {
	blueprints_suppressed = false,
--	restore_skin = <skin_id>,
}

function DSA:remove_blueprints()
	self.flags.blueprints_suppressed = true
	local skin_tweak = tweak_data.blackmarket.weapon_skins
	for _, k in ipairs(self.blueprint_skin_ids or {}) do
		skin_tweak[k].default_blueprint = nil
	end
end

function DSA:restore_blueprints()
	local skin_tweak = tweak_data.blackmarket.weapon_skins
	for _, k in ipairs(self.blueprint_skin_ids or {}) do
		skin_tweak[k].default_blueprint = skin_tweak[k]._dsa_blueprint
	end
	self.flags.blueprints_suppressed = false
end
