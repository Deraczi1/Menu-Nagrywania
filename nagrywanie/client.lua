



ESX = nil
Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(10) end end)

local type = nil
local _menu = {
    {label = 'Start Nagrywania',  value = 'record'},
    {label = 'Stop Nagrywania',    value = 'srecords'},

}

RegisterCommand("nagrywanie", function()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fps', {
		title    = 'System nagrywania',
		align    = 'top-left',
		elements = _menu
	}, function(data, menu)
        local v = data.current.value

        --// Things need to be runned only one time
		if v == "record" then
            StartRecording(1)

        elseif v == "srecords" then
            StopRecordingAndSaveClip()
		end

        type = v
	end, function(data, menu)
		menu.close()
	end)
end)



