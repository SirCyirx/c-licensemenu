local QBCore = exports['qb-core']:GetCoreObject()

lib.callback.register('c-licensemenu:client:closeplayercheck', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
  if player ~= -1 and distance < 2.5 then
    local playerId = GetPlayerServerId(player)
       return playerId
   else
       return false
    end
end)

RegisterNetEvent('c-licensemenu:client:openlicensemenu', function(Data)
    local Menu = {}
  if Config.Licenses.Driver then
      Menu[#Menu + 1] = {
        title = "Driver License",
        description = "Status: "..Data.driver,
        icon = "id-card",
        readOnly = true
       }
    end
  if Config.Licenses.Weapon then
      Menu[#Menu + 1] = {
        title = "Weapon License",
        description = "Status: "..Data.weapon,
        icon = "id-card",
        readOnly = true
       }
    end
  if Config.Licenses.Business then
      Menu[#Menu + 1] = {
        title = "Business License",
        description = "Status: "..Data.business,
        icon = "id-card",
        readOnly = true
       }
    end
  if Config.Licenses.Hunting then
      Menu[#Menu + 1] = {
        title = "Hunting License",
        description = "Status: "..Data.hunting,
        icon = "id-card",
        readOnly = true
       }
    end
  if Config.Licenses.Pilot then
      Menu[#Menu + 1] = {
        title = "Pilot License",
        description = "Status: "..Data.pilot,
        icon = "id-card",
        readOnly = true
       }
    end
lib.registerContext({ id = "LicenseMenu1", title = "Your licenses", options = Menu })
lib.showContext("LicenseMenu1")
end)

RegisterNetEvent('c-licensemenu:client:openplayerlicensemenu', function(Data)
    local Menu = {}
  if Config.Licenses.Driver then
      Menu[#Menu + 1] = {
        title = "Driver License",
        description = "Status: "..Data.driver,
        icon = "id-card",
        onSelect = function()
            TriggerEvent('c-licensemenu:client:grant_revoke_menu', Data, "Driver", Data.driver)
         end
       }
    end
      if Config.Licenses.Weapon then
      Menu[#Menu + 1] = {
        title = "Weapon License",
        description = "Status: "..Data.weapon,
        icon = "id-card",
        onSelect = function()
            TriggerEvent('c-licensemenu:client:grant_revoke_menu', Data, "Weapon", Data.weapon)
         end
       }
    end
  if Config.Licenses.Business then
      Menu[#Menu + 1] = {
        title = "Business License",
        description = "Status: "..Data.business,
        icon = "id-card",
        onSelect = function()
            TriggerEvent('c-licensemenu:client:grant_revoke_menu', Data, "Business", Data.business)
         end
       }
    end
  if Config.Licenses.Hunting then
      Menu[#Menu + 1] = {
        title = "Hunting License",
        description = "Status: "..Data.hunting,
        icon = "id-card",
        onSelect = function()
            TriggerEvent('c-licensemenu:client:grant_revoke_menu', Data, "Hunting", Data.hunting)
         end
       }
    end
  if Config.Licenses.Pilot then
      Menu[#Menu + 1] = {
        title = "Pilot License",
        description = "Status: "..Data.pilot,
        icon = "id-card",
        onSelect = function()
            TriggerEvent('c-licensemenu:client:grant_revoke_menu', Data, "Pilot", Data.pilot)
         end
       }
    end
lib.registerContext({ id = "LicenseMenu2", title = Data.firstname.." "..Data.lastname.." licenses", options = Menu })
lib.showContext("LicenseMenu2")
end)

RegisterNetEvent('c-licensemenu:client:grant_revoke_menu', function(Data, Type, Type2)
  if Type2 == "Invalid" then
lib.registerContext({ id = "grantlicensemenu2", title = "Grant "..Data.firstname.." "..Data.lastname.." a "..Type.. " license", menu = "LicenseMenu2",
      options = {
       {
        title = "Grant "..Type.." license",
        icon = "check",
        onSelect = function()
            TriggerServerEvent('c-licensemenu:server:grantlicense', Type, Data.serverid)
         end
       }
    }
})lib.showContext("grantlicensemenu2")
  elseif Type2 == "Valid" then
lib.registerContext({ id = "revokelicensemenu2", title = "Revoke "..Data.firstname.." "..Data.lastname.." a "..Type.. " license", menu = "LicenseMenu2",
      options = {
       {
        title = "Revoke "..Type.." license",
        icon = "gavel",
        onSelect = function()
            TriggerServerEvent('c-licensemenu:server:revokelicense', Type, Data.serverid)
         end
       }
    }
 })
lib.showContext("revokelicensemenu2")
    end
end)