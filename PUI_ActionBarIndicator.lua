local currentWeaponPair = GetActiveWeaponPairInfo()

local function OnPairChanged(eventCode, activeWeaponPair, locked)
    ActionBarIndicator:SetHidden(false)
    d("Test")
    if currentWeaponPair ~= activeWeaponPair then
        currentWeaponPair = activeWeaponPair
        if currentWeaponPair == ACTIVE_WEAPON_PAIR_MAIN then
            --ActionBarIndicatorLabel:SetText("Front")
        else
            --ActionBarIndicatorLabel:SetText("Back")
        end
    end
end

PUI.IEvent.RegisterDefaultEvent(EVENT_ACTIVE_WEAPON_PAIR_CHANGED, OnPairChanged)
--EVENT_MANAGER:RegisterForEvent(PUI.Info.addOnName, EVENT_ACTIVE_WEAPON_PAIR_CHANGED, OnPairChanged)
