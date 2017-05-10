if PUI.IChatCommand == nil then PUI.IChatCommand = {} end

function PUI.IChatCommand.Register(cmdString, cmdAction)
    SLASH_COMMANDS[cmdString] = cmdAction
end

function PUI.IChatCommand.Unregister(cmdString)
    SLASH_COMMANDS[cmdString] = nil
end

--local BAG_BACKPACK = BAG_BACKPACK
--
--function PUI.IChatCommand.PUITest(args)
--	d("PUITest")
--end
--SLASH_COMMANDS["/puitest"] = PUI.IChatCommand.PUITest
--
--function PUI.IChatCommand.CleanInventory(args)
--	PUI.IBag.MarkJunkItemsInBag(BAG_BACKPACK)
--end
--SLASH_COMMANDS["/cleaninv"] = PUI.IChatCommand.CleanInventory
--
--function PUI.IChatCommand.SaveResearchTraits(args)
--	PUI.ICrafting.SaveResearchTraits()
--end
--SLASH_COMMANDS["/saveresearch"] = PUI.IChatCommand.SaveResearchTraits