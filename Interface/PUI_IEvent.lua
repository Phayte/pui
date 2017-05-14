if PUI.IEvent == nil then PUI.IEvent = {} end
if PUI.IEvent.Callbacks == nil then PUI.IEvent.Callbacks = {} end
if PUI.IEvent.RegisteredEvents == nil then PUI.IEvent.RegisteredEvents = {} end

local function OnEventActiveWeaponPairChanged(eventCode, activeWeaponPair, locked)
    local callbacks = PUI.IEvent.Callbacks[eventCode]
    if not callbacks then
        return
    end

    for i, callback in ipairs(callbacks) do
        callback(eventCode, activeWeaponPair, locked)
    end
end

local function GetDefaultParentCallback(eventName)
    if eventName == EVENT_ACTIVE_WEAPON_PAIR_CHANGED then
        return OnEventActiveWeaponPairChanged
    end
end

function PUI.IEvent.RegisterDefaultEvent(eventName, eventCallback)
    if PUI.IEvent.Callbacks[eventName] == nil then
        PUI.IEvent.Callbacks[eventName] = {}
        PUI.IEvent.RegisteredEvents[eventName] = {}

        local parentCallback = GetDefaultParentCallback(eventName)
        EVENT_MANAGER:RegisterForEvent(PUI.Info.addOnName, eventName, parentCallback)
    end

    table.insert(PUI.IEvent.Callbacks[eventName], eventCallback)

end
