ESX = exports['es_extended']:getSharedObject()

local playerCoords = nil
local playerStrefka = nil
local playerStrefka_Kolor = nil
local BlipyMain = {}
local selectedWeapon = nil
local isDead = false
local gangsta = 0


-- FUNCTIONS

EXDraw3DText = function(id, text, coords, distance)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local distanceToText = #(playerCoords - coords)
    
    if distanceToText <= distance then
        AddTextEntry(id, text)
        SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
        SetFloatingHelpTextWorldPosition(1, coords)
        BeginTextCommandDisplayHelp(id)
        EndTextCommandDisplayHelp(2, false, false, -1)
    end
end

CreateThread(function()
    for _, data in pairs(Config.Strefy) do
            BlipyMain[_] = {}

            BlipyMain[_]["Gracze"] = 0
            BlipyMain[_]["Blip_Nazwa"] = data.Blip_Text
            BlipyMain[_]["Blip"] = AddBlipForCoord(data.Coordy.x, data.Coordy.y, data.Coordy.z)
            SetBlipSprite(BlipyMain[_]["Blip"], data.Blip_Typ)
            SetBlipDisplay(BlipyMain[_]["Blip"], 4)
            SetBlipScale(BlipyMain[_]["Blip"], 0.8)
            SetBlipColour(BlipyMain[_]["Blip"], data.Blip_Kolor)
            SetBlipAsShortRange(BlipyMain[_]["Blip"], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.Blip_Text)
            EndTextCommandSetBlipName(BlipyMain[_]["Blip"])
    end

    for _, data in pairs(Config.Strefy) do
        local blip = AddBlipForRadius(data.Coordy.x, data.Coordy.y, data.Coordy.z, data.Coordy_Zone)
        SetBlipColour(blip, data.Blip_Kolor)
        SetBlipAlpha(blip, 75)
    end

    CreateThread(function()
        while true do
            selectedWeapon = GetSelectedPedWeapon(PlayerPedId())
            playerCoords = GetEntityCoords(PlayerPedId())
            playerPed = GetPlayerPed(-1)

            TriggerServerEvent("Bojowka_Strefy:UpdateAlive", IsEntityDead(playerPed), playerCoords)
            TriggerServerEvent("Bojowka_Strefy:ChangeMyZone", playerStrefka)

            
        Wait(5000)
    end
end)

CreateThread(function()
    while true do
        local canSleep = 0
        Wait(5)
        for _, data in pairs(Config.Strefy) do
            local x = data.Coordy.x;
            local y = data.Coordy.y;
            local z = data.Coordy.z;
            local radius = data.Coordy_Zone
            if #(playerCoords - vector3(x, y, z)) <= radius then

                playerStrefka = _
                playerStrefka_Kolor = data.Blip_Kolor
                
                if (data.Bron_Dluga == false) then
                    for _, weaponHash in ipairs(Config.BronieDlugie) do
                        if (selectedWeapon == weaponHash) then
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)
                        end
                    end
                end

                if (data.Bron_Biala == false) then
                    for _, weaponHash in ipairs(Config.BronieBiale) do
                        if (selectedWeapon == weaponHash) then
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)
                        end
                    end
                end

                if #(playerCoords - vector3(data.Coordy.x, data.Coordy.y, data.Coordy.z)) <= 14.5 then 
                    if (data.Status == "Nieprzejęte") then
                        EXDraw3DText("strefa", "Strefa: ~r~Nieprzejęta", vector3(data.Coordy.x, data.Coordy.y, data.Coordy.z + 1.25), 14.5)
                    elseif (data.Status == "Przejmowana") then
                        EXDraw3DText("strefa", "Strefa: ~y~Przejmowana ("..data.Przejmowanie_Czas.."s)", vector3(data.Coordy.x, data.Coordy.y, data.Coordy.z + 1.25), 14.5)
                    elseif (data.Status == "Przejęte") then
                        EXDraw3DText("strefa", "Strefa: ~g~Przejęta ("..data.Przejete_Przez..")", vector3(data.Coordy.x, data.Coordy.y, data.Coordy.z + 1.25), 14.5)
                    end


                    if #(playerCoords - vector3(data.Coordy.x, data.Coordy.y, data.Coordy.z)) <= 4.0 and IsControlJustReleased(0, 38) then
                        -- TO NIZEJ ZMIEN NA SWOJ EXPORT Z Z-TKI
                        if exports['clowns-scoreboard']:counter('players') >= 1 then
                            TriggerServerEvent("Bojowka_Strefy:TryPrzjecie", _)
                        else
                            ESX.ShowNotification("Wymagana ilosc graczy aby rozpoczac przejmowanie strefy to: 25")
                        end
                    end
                    DrawMarker(6, data.Coordy.x, data.Coordy.y, data.Coordy.z - 0.8, 0.0, 0.0, 0.0, 90.0, 90.0, 90.0, 15.0, 15.0, 15.0, 135, 76, 255, 160, false, false, 2, false, false, false, false)
                end
            else
                canSleep = canSleep + 2
            end
        end

        if canSleep >= 18 then
            playerStrefka = nil
            playerStrefka_Kolor = nil
            Wait(300)
        end
    end
end)
end)


RegisterNetEvent('Strefy:UpdateStrefkaStatus')
AddEventHandler('Strefy:UpdateStrefkaStatus', function(zone, x1, x2, x3)
    Config.Strefy[zone].Przejmowanie_Czas = x1
    Config.Strefy[zone].Status = x2
    Config.Strefy[zone].Przejete_Przez = x3
end)

AddEventHandler('esx:onPlayerDeath', function()
    isDead = true
end)

AddEventHandler('playerSpawned', function()
    isDead = false
end)