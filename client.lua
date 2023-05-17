NDCore = exports["ND_Core"]:GetCoreObject()
local menuPool = NativeUI.CreatePool()

-- Main Menu Name this is the first name you see when you press ~ or type /yip
local mainMenu = NativeUI.CreateMenu('NW|Roleplay', "", 1420, 0)

-- MegaPhone
local TrafficMenu = menuPool:AddSubMenu(mainMenu, 'Traffic', "", 1420, 0) -- Name whatever you'd like for categorization
local tm = menuPool:AddSubMenu(TrafficMenu, 'Yip Mega Phone Orders', "", 1420, 0)

-- Traffic Orders Menu
local TrafficMenu = {}
TrafficMenu.tm1 = NativeUI.CreateItem('Traffic 1', 'Get this vehicle.')
TrafficMenu.tm2 = NativeUI.CreateItem('Traffic 2', 'Get this vehicle.')
TrafficMenu.tm3 = NativeUI.CreateItem('Trrafic 3', 'Get this vehicle.')
TrafficMenu.tm4 = NativeUI.CreateItem('Traffic 4', 'Get this vehicle.')
TrafficMenu.tm5 = NativeUI.CreateItem('Traffic 5', 'Get this vehicle.')
TrafficMenu.tm6 = NativeUI.CreateItem('Traffic 6', 'Get this vehicle.')
TrafficMenu.tm7 = NativeUI.CreateItem('Traffic 7', 'Get this vehicle.')
TrafficMenu.tm8 = NativeUI.CreateItem('Traffic 8', 'Get this vehicle.')

tm:AddItem(TrafficMenu.tm1)
tm:AddItem(TrafficMenu.tm2)
tm:AddItem(TrafficMenu.tm3)
tm:AddItem(TrafficMenu.tm4)
tm:AddItem(TrafficMenu.tm5)
tm:AddItem(TrafficMenu.tm6)
tm:AddItem(TrafficMenu.tm7)
tm:AddItem(TrafficMenu.tm8)

tm.OnItemSelect = function(sender, item, index)
    if item == TrafficMenu.tm1 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm1', 1.0)
    elseif item == TrafficMenu.tm2 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm2', 1.0)
    elseif item == TrafficMenu.tm3 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm3', 1.0)
    elseif item == TrafficMenu.tm4 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm4', 1.0)
    elseif item == TrafficMenu.tm5 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm5', 1.0)
    elseif item == TrafficMenu.tm6 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm6', 1.0)
    elseif item == TrafficMenu.tm7 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm7', 1.0)
    elseif item == TrafficMenu.tm8 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10.5, 'tm8', 1.0)
    end
end

-- Chat Command 'yip'
RegisterCommand('yip', function()
    local character = NDCore.Functions.GetSelectedCharacter()
    if not character then
        return
    end

    if config["/yip"].enabled then
    local allowedJobs = config["/yip"].CanUse
    local currentJob = character.job
    if allowedJobs and currentJob and allowedJobs[currentJob] then
        mainMenu:Visible(not mainMenu:Visible())
    end
end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 243) then
            if config["/yip"].enabled then
                local allowedJobs = config["/yip"].CanUse
                local currentJob = character.job
                if allowedJobs and currentJob and allowedJobs[currentJob] then
                    mainMenu:Visible(not mainMenu:Visible())
                end
            end
        end
    end
end)


-- No Touchy
function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

menuPool:Add(mainMenu)
menuPool:RefreshIndex()
menuPool:MouseControlsEnabled(false)
menuPool:ControlDisablingEnabled(false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)

function HelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end