if PUI.IBag == nil then PUI.IBag = {} end

PUI.IBag.ITEM_TRAIT_TYPE_ARMOR_ORNATE   = ITEM_TRAIT_TYPE_ARMOR_ORNATE
PUI.IBag.ITEM_TRAIT_TYPE_JEWELRY_ORNATE = ITEM_TRAIT_TYPE_JEWELRY_ORNATE
PUI.IBag.ITEM_TRAIT_TYPE_WEAPON_ORNATE  = ITEM_TRAIT_TYPE_WEAPON_ORNATE

PUI.IBag.ITEMTYPE_TRASH = ITEMTYPE_TRASH

PUI.IBag.MaxSlots       = GetBagSize -- (bagId)
PUI.IBag.SetItemIsJunk  = SetItemIsJunk -- (bagId, slotIndex, isJunk)

PUI.IBag.ITEM_SLOT_INDEX_FIELD  = 0
PUI.IBag.ITEM_NAME_FIELD        = 1
PUI.IBag.ITEM_TYPE_FIELD        = 2
PUI.IBag.ITEM_TRAIT_FIELD       = 3
PUI.IBag.ITEM_IS_LOCKED_FIELD   = 4

function PUI.IBag.GetAllItems(bagId)
    local items = {}
    for slotIndex=0, PUI.IBag.MaxSlots(bagId)-1, 1 do
        local itemName = GetItemName(bagId, slotIndex)
        if itemName ~= nil and itemName ~= "" then
            local item = {}
            item[PUI.IBag.ITEM_NAME_FIELD] = itemName
            item[PUI.IBag.ITEM_TYPE_FIELD] = GetItemType(bagId, slotIndex)
            item[PUI.IBag.ITEM_TRAIT_FIELD] = GetItemTrait(bagId, slotIndex)
            item[PUI.IBag.ITEM_IS_LOCKED_FIELD] = IsItemPlayerLocked(bagId, slotIndex)
            table.insert(items, item)
        end
    end
    return items
end

--local JUNK_ITEM_TRAITS = {
--    ITEM_TRAIT_TYPE_ARMOR_ORNATE,
--    ITEM_TRAIT_TYPE_JEWELRY_ORNATE,
--    ITEM_TRAIT_TYPE_WEAPON_ORNATE,
--}
--local JUNK_ITEM_TYPES = {
--    ITEMTYPE_TRASH,
--}
--
--PUI.IBag.MaxSlot = GetBagSize --(bagId)
--
--function PUI.IBag.MarkJunkItemsInBag(bagId)
--    d("Marking junk items...")
--    for i=0,PUI.IBag.MaxSlot(bagId)-1,1 do
--        if PUI.IBag.IsJunkItem(bagId, i) then
--            SetItemIsJunk(bagId, i, true)
--        end
--    end
--    d("Marking junk items... Complete!")
--end
--
--function PUI.IBag.LockDeconstructionItemsInBag(bagId)
--
--end
--
--function PUI.IBag.GetJunkItems(bagId)
--
--end
--
--function PUI.IBag.GetDeconstructionItems(bagId)
--
--end
--
--function PUI.IBag.IsJunkItem(bagId, slotIndex)
--    local itemType = GetItemType(bagId, slotIndex)
--    local itemTrait = GetItemTrait(bagId, slotIndex)
--    local isLocked = IsItemPlayerLocked(bagId, slotIndex)
--
--    -- Anything locked cannot be marked as junk
--    if isLocked then
--        return false
--    end
--
--    -- Check for junk item traits
--    for i, junkItemTrait in ipairs(JUNK_ITEM_TRAITS) do
--        if itemTrait == junkItemTrait then
--            return true
--        end
--    end
--
--    -- Check for junk item types
--    for i, junkItemType in ipairs(JUNK_ITEM_TYPES) do
--        if itemType == junkItemType then
--            return true
--        end
--    end
--
--    return false
--end