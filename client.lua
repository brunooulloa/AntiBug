---------------------------------
-- Script creado por Soft#6666 --
---------------------------------

local bugeandopared = false

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(PlayerPedId(), true)
		for i = 1, #Config.zonas do
			dist = Vdist(coords, Config.zonas[i].x, Config.zonas[i].y, Config.zonas[i].z)
			if dist <= Config.dist then
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
						exports[Config.mythic_name]:DoHudText(Config.mythic_type, Config.notif)
					end
				end
			end
		end
	end
end)

---------------------------------
-- Script creado por Soft#6666 --
---------------------------------