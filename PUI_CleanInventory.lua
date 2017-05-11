local JUNK_ITEM_TRAITS = {
    PUI.IBag.ITEM_TRAIT_TYPE_ARMOR_ORNATE,
    PUI.IBag.ITEM_TRAIT_TYPE_JEWELRY_ORNATE,
    PUI.IBag.ITEM_TRAIT_TYPE_WEAPON_ORNATE,
    PUI.IBag.ITEM_TRAIT_TYPE_WEAPON_INTRICATE,
}

local JUNK_ITEM_TYPES = {
    PUI.IBag.ITEMTYPE_TRASH,
}

local function IsJunkItem(item)
    local isLocked = item[PUI.IBag.ITEM_IS_LOCKED_FIELD]
    if isLocked then
        return false
    end

    -- Check for junk item traits
    local itemTrait = item[PUI.IBag.ITEM_TRAIT_FIELD]
    for i, junkItemTrait in ipairs(JUNK_ITEM_TRAITS) do
        if itemTrait == junkItemTrait then
            return true
        end
    end

    -- Check for junk item types
    local itemType = item[PUI.IBag.ITEM_TYPE_FIELD]
    for i, junkItemType in ipairs(JUNK_ITEM_TYPES) do
        if itemType == junkItemType then
            return true
        end
    end

    return false
end

local function OnMarkJunk()
    d("Marking Junk Items...")

    local bagId = BAG_BACKPACK
    local items = PUI.IBag.GetAllItems(bagId)
    for i, item in ipairs(items) do
        if IsJunkItem(item) then
            PUI.IBag.SetItemIsJunk(
                bagId,
                item[PUI.IBag.ITEM_SLOT_INDEX_FIELD],
                true
            )
        end
    end

    d("Marking Junk Items... Complete")
end

PUI.IChatCommand.Register("/markjunk", OnMarkJunk)