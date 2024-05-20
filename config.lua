local QBCore = exports['qb-core']:GetCoreObject()

Config = Config or {}

Config.NotifyType = "ox" -- [qb] or [Okok] or [ox] or [mythic]

Config.PoliceJob = "police"
Config.RequiredRank = 2
Config.SelfCheck = true -- If set true then people can do /licensemenu people can check what licenses they have
Config.CommandName = {
    SelfCheck = 'licensemenu',
    PoliceCheck = 'checklicenses'
}
Config.Licenses = {
    Driver = true,
    Weapon = true,
    Business = true,
    Hunting = true,
    Pilot = true
}
Config.UseWebHook = true -- If set true then a meesage will be sent to the below webhook when a player is deleted
Config.Webhook = ""

Config.Lang = {
    ["header"] = "Notification.",
    ["rank_not_high"] = "You are not a high enough rank to do this action.",
    ["not_police"] = "You must be a police officer in order to do this action.",
    ["not_close_text"] = "No one nearby. Please try again!"
}

function NotifyClientAlert(titletext, msgtext, type)
    if Config.NotifyType == "qb" then
        if type == 'inform' then
            local info = 'primary'
        QBCore.Functions.Notify(msgtext, info, 5000)
        end
    elseif Config.NotifyType == "ox" then
        lib.notify({ title = titletext, description = msgtext, type = type })
    elseif Config.NotifyType == "okok" then
        if type == 'inform' then
            local info = 'info'
        exports['okokNotify']:Alert(titletext, msgtext, 5000, info)
        end
    elseif Config.NotifyType == "mythic" then
        exports['mythic_notify']:DoHudText(type, msgtext, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    elseif Config.NotifyType == "custom" then
   end
end

function NotifyServerAlert(src, titletext, msgtext, type)
    if Config.NotifyType == "qb" then
        if type == 'inform' then
           local info = 'primary'
        TriggerClientEvent('QBCore:Notify', src, msgtext, info)
        end
    elseif Config.NotifyType == "ox" then
        TriggerClientEvent('ox_lib:notify', src, { title = titletext, description = msgtext, type = type })
    elseif Config.NotifyType == "okok" then
        if type == 'inform' then
            local info = 'info'
        TriggerClientEvent('okokNotify:Alert', src, titletext, msgtext, 5000, info)
        end
    elseif Config.NotifyType == "mythic" then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msgtext, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    elseif Config.NotifyType == "custom" then
   end
end