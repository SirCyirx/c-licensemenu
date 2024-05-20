local QBCore = exports['qb-core']:GetCoreObject()
if Config.SelfCheck == true then
QBCore.Commands.Add(Config.CommandName.SelfCheck, 'Check your licenses', {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local LicenseTable = Player.PlayerData.metadata["licences"]
  if LicenseTable.driver then Driver = "Valid" else Driver = "Invalid" end
  if LicenseTable.weapon then Weapon =  "Valid" else Weapon = "Invalid" end
  if LicenseTable.business then Business = "Valid" else Business = "Invalid" end
  if LicenseTable.hunting then Hunting =  "Valid" else Hunting = "Invalid" end
  if LicenseTable.pilot then Pilot = "Valid" else Pilot = "Invalid" end
    local Data = {
        driver = Driver,
        weapon = Weapon,
        business = Business,
        hunting = Hunting,
        pilot = Pilot,
       }
       TriggerClientEvent('c-licensemenu:client:openlicensemenu', src, Data)
end) end

QBCore.Commands.Add(Config.CommandName.PoliceCheck, 'Check players licenses', {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
  if Player.PlayerData.job.name == Config.PoliceJob then
  if Player.PlayerData.job.grade.level >= Config.RequiredRank then
    local GetNearestPlayer = lib.callback.await('c-licensemenu:client:closeplayercheck', src)
  if not GetNearestPlayer == false then
    local NearestPlayer = QBCore.Functions.GetPlayer(GetNearestPlayer)
    local LicenseTable = NearestPlayer.PlayerData.metadata["licences"]
  if LicenseTable.driver then Driver = "Valid" else Driver = "Invalid" end
  if LicenseTable.weapon then Weapon =  "Valid" else Weapon = "Invalid" end
  if LicenseTable.business then Business = "Valid" else Business = "Invalid" end
  if LicenseTable.hunting then Hunting =  "Valid" else Hunting = "Invalid" end
  if LicenseTable.pilot then Pilot = "Valid" else Pilot = "Invalid" end
    local Data = {
        serverid = GetNearestPlayer,
        firstname = NearestPlayer.PlayerData.charinfo.firstname,
        lastname = NearestPlayer.PlayerData.charinfo.lastname,
        driver = Driver,
        weapon = Weapon,
        business = Business,
        hunting = Hunting,
        pilot = Pilot,
       }
       TriggerClientEvent('c-licensemenu:client:openplayerlicensemenu', src, Data)
   else
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["not_close_text"], 'error')
   end else
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["rank_not_high"], 'error')
   end else
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["not_police"], 'error')
    end
end)

RegisterServerEvent('c-licensemenu:server:grantlicense', function(Type, playerid)
    local src = source
    local NearestPlayer = QBCore.Functions.GetPlayer(playerid)
    local LicenseTable = NearestPlayer.PlayerData.metadata["licences"]
  if Type == "Driver" then
       LicenseTable["driver"] = true
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just granted a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just granted player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Weapon" then
       LicenseTable["weapon"] = true
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just granted a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just granted player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Business" then
       LicenseTable["business"] = true
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just granted a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just granted player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Hunting" then
       LicenseTable["hunting"] = true
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just granted a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just granted player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Pilot" then
       LicenseTable["pilot"] = true
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just granted a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just granted player with ID:".. playerid.." "..Type.." license")
    end
end)

RegisterServerEvent('c-licensemenu:server:revokelicense', function(Type, playerid)
    local src = source
    local NearestPlayer = QBCore.Functions.GetPlayer(playerid)
    local LicenseTable = NearestPlayer.PlayerData.metadata["licences"]
  if Type == "Driver" then
       LicenseTable["driver"] = false
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just revoked a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just revoked player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Weapon" then
       LicenseTable["weapon"] = false
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just revoked a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just revoked player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Business" then
       LicenseTable["business"] = false
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just revoked a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just revoked player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Hunting" then
       LicenseTable["hunting"] = false
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just revoked a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just revoked player with ID:".. playerid.." "..Type.." license")
  elseif Type == "Pilot" then
       LicenseTable["pilot"] = false
       NearestPlayer.Functions.SetMetaData('licences', LicenseTable)
       NotifyServerAlert(src, {Config.Lang["header"]}, "You have just revoked a player a "..Type.." license", 'inform')
       DiscordWebHookAlert("Revoke License Webhook", "Player with ID:"..src.." just revoked player with ID:".. playerid.." "..Type.." license")
    end
end)

function DiscordWebHookAlert(title, description)
  if Config.UseWebHook == true then
    local Data = {{ ["color"] = 16753920, ["title"] = "**".. title .."**", ["description"] = description }}
       PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = Data}), {['Content-Type'] = 'application/json'})
   end
end