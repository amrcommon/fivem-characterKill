
function notification(msg) --Msg is part of the Text String at B
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg) -- B
	DrawNotification(false, false) -- Look on that website for what these mean, I forget. I think one is about flashing or not
end


RegisterCommand("characterKill",function(source, args)


	notification('Sientes un hormigueo en todo tu cuerpo. No te sientes muy bien...')
	
	Citizen.Wait(2000)
 
		RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "mp_player_intdrink", 0, true)
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(10000)
	--DoScreenFadeOut(1000)
	--Citizen.Wait(1000)
	--DoScreenFadeIn(1000)
	--ClearTimecycleModifier()
	--ResetScenarioTypesEnabled()
	--ResetPedMovementClipset(GetPlayerPed(-1), 0)
	--SetPedIsDrunk(GetPlayerPed(-1), false)
	--SetPedMotionBlur(GetPlayerPed(-1), false)
	
	TriggerServerEvent('amr:characterCK',source)
 
end,false)
