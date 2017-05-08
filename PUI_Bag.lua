local PUI = PUI
if PUI.IBag == nil then PUI.IBag = {} end

local ITEM_TRAIT_TYPE_ARMOR_ORNATE = ITEM_TRAIT_TYPE_ARMOR_ORNATE
local ITEM_TRAIT_TYPE_JEWELRY_ORNATE = ITEM_TRAIT_TYPE_JEWELRY_ORNATE
local ITEM_TRAIT_TYPE_WEAPON_ORNATE = ITEM_TRAIT_TYPE_WEAPON_ORNATE

local ITEMTYPE_TRASH = ITEMTYPE_TRASH

local JUNK_ITEM_TRAITS = {
    ITEM_TRAIT_TYPE_ARMOR_ORNATE,
    ITEM_TRAIT_TYPE_JEWELRY_ORNATE,
    ITEM_TRAIT_TYPE_WEAPON_ORNATE,
}
local JUNK_ITEM_TYPES = {
    ITEMTYPE_TRASH,
}

function PUI.IBag.MarkJunkItemsInBag(bagId)
    d("Marking junk items...")
    for i=0,PUI.IBag.Max(bagId)-1,1 do
        if PUI.IBag.IsJunkItem(bagId, i) then
            SetItemIsJunk(bagId, i, true)
        end
    end
    d("Marking junk items... Complete!")
end

function PUI.IBag.LockDeconstructionItemsInBag(bagId)

end

function PUI.IBag.GetJunkItems(bagId)

end

function PUI.IBag.GetDeconstructionItems(bagId)

end

function PUI.IBag.IsJunkItem(bagId, slotIndex)
    local itemType = GetItemType(bagId, slotIndex)
    local itemTrait = GetItemTrait(bagId, slotIndex)
    local isLocked = IsItemPlayerLocked(bagId, slotIndex)

    -- Anything locked cannot be marked as junk
    if isLocked then
        return false
    end

    -- Check for junk item traits
    for i, junkItemTrait in ipairs(JUNK_ITEM_TRAITS) do
        if itemTrait == junkItemTrait then
            return true
        end
    end

    -- Check for junk item types
    for i, junkItemType in ipairs(JUNK_ITEM_TYPES) do
        if itemType == junkItemType then
            return true
        end
    end

    return false
end

function PUI.IBag.Max(bagId)
    return GetBagSize(bagId)
end