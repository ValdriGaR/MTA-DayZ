local spalten = {}
local spalteGuiImage = {}
local spalteGuiText = {}
local optionsTable = {
  player = {
    {
      "Give Painkillers"
    },
    {
      "Give Bandage"
    },
    {
      "Give Morphine"
    }
  }
}
spalten[1] = ""
spalten[2] = ""
spalten[3] = ""
spalten[4] = ""
spalteGuiImage[1] = guiCreateStaticImage(0, 0.45, 0.1, 0.025, "images/scrollmenu_1.png", true)
spalteGuiImage[2] = guiCreateStaticImage(0, 0.475, 0.1, 0.025, "images/scrollmenu_1.png", true)
spalteGuiImage[3] = guiCreateStaticImage(0, 0.5, 0.1, 0.025, "images/scrollmenu_1.png", true)
spalteGuiImage[4] = guiCreateStaticImage(0, 0.525, 0.1, 0.025, "images/scrollmenu_1.png", true)
spalteGuiText[1] = guiCreateLabel(0.05, 0.05, 0.995, 0.95, spalten[1], true, spalteGuiImage[1])
spalteGuiText[2] = guiCreateLabel(0.05, 0.05, 0.995, 0.95, spalten[2], true, spalteGuiImage[2])
spalteGuiText[3] = guiCreateLabel(0.05, 0.05, 0.995, 0.95, spalten[3], true, spalteGuiImage[3])
spalteGuiText[4] = guiCreateLabel(0.05, 0.05, 0.995, 0.95, spalten[4], true, spalteGuiImage[4])
guiSetVisible(spalteGuiImage[1], false)
guiSetVisible(spalteGuiImage[2], false)
guiSetVisible(spalteGuiImage[3], false)
guiSetVisible(spalteGuiImage[4], false)
function showClientMenuItem(arg1, arg2, arg3, arg4)
  local number = 0
  if arg1 == "Take" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Take " .. arg2)
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", arg2)
  end
  if arg1 == "stop" then
    disableMenu()
    refreshLoot(false)
  end
  if arg1 == "Helicrashsite" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Gear (Helicrash)")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "helicrashsite")
  end
  if arg1 == "Hospitalbox" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Gear (Hospitalbox)")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "hospitalbox")
  end
  if arg1 == "Vehicle" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Gear (" .. arg2 .. ")")
    guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
    setElementData(spalteGuiText[number], "markedMenuItem", true)
    setElementData(spalteGuiText[number], "usedItem", "vehicle")
    if getElementData(getElementData(arg3, "parent"), "tent") then
      number = number + 1
      guiSetVisible(spalteGuiImage[number], true)
      guiSetText(spalteGuiText[number], "Remove Tent")
      if number == 1 then
        guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
        setElementData(spalteGuiText[number], "markedMenuItem", true)
      end
      setElementData(spalteGuiText[number], "usedItem", "tent")
      return
    end
    if getElementHealth(arg3) < 1000 and 50 <= getElementHealth(arg3) and 1 <= getElementData(getLocalPlayer(), "Toolbox") then
      number = number + 1
      guiSetVisible(spalteGuiImage[number], true)
      guiSetText(spalteGuiText[number], "Repair (" .. arg2 .. ")")
      setElementData(spalteGuiText[number], "usedItem", "repairvehicle")
    end
  end
  if arg1 == "Player" then
    if 0 < getElementData(arg2, "bleeding") and 1 <= getElementData(getLocalPlayer(), "Bandage") then
      number = number + 1
      guiSetVisible(spalteGuiImage[number], true)
      guiSetText(spalteGuiText[number], "Give Bandage")
      guiLabelSetColor(spalteGuiText[1], 50, 255, 50)
      setElementData(spalteGuiText[1], "markedMenuItem", true)
      setElementData(spalteGuiText[number], "usedItem", "bandage")
    end
    if getElementData(arg2, "blood") < 11900 and 1 <= getElementData(getLocalPlayer(), "Blood Bag") then
      number = number + 1
      guiSetVisible(spalteGuiImage[number], true)
      guiSetText(spalteGuiText[number], "Give Blood Pack")
      setElementData(spalteGuiText[number], "usedItem", "giveblood")
      if number == 1 then
        guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
        setElementData(spalteGuiText[number], "markedMenuItem", true)
      end
    end
  end
  if arg1 == "Dead" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Gear (" .. arg2 .. ")")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "dead")
    number = number + 1
    setElementData(spalteGuiText[number], "usedItem", "deadreason")
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Check Body")
  end
  if arg1 == "Fireplace" and 1 <= getElementData(getLocalPlayer(), "Raw Meat") then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Cook Meat")
    guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
    setElementData(spalteGuiText[number], "markedMenuItem", true)
    setElementData(spalteGuiText[number], "usedItem", "fireplace")
  end
  if arg1 == "Patrol" and 1 <= getElementData(getLocalPlayer(), "Empty Patrol Canister") then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Refill (Empty Patrol Canister)")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "patrolstation")
  end
  if arg1 == "Wirefence" and 1 <= getElementData(getLocalPlayer(), "Toolbox") then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Remove Wirefence")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "wirefence")
  end
  if arg1 == "Gear" then
    number = number + 1
    guiSetVisible(spalteGuiImage[number], true)
    guiSetText(spalteGuiText[number], "Gear")
    if number == 1 then
      guiLabelSetColor(spalteGuiText[number], 50, 255, 50)
      setElementData(spalteGuiText[number], "markedMenuItem", true)
    end
    setElementData(spalteGuiText[number], "usedItem", "itemloot")
  end
end
addEvent("showClientMenuItem", true)
addEventHandler("showClientMenuItem", getLocalPlayer(), showClientMenuItem)
function PlayerScrollMenu(key, keyState, arg)
  if keyState == "down" then
    if not guiGetVisible(spalteGuiImage[2]) then
      return
    end
    if arg == "up" then
      if getElementData(spalteGuiText[1], "markedMenuItem") then
        setElementData(spalteGuiText[1], "markedMenuItem", false)
        setElementData(spalteGuiText[2], "markedMenuItem", true)
        guiLabelSetColor(spalteGuiText[2], 50, 255, 50)
        guiLabelSetColor(spalteGuiText[1], 255, 255, 255)
      elseif getElementData(spalteGuiText[2], "markedMenuItem") then
        setElementData(spalteGuiText[2], "markedMenuItem", false)
        setElementData(spalteGuiText[1], "markedMenuItem", true)
        guiLabelSetColor(spalteGuiText[1], 50, 255, 50)
        guiLabelSetColor(spalteGuiText[2], 255, 255, 255)
      end
    elseif arg == "down" then
      if getElementData(spalteGuiText[1], "markedMenuItem") then
        setElementData(spalteGuiText[1], "markedMenuItem", false)
        setElementData(spalteGuiText[2], "markedMenuItem", true)
        guiLabelSetColor(spalteGuiText[2], 50, 255, 50)
        guiLabelSetColor(spalteGuiText[1], 255, 255, 255)
      elseif getElementData(spalteGuiText[2], "markedMenuItem") then
        setElementData(spalteGuiText[2], "markedMenuItem", false)
        setElementData(spalteGuiText[1], "markedMenuItem", true)
        guiLabelSetColor(spalteGuiText[1], 50, 255, 50)
        guiLabelSetColor(spalteGuiText[2], 255, 255, 255)
      end
    end
  end
end
bindKey("mouse_wheel_up", "down", PlayerScrollMenu, "up")
bindKey("mouse_wheel_down", "down", PlayerScrollMenu, "down")
function disableMenu()
  guiSetVisible(spalteGuiImage[1], false)
  guiSetVisible(spalteGuiImage[2], false)
  guiSetVisible(spalteGuiImage[3], false)
  guiSetVisible(spalteGuiImage[4], false)
  setElementData(spalteGuiText[1], "markedMenuItem", false)
  setElementData(spalteGuiText[2], "markedMenuItem", false)
  setElementData(spalteGuiText[3], "markedMenuItem", false)
  setElementData(spalteGuiText[4], "markedMenuItem", false)
  setNewbieInfo(false, "", "")
end
addEvent("disableMenu", true)
addEventHandler("disableMenu", getLocalPlayer(), disableMenu)
function getPlayerInCol(tab)
  for theKey, thePlayer in ipairs(tab) do
    if thePlayer ~= getLocalPlayer() then
      return true
    end
  end
  return false
end
isInFirePlace = false
function onPlayerTargetPickup(theElement)
  if theElement == getLocalPlayer() then
    if getElementData(source, "parent") == getLocalPlayer() then
      return
    end
    isInFirePlace = false
    setElementData(spalteGuiText[2], "markedMenuItem", false)
    setElementData(spalteGuiText[1], "markedMenuItem", true)
    guiLabelSetColor(spalteGuiText[1], 50, 255, 50)
    guiLabelSetColor(spalteGuiText[2], 255, 255, 255)
    local player = getPlayerInCol(getElementsWithinColShape(source, "player"))
    if getElementData(source, "player") then
      showClientMenuItem("Player", getElementData(source, "parent"))
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", false)
      return
    end
    if getElementData(source, "patrolstation") then
      showClientMenuItem("Patrol")
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", false)
      setNewbieInfo(true, "Patrolstation", [[
Press '-' or 'middle-mouse' to refill a Canister.
 Required: Empty Patrol Canister]], source)
      return
    end
    if getElementData(source, "wirefence") then
      showClientMenuItem("Wirefence")
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", false)
      setNewbieInfo(true, "Wirefence", [[
Press '-' or 'middle-mouse' to remove the fence.
 Required: Toolbox]], source)
      return
    end
    if getElementData(source, "fireplace") then
      showClientMenuItem("Fireplace")
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", false)
      setNewbieInfo(true, "Fireplace", [[
Press '-' or 'middle-mouse' to cook meat.
 Required: Raw Meat]], source)
      isInFirePlace = true
      return
    end
    if player then
    end
    if getElementData(source, "deadman") then
      showClientMenuItem("Dead", getElementData(source, "playername"))
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", true)
      setElementData(getLocalPlayer(), "lootname", "Gear (" .. getElementData(source, "playername") .. ")")
      setNewbieInfo(true, "Gear", "Press J to open the Gear", source)
      return
    end
    if getElementData(source, "item") then
      showClientMenuItem("Take", getElementData(source, "item"))
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", false)
      setNewbieInfo(true, "Item pickup", "Press '-' or 'middle-mouse' to pick up the item.", source)
      return
    end
    if getElementData(source, "helicrash") then
      showClientMenuItem("Helicrashsite", "helicrash")
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", true)
      setElementData(getLocalPlayer(), "lootname", "Gear (Helicrash)")
      setNewbieInfo(true, "Gear", "Press J to open the Gear", source)
      return
    end
    if getElementData(source, "hospitalbox") then
      showClientMenuItem("Hospitalbox", "hospitalbox")
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", true)
      setElementData(getLocalPlayer(), "lootname", "Gear (Hospitalbox)")
      setNewbieInfo(true, "Gear", "Press J to open the Hospitalbox", source)
      return
    end
    if getElementData(source, "vehicle") and not getElementData(source, "deadVehicle") then
      showClientMenuItem("Vehicle", getVehicleName(getElementData(source, "parent")) or "Tent", getElementData(source, "parent"))
      setElementData(getLocalPlayer(), "currentCol", source)
      setElementData(getLocalPlayer(), "loot", true)
      setElementData(getLocalPlayer(), "lootname", "Gear (" .. (getVehicleName(getElementData(source, "parent")) or "Tent") .. ")")
      setNewbieInfo(true, "Gear", "Press J to open the Gear", source)
      return
    end
    if getElementData(source, "itemloot") then
      showClientMenuItem("Gear")
      setElementData(getLocalPlayer(), "loot", true)
      setElementData(getLocalPlayer(), "lootname", "Gear")
      setElementData(getLocalPlayer(), "currentCol", source)
      setNewbieInfo(true, "Gear", "Press J to open the Gear", source)
      return
    end
    showClientMenuItem("stop")
  end
end
addEventHandler("onClientColShapeHit", getRootElement(), onPlayerTargetPickup)
function onPlayerTargetPickup(theElement)
  if theElement == getLocalPlayer() then
    local players = getElementsWithinColShape(source, "player")
    if players == getLocalPlayer() then
    end
    showClientMenuItem("stop")
    setElementData(getLocalPlayer(), "loot", false)
    setElementData(getLocalPlayer(), "currentCol", false)
    setNewbieInfo(false, "", "")
    isInFirePlace = false
  end
end
addEventHandler("onClientColShapeLeave", getRootElement(), onPlayerTargetPickup)
local screenWidth, screenHeight = guiGetScreenSize()
local newbieShow = false
local newbieHead = "-"
local newbieText = "-"
local newbiePosition = 0
function setNewbieInfo(show, head, text, element)
  newbieShow = show
  newbieHead = head
  newbieText = text
  newbiePosition = element
end
addEventHandler("onClientRender", getRootElement(), function()
  if newbieShow == false then
    return
  end
  local x, y, z = getElementPosition(newbiePosition)
  local x, y = getScreenFromWorldPosition(x, y, z)
  local length = dxGetTextWidth(newbieText, 1, "default-bold")
  dxDrawRectangle(x - length / 2 - screenWidth * 0.01, y, screenWidth * 0.02 + length, screenHeight * 0.1, tocolor(33, 33, 33, 100))
  dxDrawingColorText(newbieHead, x - length / 2 - screenWidth * 0.01, y, x + length / 2 + screenWidth * 0.01, y + screenHeight * 0.03, tocolor(22, 255, 22, 120), 0.5, 1.1, "default-bold", "center", "center")
  dxDrawingColorText(newbieText, x - length / 2 - screenWidth * 0.01, y + screenHeight * 0.03, x + length / 2 + screenWidth * 0.01, y + screenHeight * 0.07, tocolor(255, 255, 255, 120), 0.5, 1, "default-bold", "center", "center")
end)
function fireRaiseTemperature()
  if isInFirePlace and getElementData(getLocalPlayer(), "temperature") <= 38 then
    setElementData(getLocalPlayer(), "temperature", getElementData(getLocalPlayer(), "temperature") + 0.25)
  end
end
setTimer(fireRaiseTemperature, 10000, 0)
unbindKey("mouse3", "both")
function onPlayerPressMiddleMouse(key, keyState)
  if keyState == "down" then
    if not guiGetVisible(spalteGuiText[1]) then
      return
    end
    local itemName = getMenuMarkedItem()
    if itemName == "helicrashsite" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Gear (Helicrash)"
      refreshLoot(col, gearName)
      showInventoryManual()
      return
    end
    if itemName == "itemloot" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Gear"
      refreshLoot(col, gearName)
      showInventoryManual()
      return
    end
    if itemName == "wirefence" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Remove Wirefence"
      triggerServerEvent("removeWirefence", getLocalPlayer(), getElementData(col, "parent"))
      disableMenu()
      return
    end
    if itemName == "hospitalbox" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Gear (Hospitalbox)"
      refreshLoot(col, gearName)
      showInventoryManual()
      return
    end
    if itemName == "vehicle" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Gear (" .. (getVehicleName(getElementData(col, "parent")) or "Tent") .. ")"
      refreshLoot(col, gearName)
      showInventoryManual()
      return
    end
    if itemName == "repairvehicle" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("repairVehicle", getLocalPlayer(), getElementData(col, "parent"))
      disableMenu()
      return
    end
    if itemName == "tent" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("removeTent", getLocalPlayer(), getElementData(col, "parent"))
      disableMenu()
      return
    end
    if itemName == "fireplace" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("addPlayerCookMeat", getLocalPlayer())
      disableMenu()
      return
    end
    if itemName == "bandage" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("onPlayerGiveMedicObject", getLocalPlayer(), itemName, getElementData(col, "parent"))
      disableMenu()
      return
    end
    if itemName == "giveblood" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("onPlayerGiveMedicObject", getLocalPlayer(), itemName, getElementData(col, "parent"))
      disableMenu()
      return
    end
    if itemName == "dead" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = "Gear (" .. getElementData(col, "playername") .. ")"
      refreshLoot(col, gearName)
      showInventoryManual()
      return
    end
    if itemName == "deadreason" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      outputChatBox(getElementData(col, "deadreason"), 255, 255, 255, true)
      return
    end
    if itemName == "patrolstation" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      setElementData(getLocalPlayer(), "Empty Patrol Canister", getElementData(getLocalPlayer(), "Empty Patrol Canister") - 1)
      setElementData(getLocalPlayer(), "Full Patrol Canister", (getElementData(getLocalPlayer(), "Full Patrol Canister") or 0) + 1)
      triggerEvent("displayClientInfo", getLocalPlayer(), "Patrolstation", "You filled your Patrol Canister up", 22, 255, 0)
      disableMenu()
      return
    end
    if isToolbeltItem(itemName) then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col)
      disableMenu()
      return
    end
    if itemName == "Small Backpack" or itemName == "Alice Backpack" or itemName == "Coyote Backpack" then
      local col = getElementData(getLocalPlayer(), "currentCol")
      triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col)
      disableMenu()
      return
    end
    if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
      do
        local col = getElementData(getLocalPlayer(), "currentCol")
        triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col)
        disableMenu()
      end
    else
      startRollMessage2("Inventory", "Your Inventory is to full", 255, 22, 0)
    end
  end
end
bindKey("mouse3", "down", onPlayerPressMiddleMouse)
bindKey("-", "down", onPlayerPressMiddleMouse)
function getMenuMarkedItem()
  for i, guiItem in ipairs(spalteGuiText) do
    if getElementData(guiItem, "markedMenuItem") then
      return getElementData(guiItem, "usedItem")
    end
  end
end
function playerPressedKey(button, press)
  if press and (button == "w" or button == "a" or button == "s" or button == "d") then
    local anim, anim2 = getPedAnimation(getLocalPlayer())
    if anim and anim == "SCRATCHING" and anim2 == "sclng_r" then
      triggerServerEvent("onClientMovesWhileAnimation", getLocalPlayer())
    end
  end
end
addEventHandler("onClientKey", root, playerPressedKey)
