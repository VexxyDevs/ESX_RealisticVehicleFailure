


ESX = exports["es_extended"]:getSharedObject()
local function checkWhitelist(id)
	for key, value in pairs(RepairWhitelist) do
		if id == value then
			return true
		end
	end	
	return false
end

ESX.RegisterUsableItem('repairkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local item = xPlayer.getInventoryItem('repairkit')
        if item ~= nil and item.count > 0 then
            TriggerClientEvent('RealisticVehicleFailure:client:RepairVehicleFull', source)
        end
    end
end)

RegisterNetEvent('RealisticVehicleFailure:removeItem')
AddEventHandler('RealisticVehicleFailure:removeItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer ~= nil then
        xPlayer.removeInventoryItem(item, 1)
    end
end)

print("Edited RealisticVehicleFailure By Rico :)")