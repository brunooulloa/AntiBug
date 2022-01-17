---------------------------------
-- Script creado por Soft#6666 --
---------------------------------

local bugeandopared = false

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(PlayerPedId(), true)
		for k, v in pairs(Config['zonas']) do
			dist = Vdist2(coords, Config['zonas'][k].x, Config['zonas'][k].y, Config['zonas'][k].z)
			if dist <= Config['dist'] then
				bugeandopared = true
			end
		end
		Citizen.Wait(3000)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if bugeandopared then
			if IsPedInCover(PlayerPedId(), true) then
				if IsPedArmed(PlayerPedId(), 7) then
					DisablePlayerFiring(PlayerPedId(), true)
					DisableControlAction(0, 25, true)
					DisableControlAction(0, 106, true)
					if IsDisabledControlJustPressed(0, 25) or IsDisabledControlJustPressed(0, 106) then
						exports[Config['mythic_name']]:DoHudText(Config['mythic_type'], Config['notif'])
					end
				end
			end
		end
	end
end)

---------------------------------
-- Script creado por Soft#6666 --
---------------------------------