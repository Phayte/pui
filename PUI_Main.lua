function PUI.OnAddOnLoaded(eventCode, addonName)
    EVENT_MANAGER:UnregisterForEvent(PUI.Info.addOnName, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(PUI.Info.addOnName, EVENT_ADD_ON_LOADED, PUI.OnAddOnLoaded)
