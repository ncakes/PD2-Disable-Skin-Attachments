_G[ModPath] = _G[ModPath] or {}
if _G[ModPath][RequiredScript] then return end
_G[ModPath][RequiredScript] = true

if _G.OSA or _G.SDSS then
	return
end

local orig_NetworkPeer__verify_content = NetworkPeer._verify_content
function NetworkPeer:_verify_content(item_type, ...)
	if DSA.flags.blueprints_suppressed and item_type == "weapon_mods" then
		return true
	end

	return orig_NetworkPeer__verify_content(self, item_type, ...)
end
