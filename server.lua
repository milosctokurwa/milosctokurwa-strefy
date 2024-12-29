ESX = exports['es_extended']:getSharedObject()

local Players = {}
local playerList = {} 

local Players2 = {}
local Players3 = {}

RegisterNetEvent("Bojowka_Strefy:ChangeMyZone")
AddEventHandler("Bojowka_Strefy:ChangeMyZone", function(zone)
    if zone == nil then
        return
    end

    Players[source] = zone
    playerList = {}

    for k, v in pairs(Players) do
        if (k == nil) then
        else
            if Players[k] == zone then
                table.insert(playerList, k)
            end
        end
    end
end)

RegisterNetEvent("Bojowka_Strefy:UpdateAlive")
AddEventHandler("Bojowka_Strefy:UpdateAlive", function(val, val2)
    Players2[source] = val
    Players3[source] = val2
end)

RegisterNetEvent("Bojowka_Strefy:TryPrzjecie")
AddEventHandler("Bojowka_Strefy:TryPrzjecie", function(zone)
    local xPlayer = ESX.GetPlayerFromId(source)
    local ziomeczek = ESX.GetPlayerFromId(-1)
    local InfoFirst = Config.Strefy[zone].Status
    local InfoSec = Config.Strefy[zone].Przejmowanie_Czas

    if (Config.Strefy[zone].Cooldown ~= 0) then
        xPlayer.showNotification("Cooldown strefy! ("..Config.Strefy[zone].Cooldown.."s)", "info")
        return
    end

    if (Config.Strefy[zone].Przejete_Przez == xPlayer.name) then
        xPlayer.showNotification("Nie możesz ponownie przejąć tej strefy!", "error")
        return
    end

    if (InfoSec ~= 0 and InfoFirst == "Przejmowana") then
        xPlayer.showNotification("Ta strefa jest już przejmowana!", "error")
        return
    end

    -- ZMIEN TO NA SWOJ CHAT
    TriggerClientEvent('clowns:chatMessage', -1, '#fff', 'fa-solid fa-globe', 'Strefy', ''..Config.Strefy[zone].Blip_Text..' jest przejmowana!')
   
    Config.Strefy[zone].Przejete_Przez = xPlayer.name
    Config.Strefy[zone].Status = "Przejmowana"
    Config.Strefy[zone].Przejmowanie_Czas = 60



    CreateThread(function() 
        local xx = Config.Strefy[zone].Przejmowanie_Czas
        while true do
            if (Players2[xPlayer.source] ~= false) then
                Config.Strefy[zone].Przejmowanie_Czas = 0
                Config.Strefy[zone].Status = "Nieprzejęte"
                Config.Strefy[zone].Przejete_Przez = nil

                xPlayer.showNotification("Anulowano przejmowanie strefy!", "error")
            
                TriggerClientEvent("Strefy:UpdateStrefkaStatus", -1, zone, Config.Strefy[zone].Przejmowanie_Czas, Config.Strefy[zone].Status, Config.Strefy[zone].Przejete_Przez)
                break
            end

            if (0 >= Config.Strefy[zone].Przejmowanie_Czas) then
                Config.Strefy[zone].Przejmowanie_Czas = 0
                Config.Strefy[zone].Status = "Przejęte"
                Config.Strefy[zone].Przejete_Przez = xPlayer.name
            
                -- ZMIEN TO NA SWOJ CHAT
                TriggerClientEvent('clowns:chatMessage', -1, '#fff', 'fa-solid fa-globe', 'Strefy', "Gracz: "..xPlayer.name..", Skonczyl przejmowac strefe: "..Config.Strefy[zone].Blip_Text)

                xPlayer.showNotification("Udało ci się przejąć strefe otrzymałeś: $"..Config.Strefy[zone].Wynagrodzenie.."", "success")
                xPlayer.addAccountMoney('money', Config.Strefy[zone].Wynagrodzenie)
                
                for _, drop in ipairs(Config.Strefy[zone].itemy) do
                    if math.random(100) <= drop.szansa then
                        print(drop.szansa)
                        xPlayer.addInventoryItem(drop.nazwaitemu, math.random(drop.min, drop.max))
                    end
                end

                Config.Strefy[zone].Cooldown = 180

                CreateThread(function() 
                    while true do
                        Config.Strefy[zone].Cooldown = Config.Strefy[zone].Cooldown - 1
                        if (0 >= Config.Strefy[zone].Cooldown) then
                            Config.Strefy[zone].Cooldown = 0
                            break
                        end
                        Wait(1000)
                    end
                end)    
                TriggerClientEvent("Strefy:UpdateStrefkaStatus", -1, zone, Config.Strefy[zone].Przejmowanie_Czas, Config.Strefy[zone].Status, Config.Strefy[zone].Przejete_Przez)
                break
            end

            if #(Players3[xPlayer.source] - vector3(Config.Strefy[zone].Coordy.x, Config.Strefy[zone].Coordy.y, Config.Strefy[zone].Coordy.z)) >= 14.5 then 
                
                Config.Strefy[zone].Przejmowanie_Czas = 0
                Config.Strefy[zone].Status = "Nieprzejęte"
                Config.Strefy[zone].Przejete_Przez = nil

                xPlayer.showNotification("Odszedłeś za daleko!", "error")
            
                TriggerClientEvent("Strefy:UpdateStrefkaStatus", -1, zone, Config.Strefy[zone].Przejmowanie_Czas, Config.Strefy[zone].Status, Config.Strefy[zone].Przejete_Przez)

                break
            end

            Config.Strefy[zone].Przejmowanie_Czas = Config.Strefy[zone].Przejmowanie_Czas - 1
            TriggerClientEvent("Strefy:UpdateStrefkaStatus", -1, zone, Config.Strefy[zone].Przejmowanie_Czas, Config.Strefy[zone].Status, Config.Strefy[zone].Przejete_Przez)
            Wait(1000)
        end
    end)
end)

AddEventHandler('playerDropped', function(reason)
    local _source = source
    local xx = Players[_source]
    Players[_source] = nil
    Players2[_source] = nil
    Players3[_source] = nil

    playerList = {}

    for k, v in pairs(Players) do
        if (k == nil) then
        else
            if Players[k] == zone then
                table.insert(playerList, k)
            end
        end
    end
end)