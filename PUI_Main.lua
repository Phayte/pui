local PUI = PUI

local BAG_BACKPACK = BAG_BACKPACK

function PUI:Initialize()

end

function PUI.OnAddOnLoaded(eventCode, addonName)

end

function PUI.OnInventoryClean()
    PUI.IBag.MarkJunkItemsInBag(BAG_BACKPACK)
end

function PUI.OnPUITest()
    d("PUI Test")
end

SLASH_COMMANDS["/iclean"] = PUI.OnInventoryClean
SLASH_COMMANDS["/puitest"] = PUI.OnPUITest

EVENT_MANAGER:RegisterForEvent(PUI.IInfo.addOnName, EVENT_ADD_ON_LOADED, PUI.OnAddOnLoaded)
