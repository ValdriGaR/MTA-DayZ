local vehicleDataTableForTent = {
  {"Wood"},
  {"Bandage"},
  {
    "Water Bottle"
  },
  {"Pasta Can"},
  {"Beans Can"},
  {"Burger"},
  {"Lighter"},
  {
    "Pistol Ammo"
  },
  {"Pistol"},
  {
    "Silenced Pistol"
  },
  {"Shotgun"},
  {"Uzi"},
  {"Knife"},
  {"Morphine"},
  {"Katana"},
  {"Pizza"},
  {
    "Soda Bottle"
  },
  {
    "Empty Patrol Canister"
  },
  {
    "Full Patrol Canister"
  },
  {"Roadflare"},
  {"Milk"},
  {"Smg Ammo"},
  {
    "Assault Ammo"
  },
  {"Tear Gas"},
  {"Grenade"},
  {
    "Desert Eagle"
  },
  {
    "Sawn-Off Shotgun"
  },
  {
    "SPAZ-12 Combat Shotgun"
  },
  {"MP5"},
  {"Watch"},
  {"Medic Kit"},
  {"Heat Pack"},
  {
    "Country Rifle"
  },
  {"Uzi"},
  {"TEC-9"},
  {"AK-47"},
  {
    "Rocket Launcher"
  },
  {"Blood Bag"},
  {"GPS"},
  {"Map"},
  {"Toolbox"},
  {"Wire Fence"},
  {"Tire"},
  {"Engine"},
  {
    "Rocket Ammo"
  },
  {
    "Sniper Ammo"
  },
  {"M4"},
  {
    "Sniper Rifle"
  },
  {
    "Heat-Seeking RPG"
  },
  {"Satchel"},
  {
    "Infrared Goggles"
  },
  {
    "Night Vision Goggles"
  },
  {"Tent"},
  {"Raw Meat"},
  {
    "Cooked Meat"
  },
  {"Army Skin"},
  {
    "Sniper Skin"
  },
  {
    "Civilian Skin"
  },
  {
    "Standart Skin"
  },
  {"Painkiller"},
  {"Binocular"},
  {
    "Empty Water Bottle"
  },
  {
    "Empty Soda Cans"
  },
  {
    "Scruffy Burgers"
  },
  {
    "Shotgun Ammo"
  },
  {
    "Small Backpack"
  },
  {
    "Alice Backpack"
  },
  {
    "Radio Device"
  },
  {
    "Coyote Backpack"
  },
  {
    "Thermal GPS"
  },
  {"GPS Jammer"}
}
weaponAmmoTable = {
  ["Pistol Ammo"] = {
    {"Pistol", 22},
    {
      "Silenced Pistol",
      23
    },
    {
      "Desert Eagle",
      24
    }
  },
  ["Smg Ammo"] = {
    {"Uzi", 28},
    {"TEC-9", 32},
    {"MP5", 29}
  },
  ["Assault Ammo"] = {
    {"AK-47", 30},
    {"M4", 31}
  },
  ["Shotgun Ammo"] = {
    {"Shotgun", 25},
    {
      "Sawn-Off Shotgun",
      26
    },
    {
      "SPAZ-12 Combat Shotgun",
      27
    }
  },
  ["Sniper Ammo"] = {
    {
      "Country Rifle",
      33
    },
    {
      "Sniper Rifle",
      34
    }
  },
  ["Rocket Ammo"] = {
    {
      "Heat-Seeking RPG",
      36
    },
    {
      "Rocket Launcher",
      35
    }
  },
  ["others"] = {
    {"Parachute", 46},
    {"Satchel", 39},
    {"Tear Gas", 17},
    {"Grenade", 16},
    {"Knife", 4},
    {"Katana", 8}
  }
}
function getWeaponAmmoType(weaponName, notOthers)
  if not notOthers then
    for i, weaponData in ipairs(weaponAmmoTable.others) do
      if weaponName == weaponData[1] then
        return weaponData[1], weaponData[2]
      end
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Pistol Ammo"]) do
    if weaponName == weaponData[1] then
      return "Pistol Ammo", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Smg Ammo"]) do
    if weaponName == weaponData[1] then
      return "Smg Ammo", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Assault Ammo"]) do
    if weaponName == weaponData[1] then
      return "Assault Ammo", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Shotgun Ammo"]) do
    if weaponName == weaponData[1] then
      return "Shotgun Ammo", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Sniper Ammo"]) do
    if weaponName == weaponData[1] then
      return "Sniper Ammo", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Rocket Ammo"]) do
    if weaponName == weaponData[1] then
      return "Rocket Ammo", weaponData[2]
    end
  end
  return false
end
function rearmPlayerWeapon(weaponName, slot)
  takeAllWeapons(source)
  local ammoData, weapID = getWeaponAmmoType(weaponName)
  if getElementData(source, ammoData) <= 0 then
    triggerClientEvent(source, "displayClientInfo", source, "Rearm", "You got no magazine for this weapon", 255, 22, 0)
    return
  end
  setElementData(source, "currentweapon_" .. slot, weaponName)
  local weapon = getElementData(source, "currentweapon_1")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), true)
  end
  local weapon = getElementData(source, "currentweapon_2")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), false)
  end
  local weapon = getElementData(source, "currentweapon_3")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), false)
  end
  if elementWeaponBack[source] then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
  setPedSkin(getElementData(source, "skin"))
end
addEvent("onPlayerRearmWeapon", true)
addEventHandler("onPlayerRearmWeapon", getRootElement(), rearmPlayerWeapon)
weaponIDtoObjectID = {
  {30, 355},
  {31, 356},
  {25, 349},
  {26, 350},
  {27, 351},
  {33, 357},
  {34, 358},
  {36, 360},
  {35, 359}
}
function getWeaponObjectID(weaponID)
  for i, weaponData in ipairs(weaponIDtoObjectID) do
    if weaponID == weaponData[1] then
      return weaponData[2]
    end
  end
end
local elementBackpack = {}
function backPackBack(dataName, oldValue)
  if getElementType(source) == "player" and dataName == "MAX_Slots" then
    local newValue = getElementData(source, dataName)
    if elementBackpack[source] then
      detachElementFromBone(elementBackpack[source])
      destroyElement(elementBackpack[source])
      elementBackpack[source] = false
    end
    local x, y, z = getElementPosition(source)
    local rx, ry, rz = getElementRotation(source)
    if newValue == 16 then
      elementBackpack[source] = createObject(3026, x, y, z)
    elseif newValue == 28 then
      elementBackpack[source] = createObject(1248, x, y, z)
    elseif newValue == 36 then
      elementBackpack[source] = createObject(1252, x, y, z)
    elseif newValue == 10 then
      return
    end
    attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0)
  end
end
addEventHandler("onElementDataChange", getRootElement(), backPackBack)
function backpackRemoveQuit()
  if elementBackpack[source] then
    detachElementFromBone(elementBackpack[source])
    destroyElement(elementBackpack[source])
  end
  if elementWeaponBack[source] then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
end
addEventHandler("onPlayerQuit", getRootElement(), backpackRemoveQuit)
elementWeaponBack = {}
function weaponSwitchBack(previousWeaponID, currentWeaponID)
  local weapon1 = getElementData(source, "currentweapon_1")
  if not weapon1 then
    return
  end
  local ammoData1, weapID1 = getWeaponAmmoType(weapon1)
  local x, y, z = getElementPosition(source)
  local rx, ry, rz = getElementRotation(source)
  if previousWeaponID == weapID1 then
    if elementWeaponBack[source] then
      detachElementFromBone(elementWeaponBack[source])
      destroyElement(elementWeaponBack[source])
      elementWeaponBack[source] = false
    end
    elementWeaponBack[source] = createObject(getWeaponObjectID(weapID1), x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
    if elementBackpack[source] then
      attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.31, -0.1, 0, 270, -90)
    else
      attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.11, -0.1, 0, 270, 10)
    end
  elseif currentWeaponID == weapID1 then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), weaponSwitchBack)
function removeBackWeaponOnDrop()
  if elementWeaponBack[source] then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
end
addEvent("removeBackWeaponOnDrop", true)
addEventHandler("removeBackWeaponOnDrop", getRootElement(), removeBackWeaponOnDrop)
function removeAttachedOnDeath()
  if elementBackpack[source] then
    detachElementFromBone(elementBackpack[source])
    destroyElement(elementBackpack[source])
  end
  if elementWeaponBack[source] then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
end
addEvent("kilLDayZPlayer", true)
addEventHandler("kilLDayZPlayer", getRootElement(), removeAttachedOnDeath)
function weaponDelete(dataName, oldValue)
  if getElementType(source) == "player" then
    local weapon1 = getElementData(source, "currentweapon_1")
    local weapon2 = getElementData(source, "currentweapon_2")
    local weapon3 = getElementData(source, "currentweapon_3")
    if (dataName == weapon1 or dataName == weapon2 or dataName == weapon3) and getElementData(source, dataName) == 0 then
      local ammoData, weapID = getWeaponAmmoType(dataName)
      takeWeapon(source, weapID)
    end
    local weapon1 = getElementData(source, "currentweapon_1")
    local weapon2 = getElementData(source, "currentweapon_2")
    local weapon3 = getElementData(source, "currentweapon_3")
    local ammoData1, weapID1 = getWeaponAmmoType(weapon1)
    local ammoData2, weapID2 = getWeaponAmmoType(weapon2)
    local ammoData3, weapID3 = getWeaponAmmoType(weapon3)
    if dataName == ammoData1 then
      local newammo = oldValue - getElementData(source, dataName)
      if newammo == 1 then
        return
      end
      if oldValue > getElementData(source, dataName) then
        takeWeapon(source, weapID1, newammo)
        if elementWeaponBack[source] then
          detachElementFromBone(elementWeaponBack[source])
          destroyElement(elementWeaponBack[source])
          elementWeaponBack[source] = false
        end
      elseif oldValue < getElementData(source, dataName) then
        giveWeapon(source, weapID1, getElementData(source, dataName) - oldValue, true)
      end
    end
    if dataName == ammoData2 then
      local newammo = oldValue - getElementData(source, dataName)
      if newammo == 1 then
        return
      end
      if oldValue > getElementData(source, dataName) then
        takeWeapon(source, weapID2, newammo)
      elseif oldValue < getElementData(source, dataName) then
        giveWeapon(source, weapID2, getElementData(source, dataName) - oldValue, false)
      end
    end
    if dataName == ammoData3 then
      local newammo = oldValue - getElementData(source, dataName)
      if newammo == 1 then
        return
      end
      if oldValue > getElementData(source, dataName) then
        takeWeapon(source, weapID3, newammo)
      elseif oldValue < getElementData(source, dataName) then
        giveWeapon(source, weapID3, getElementData(source, dataName) - oldValue, false)
      end
    end
  end
end
addEventHandler("onElementDataChange", getRootElement(), weaponDelete)
function addPlayerStats(player, data, value)
  if data == "food" then
    do
      local current = getElementData(player, data)
      if current + value > 100 then
        setElementData(player, data, 100)
      elseif current + value < 1 then
        setElementData(player, data, 0)
        setElementData(player, "blood", getElementData(player, "blood") - math.random(50, 120))
      else
        setElementData(player, data, current + value)
      end
    end
  elseif data == "thirst" then
    do
      local current = getElementData(player, data)
      if current + value > 100 then
        setElementData(player, data, 100)
      elseif current + value < 1 then
        setElementData(player, data, 0)
        setElementData(player, "blood", getElementData(player, "blood") - math.random(50, 120))
      else
        setElementData(player, data, current + value)
      end
    end
  elseif data == "blood" then
    do
      local current = getElementData(player, data)
      if current + value > 12000 then
        setElementData(player, data, 12000)
      elseif current + value < 1 then
        setElementData(player, data, 0)
      else
        setElementData(player, data, current + value)
      end
    end
  elseif data == "temperature" then
    do
      local current = getElementData(player, data)
      if current + value > 41 then
        setElementData(player, data, 41)
      elseif current + value <= 31 then
        setElementData(player, data, 31)
      else
        setElementData(player, data, current + value)
      end
    end
  elseif data == "humanity" then
    local current = getElementData(player, data)
    if current + value > 5000 then
      setElementData(player, data, 5000)
    else
      setElementData(player, data, current + value)
    end
  end
end
function checkTemperature()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      value = 0
      if getWeather == 7 then
        value = -0.1
      elseif getWeather == 12 then
        value = 0
      elseif getWeather == 16 then
        value = -0.4
      elseif getWeather == 4 then
        value = -0.1
      end
      local hour, minutes = getTime()
      if hour >= 21 and hour <= 8 then
        value = value - 0.05
      end
      addPlayerStats(player, "temperature", value)
    end
  end
end
setTimer(checkTemperature, 60000, 0)
function checkTemperature2()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      value = 0
      if isElementInWater(player) then
        value = -0.1
      end
      if getControlState(player, "sprint") then
        value = value + 0.005
      end
      addPlayerStats(player, "temperature", value)
    end
  end
end
setTimer(checkTemperature2, 10000, 0)
function setHunger()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      value = -1.5
      addPlayerStats(player, "food", value)
    end
  end
end
setTimer(setHunger, 60000, 0)
function setThirsty()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      value = -2
      addPlayerStats(player, "thirst", value)
    end
  end
end
setTimer(setThirsty, 60000, 0)
function checkThirsty()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      value = 0
      if getControlState(player, "sprint") then
        value = -0.1
      end
      addPlayerStats(player, "thirst", value)
    end
  end
end
setTimer(checkThirsty, 10000, 0)
function checkHumanity()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") and getElementData(player, "humanity") < 2500 then
      addPlayerStats(player, "humanity", 30)
      if getElementData(player, "humanity") > 2000 then
        setElementData(player, "bandit", false)
      end
    end
  end
end
setTimer(checkHumanity, 60000, 0)
function onPlayerRequestChangingStats(itemName, itemInfo, data)
  if data == "food" then
    if itemName == "Burger" then
      blood = 300
    elseif itemName == "Pizza" then
      blood = 300
    elseif itemName == "Cooked Meat" then
      blood = 800
    elseif itemName == "Beans Can" then
      blood = 200
    elseif itemName == "Pasta Can" then
      blood = 200
    end
    setPedAnimation(source, "FOOD", "EAT_Burger", nil, false, false, nil, false)
    setElementData(source, itemName, getElementData(source, itemName) - 1)
    addPlayerStats(source, "blood", blood)
    addPlayerStats(source, data, 100)
  elseif data == "thirst" then
    setElementData(source, itemName, getElementData(source, itemName) - 1)
    addPlayerStats(source, data, 100)
    setPedAnimation(source, "VENDING", "VEND_Drink2_P", nil, false, false, nil, false)
    if itemName == "Water Bottle" then
      setElementData(source, "Empty Water Bottle", (getElementData(source, "Empty Water Bottle") or 0) + 1)
    end
  end
  triggerClientEvent(source, "displayClientInfo", source, "Food", "You have consumed " .. itemName, 22, 255, 0)
  triggerClientEvent(source, "refreshInventoryManual", source)
end
addEvent("onPlayerRequestChangingStats", true)
addEventHandler("onPlayerRequestChangingStats", getRootElement(), onPlayerRequestChangingStats)
function onPlayerUseMedicObject(itemName)
  local playersource = source
  setPedAnimation(playersource, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  setTimer(function()
    if itemName == "Bandage" then
      setElementData(playersource, "bleeding", 0)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    elseif itemName == "Medic Kit" then
      addPlayerStats(playersource, "blood", 7000)
      setElementData(playersource, "bleeding", 0)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    elseif itemName == "Heat Pack" then
      setElementData(playersource, "cold", false)
      setElementData(playersource, "temperature", 37)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    elseif itemName == "Painkiller" then
      setElementData(playersource, "pain", false)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    elseif itemName == "Morphine" then
      setElementData(playersource, "brokenbone", false)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    elseif itemName == "Blood Bag" then
      addPlayerStats(playersource, "blood", 12000)
      setElementData(playersource, itemName, getElementData(playersource, itemName) - 1)
    end
  end, 1500, 1)
  triggerClientEvent(playersource, "refreshInventoryManual", playersource)
end
addEvent("onPlayerUseMedicObject", true)
addEventHandler("onPlayerUseMedicObject", getRootElement(), onPlayerUseMedicObject)
function onPlayerGiveMedicObject(itemName, player)
  local playersource = source
  setPedAnimation(playersource, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  setTimer(function()
    if itemName == "bandage" then
      setElementData(player, "bleeding", 0)
      setElementData(playersource, "Bandage", getElementData(playersource, "Bandage") - 1)
      setElementData(playersource, "humanity", getElementData(playersource, "humanity") + 40)
    elseif itemName == "giveblood" then
      addPlayerStats(player, "blood", 12000)
      setElementData(playersource, "Blood Bag", getElementData(playersource, "Blood Bag") - 1)
      setElementData(playersource, "humanity", getElementData(playersource, "humanity") + 250)
    end
  end, 1500, 1)
end
addEvent("onPlayerGiveMedicObject", true)
addEventHandler("onPlayerGiveMedicObject", getRootElement(), onPlayerGiveMedicObject)
skinTable = {
  {"Army Skin", 287},
  {
    "Civilian Skin",
    179
  },
  {
    "Sniper Skin",
    285
  },
  {
    "Standart Skin",
    73
  }
}
function getSkinIDFromName(name)
  for i, skin in ipairs(skinTable) do
    if name == skin[1] then
      return skin[2]
    end
  end
end
function getSkinNameFromID(id)
  for i, skin in ipairs(skinTable) do
    if id == skin[2] then
      return skin[1]
    end
  end
end
function addPlayerSkin(skin)
  local current = getElementData(source, "skin")
  local name = getSkinNameFromID(current)
  setElementData(source, name, getElementData(source, name) + 1)
  setElementData(source, skin, getElementData(source, skin) - 1)
  local id = getSkinIDFromName(skin)
  setElementData(source, "skin", id)
  setPedSkin(source, id)
  triggerClientEvent(source, "refreshInventoryManual", source)
end
addEvent("onPlayerChangeSkin", true)
addEventHandler("onPlayerChangeSkin", getRootElement(), addPlayerSkin)
function onPlayerRefillWaterBottle(itemName)
  if isElementInWater(source) then
    setElementData(source, "Water Bottle", getElementData(source, "Water Bottle") + 1)
    setElementData(source, itemName, getElementData(source, itemName) - 1)
    triggerClientEvent(source, "refreshInventoryManual", source)
    triggerClientEvent(source, "displayClientInfo", source, "Water Bottle", "You filled your Water Bottle up.", 22, 255, 0)
  else
    triggerClientEvent(source, "displayClientInfo", source, "Water Bottle", "You need to be in a water source", 255, 22, 0)
  end
end
addEvent("onPlayerRefillWaterBottle", true)
addEventHandler("onPlayerRefillWaterBottle", getRootElement(), onPlayerRefillWaterBottle)
function getPointFromDistanceRotation(x, y, dist, angle)
  local a = math.rad(90 - angle)
  local dx = math.cos(a) * dist
  local dy = math.sin(a) * dist
  return x + dx, y + dy
end
function onPlayerPitchATent(itemName)
  setElementData(source, itemName, getElementData(source, itemName) - 1)
  setPedAnimation(source, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  local source = source
  setTimer(function()
    local x, y, z = getElementPosition(source)
    local xr, yr, zr = getElementRotation(source)
    px, py, pz = getElementPosition(source)
    prot = getPedRotation(source)
    local offsetRot = math.rad(prot + 90)
    local vx = px + 5 * math.cos(offsetRot)
    local vy = py + 5 * math.sin(offsetRot)
    local vz = pz + 2
    local vrot = prot + 180
    tent = createObject(3243, vx, vy, z - 1, 0, 0, vrot)
    setObjectScale(tent, 1.3)
    tentCol = createColSphere(x, y, z, 4)
    attachElements(tentCol, tent, 0, 0, 0)
    setElementData(tentCol, "parent", tent)
    setElementData(tent, "parent", tentCol)
    setElementData(tentCol, "tent", true)
    setElementData(tentCol, "vehicle", true)
    setElementData(tentCol, "MAX_Slots", 100)
    triggerClientEvent(source, "refreshInventoryManual", source)
  end, 1500, 1)
end
addEvent("onPlayerPitchATent", true)
addEventHandler("onPlayerPitchATent", getRootElement(), onPlayerPitchATent)
function onPlayerBuildAWireFence(itemName)
  setElementData(source, itemName, getElementData(source, itemName) - 1)
  setPedAnimation(source, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  local source = source
  setTimer(function()
    local x, y, z = getElementPosition(source)
    local xr, yr, zr = getElementRotation(source)
    px, py, pz = getElementPosition(source)
    prot = getPedRotation(source)
    local offsetRot = math.rad(prot + 90)
    local vx = px + 1 * math.cos(offsetRot)
    local vy = py + 1 * math.sin(offsetRot)
    local vz = pz + 2
    local vrot = prot + 90
    tent = createObject(983, vx, vy, pz, xr, yr, vrot)
    setObjectScale(tent, 1)
    tentCol = createColSphere(x, y, z, 2)
    attachElements(tentCol, tent, 0, 0, 0)
    setElementData(tentCol, "parent", tent)
    setElementData(tent, "parent", tentCol)
    setElementData(tentCol, "wirefence", true)
    triggerClientEvent(source, "refreshInventoryManual", source)
  end, 1500, 1)
end
addEvent("onPlayerBuildAWireFence", true)
addEventHandler("onPlayerBuildAWireFence", getRootElement(), onPlayerBuildAWireFence)
function removeWirefence(object)
  destroyElement(getElementData(object, "parent"))
  destroyElement(object)
end
addEvent("removeWirefence", true)
addEventHandler("removeWirefence", getRootElement(), removeWirefence)
function removeTent(object)
  local x, y, z = getElementPosition(getElementData(object, "parent"))
  local item, itemString = getItemTablePosition("Tent")
  local itemPickup = createItemPickup(item, x, y, z + 1, itemString)
  destroyElement(getElementData(object, "parent"))
  destroyElement(object)
end
addEvent("removeTent", true)
addEventHandler("removeTent", getRootElement(), removeTent)
function addPlayerCookMeat()
  local playersource = source
  setPedAnimation(playersource, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  local meat = getElementData(playersource, "Raw Meat")
  setTimer(function()
    setElementData(playersource, "Raw Meat", 0)
    setElementData(playersource, "Cooked Meat", getElementData(playersource, "Cooked Meat") + meat)
    triggerClientEvent(playersource, "displayClientInfo", playersource, "Fireplace", "You cooked " .. meat .. " Raw Meat.", 22, 255, 0)
  end, 5000, 1)
end
addEvent("addPlayerCookMeat", true)
addEventHandler("addPlayerCookMeat", getRootElement(), addPlayerCookMeat)
function onPlayerMakeAFire(itemName)
  setElementData(source, "Wood", getElementData(source, "Wood") - 1)
  local x, y, z = getElementPosition(source)
  local xr, yr, zr = getElementRotation(source)
  px, py, pz = getElementPosition(source)
  prot = getPedRotation(source)
  local offsetRot = math.rad(prot + 90)
  local vx = px + 1 * math.cos(offsetRot)
  local vy = py + 1 * math.sin(offsetRot)
  local vz = pz + 2
  local vrot = prot + 90
  local wood = createObject(1463, vx, vy, pz - 0.75, xr, yr, vrot)
  setObjectScale(wood, 0.55)
  setElementCollisionsEnabled(wood, false)
  setElementFrozen(wood, true)
  local fire = createObject(3525, vx, vy, pz - 0.75, xr, yr, vrot)
  setObjectScale(fire, 0)
  local fireCol = createColSphere(x, y, z, 2)
  setElementData(fireCol, "parent", wood)
  setElementData(wood, "parent", fireCol)
  setElementData(fireCol, "fireplace", true)
  triggerClientEvent(source, "refreshInventoryManual", source)
  setPedAnimation(playersource, "BOMBER", "BOM_Plant", nil, false, false, nil, false)
  setTimer(function()
    destroyElement(fireCol)
    destroyElement(fire)
    destroyElement(wood)
  end, 120000, 1)
end
addEvent("onPlayerMakeAFire", true)
addEventHandler("onPlayerMakeAFire", getRootElement(), onPlayerMakeAFire)
function onPlayerPlaceRoadflare(itemName)
  setElementData(source, itemName, getElementData(source, itemName) - 1)
  local x, y, z = getElementPosition(source)
  local object = createObject(354, x, y, z - 0.6)
  setTimer(destroyElement, 300000, 1, object)
  triggerClientEvent(source, "refreshInventoryManual", source)
end
addEvent("onPlayerPlaceRoadflare", true)
addEventHandler("onPlayerPlaceRoadflare", getRootElement(), onPlayerPlaceRoadflare)

function math.round(number, decimals, method)
  decimals = decimals or 0
  local factor = 10 ^ decimals
  if method == "ceil" or method == "floor" then
    return math[method](number * factor) / factor
  else
    return tonumber(string.format("%." .. (decimals or 0) .. "f", number))
  end
end
local chatRadius = 15
local chatEadioRadius = 250
function sendMessageToNearbyPlayers(message, messageType)
  cancelEvent()
  if messageType == 0 then
    local posX, posY, posZ = getElementPosition(source)
    local chatSphere = createColSphere(posX, posY, posZ, chatRadius)
    local nearbyPlayers = getElementsWithinColShape(chatSphere, "player")
    destroyElement(chatSphere)
    for index, nearbyPlayer in ipairs(nearbyPlayers) do
      outputChatBox("[LOCAL]" .. string.gsub(getPlayerName(source) .. " : " .. message, "#%x%x%x%x%x%x", ""), nearbyPlayer, 60, 200, 40, true)
    end
  end
end
addEventHandler("onPlayerChat", getRootElement(), sendMessageToNearbyPlayers)
function playerRadioChat(playersource, cmd, ...)
  if cmd == "radiochat" then
    local msg2 = table.concat({
      ...
    }, " ")
    if (getElementData(playersource, "Radio Device") or 0) <= 0 then
      outputChatBox("You got no Radio Device.", playersource)
      return
    end
    local posX, posY, posZ = getElementPosition(playersource)
    local chatSphere = createColSphere(posX, posY, posZ, chatEadioRadius)
    local nearbyPlayers = getElementsWithinColShape(chatSphere, "player")
    destroyElement(chatSphere)
    for index, nearbyPlayer in ipairs(nearbyPlayers) do
      if getElementData(nearbyPlayer, "Radio Device") > 0 then
        outputChatBox("[RADIO DEVICE]" .. string.gsub(getPlayerName(playersource) .. " : " .. msg2, "#%x%x%x%x%x%x", ""), nearbyPlayer, 60, 200, 40, true)
      end
    end
  end
end
addCommandHandler("radiochat", playerRadioChat)
function blockChatMessage(m, mt)
  if mt == 1 then
    cancelEvent()
  end
end
addEventHandler("onPlayerChat", getRootElement(), blockChatMessage)
function checkBandit()
  for i, player in ipairs(getElementsByType("player")) do
    if getElementData(player, "logedin") then
      local current = getElementData(player, "skin")
      if getElementData(player, "bandit") then
        if current == 179 or current == 287 then
          setElementModel(player, 288)
        elseif current == 73 then
          setElementModel(player, 180)
        end
      elseif getElementData(player, "humanity") == 5000 then
        if current == 73 or current == 179 or current == 287 then
          setElementModel(player, 210)
        end
      else
        setElementModel(player, getElementData(player, "skin"))
      end
    end
  end
end
setTimer(checkBandit, 20000, 0)
local infoTimer = 240000
function outputInfo1()
  for i, player in ipairs(getElementsByType("player")) do
    triggerClientEvent(player, "displayClientInfo", player, "Info", "To accept any options in the menu on the left press 'middle mouse'", 200, 200, 22)
  end
  setTimer(outputInfo2, infoTimer, 1)
end
setTimer(outputInfo1, infoTimer, 1)
function outputInfo2()
  for i, player in ipairs(getElementsByType("player")) do
    triggerClientEvent(player, "displayClientInfo", player, "Info", "Press 'o' to open the Support chat, hide youself first", 200, 200, 22)
  end
  setTimer(outputInfo3, infoTimer, 1)
end
function outputInfo3()
  for i, player in ipairs(getElementsByType("player")) do
    triggerClientEvent(player, "displayClientInfo", player, "Info", "Visit the GTA:SA DayZ Website dayz-mta.net", 200, 200, 22)
  end
  setTimer(outputInfo4, infoTimer, 1)
end
function outputInfo4()
  for i, player in ipairs(getElementsByType("player")) do
    triggerClientEvent(player, "displayClientInfo", player, "Info", "You can enable/disable the 'Debugmonitor' using F5", 200, 200, 22)
  end
  setTimer(outputInfo5, infoTimer, 1)
end
function outputInfo5()
  for i, player in ipairs(getElementsByType("player")) do
    triggerClientEvent(player, "displayClientInfo", player, "Info", "DayZ Team Member online: " .. getTeamMemberOnline(), 200, 200, 22)
  end
  setTimer(outputInfo1, infoTimer, 1)
end
function getTeamMemberOnline()
  theTableMembersOnline = ""
  for i, player in ipairs(getElementsByType("player")) do
    local account = getPlayerAccount(player)
    if not isGuestAccount(account) and (getElementData(player, "supporter") or getElementData(player, "admin")) then
      theTableMembersOnline = theTableMembersOnline .. "," .. getPlayerName(player)
    end
  end
  if theTableMembersOnline == "" then
    return "None"
  else
    return theTableMembersOnline
  end
end
function getPlayerWildcard(namePart)
  namePart = string.lower(namePart)
  local bestaccuracy = 0
  local foundPlayer, b, e
  for _, player in ipairs(getElementsByType("player")) do
    b, e = string.find(string.lower(string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")), namePart)
    if b and e and bestaccuracy < e - b then
      bestaccuracy = e - b
      foundPlayer = player
    end
  end
  if foundPlayer then
    return foundPlayer
  else
    return false
  end
end
function setGroup(playersource, command, teamName, targetString)
  if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")) then
    do
      local foundTargetPlayer = getPlayerWildcard(targetString)
      if foundTargetPlayer then
        if teamName ~= "admin" and teamName ~= "supporter" then
          if teamName == "remove" then
          else
            outputChatBox("#FFFFFFTeam not found. ", playersource, 27, 89, 224, true)
            return
          end
        end
        if teamName == "remove" then
          value = false
          account = getPlayerAccount(foundTargetPlayer)
          setAccountData(account, "admin", value)
          setAccountData(account, "supporter", value)
          setElementData(foundTargetPlayer, "admin", value)
          setElementData(foundTargetPlayer, "supporter", value)
        else
          value = true
        end
        account = getPlayerAccount(foundTargetPlayer)
        accountname = getAccountName(account)
        setAccountData(account, teamName, value)
        setElementData(foundTargetPlayer, teamName, value)
        if value == true then
          outputChatBox("#FFFFFF" .. getPlayerName(foundTargetPlayer) .. " #FF0000 is now a " .. teamName, getRootElement(), 27, 89, 224, true)
        else
          outputChatBox("#FFFFFF" .. getPlayerName(foundTargetPlayer) .. " #FF0000 was removed from his jobs.", getRootElement(), 27, 89, 224, true)
        end
      else
        outputChatBox("#FFFFFFTarget not found. ", playersource, 27, 89, 224, true)
      end
    end
  else
    outputChatBox("#FFFFFFYou are not Admin. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("add", setGroup)
function banPLayer(playersource, command, targetString, banTime, reason)
  if getAccountData(getPlayerAccount(playersource), "admin") == true then
    do
      local foundTargetPlayer = getPlayerWildcard(targetString)
      local banTime = banTime or 0
      local reason = reason or "Unknown"
      if foundTargetPlayer then
        do
          local account = getPlayerAccount()
          local ip = getPlayerIP(foundTargetPlayer)
          local serial = getPlayerSerial(foundTargetPlayer)
          local name = getPlayerName(foundTargetPlayer)
          kickPlayer(foundTargetPlayer, playersource, reason)
          addBan(ip, name, serial, playersource, reason, banTime * 86400)
          outputChatBox("#FFFFFF" .. name .. " #FF0000 was banned for " .. banTime .. " Day(Z)'s.", getRootElement(), 27, 89, 224, true)
        end
      else
        outputChatBox("#FFFFFFTarget not found. ", playersource, 27, 89, 224, true)
      end
    end
  else
    outputChatBox("#FFFFFFYou are not Admin. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("playerban", banPLayer)
function pmsgAdmin(playersource, command, ...)
  local msg = table.concat({
    ...
  }, " ")
  if getAccountData(getPlayerAccount(playersource), "admin") == true then
    outputChatBox("[NOTICE]" .. getPlayerName(playersource) .. ": " .. msg, getRootElement(), 60, 200, 40, true)
  else
    outputChatBox("#FFFFFFYou are not Admin. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("pmsg", pmsgAdmin)
botSupportTable = {
  {
    "website",
    "what",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "website",
    "where",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "website",
    "which",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "website",
    "how",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "website",
    "got",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "website",
    "know",
    "",
    "you can find the website under 'dayz-mta.net'.",
    "",
    "James"
  },
  {
    "hey",
    "james",
    "",
    "Hey.",
    "",
    "James"
  },
  {
    "hey",
    "paul",
    "",
    "Hey.",
    "",
    "Paul"
  },
  {
    "hey",
    "sandra",
    "",
    "Hey.",
    "",
    "Sandra"
  },
  {
    "how are",
    "you",
    "james",
    "I'm a Computer, so yes I'm fine.",
    "",
    "James"
  },
  {
    "how are",
    "you",
    "paul",
    "I'm a Computer, so yes I'm fine.",
    "",
    "Paul"
  },
  {
    "how are",
    "you",
    "sandra",
    "I'm a Computer, so yes I'm fine.",
    "",
    "Sandra"
  },
  {
    "i love",
    "you",
    "sandra",
    "thank you, i love you too.",
    "thank you :*",
    "Sandra"
  },
  {
    "thank",
    "you",
    "james",
    "thats my job.",
    "",
    "James"
  },
  {
    "thank",
    "paul",
    "you",
    "thats my job.",
    "",
    "Paul"
  },
  {
    "thank",
    "sandra",
    "you",
    "thats my job.",
    "",
    "Sandra"
  },
  {
    "how",
    "use",
    "map",
    "you can use the Map with F11.",
    "",
    "James"
  },
  {
    "how",
    "use",
    "gps",
    "the GPS is the standart GTA Radar in the left bottom.",
    "",
    "James"
  },
  {
    "how",
    "take",
    "items",
    "you can press the 'middle mouse' to take Items or use any other things in the Menu.",
    "",
    "James"
  },
  {
    "how",
    "open",
    "inven",
    "press J to open it.",
    "",
    "James"
  },
  {
    "drop",
    "item",
    "",
    "press J to open inventory, select your item and press the arrow to the left.",
    "",
    "Paul"
  },
  {
    "fuel",
    "car",
    "how",
    "you need a Patrol Canister, you can fill it at a gas station.",
    "",
    "Sandra"
  },
  {
    "pick",
    "items",
    "how",
    "press middlemousebutton when your item is standing in the left of your screen.",
    "",
    "Sandra"
  },
  {
    "fence",
    "wire",
    "destory",
    "you need a toolbox to destroy it.",
    "",
    "James"
  },
  {
    "register",
    "how",
    "to",
    "you need to fill in your name and password and press Register, if it doesnt work reconnect.",
    "",
    "James"
  },
  {
    "bugged",
    "stuck",
    "help",
    "wait till a admin contacts you.",
    "",
    "Sandra"
  },
  {
    "radio",
    "chat",
    "",
    "press z to chat with the radio device.",
    "",
    "James"
  }
}
function botCheck(text, player)
  for i, data in ipairs(botSupportTable) do
    if string.find(text:lower(), data[1]:lower(), 1, true) and string.find(text:lower(), data[2]:lower(), 1, true) and string.find(text:lower(), data[3]:lower(), 1, true) then
      answere = data[4]
      if data[5] ~= "" then
        local randomNumber = math.random(4, 5)
        answere = data[randomNumber]
      end
      setTimer(onServerSupportChatMessage, math.random(3000, 6000), 1, data[6], string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "") .. ", " .. answere)
    end
  end
end
function onServerSupportChatMessage(player2, text)
  notGoOn = false
  mutedmessage = false
  for i, player in ipairs(getElementsByType("player")) do
    if player2 == "Sandra" or player2 == "James" or player2 == "Paul" then
      triggerClientEvent(player, "onSupportChatMessage", player, player2, text)
      notGoOn = true
    elseif (getElementData(player, "supporter") or getElementData(player, "admin")) and not getElementData(player2, "admin") and not getElementData(player2, "supporter") and not isPlayerMuted(player2) then
      outputChatBox("#2200ddNew Support Message from " .. getPlayerName(player2), player, 255, 255, 255, true)
    end
    if not notGoOn then
      if not isPlayerMuted(player2) then
        triggerClientEvent(player, "onSupportChatMessage", player, player2, text)
      else
        mutedmessage = true
      end
    end
  end
  if not notGoOn then
    botCheck(text, player2)
  end
  if mutedmessage then
    outputChatBox("#2200ddYou are Muted", player2, 255, 255, 255, true)
  end
end
addEvent("onServerSupportChatMessage", true)
addEventHandler("onServerSupportChatMessage", getRootElement(), onServerSupportChatMessage)
setWeaponProperty("m4", "poor", "maximum_clip_ammo", 30)
setWeaponProperty("m4", "std", "maximum_clip_ammo", 30)
setWeaponProperty("m4", "pro", "maximum_clip_ammo", 30)
function kickPLayer(playersource, command, targetString, banTime, reason)
  if getAccountData(getPlayerAccount(playersource), "admin") == true then
    for i, player in ipairs(getElementsByType("player")) do
      if player ~= playersource then
        kickPlayer(player, "Server Script Restart, #Hotfix")
      end
    end
  else
    outputChatBox("#FFFFFFYou are not Admin. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("kickplayer", banPLayer)
function kickAll(playersource, command, reason)
  if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")) then
    for i, player in ipairs(getElementsByType("player")) do
      if player == playersource then
        break
      end
      kickPlayer(player, reason)
    end
  else
    outputChatBox("#FFFFFFYou are not Admin. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("kickall", kickAll)
local supporterMode = {}
local foodd = {}
local thirstt = {}
function Supportermode(playersource, command)
  if getAccountData(getPlayerAccount(playersource), "supporter") == true then
    if not supporterMode[playersource] then
      -- unhandled boolean indicator
    else
    end
    supporterMode[playersource] = true
    if supporterMode[playersource] then
      setElementAlpha(playersource, 0)
      setElementFrozen(playersource, true)
      foodd[playersource] = getElementData(playersource, "food")
      thirstt[playersource] = getElementData(playersource, "thirst")
    else
      setElementAlpha(playersource, 255)
      setElementFrozen(playersource, false)
    end
  else
    outputChatBox("#FFFFFFYou are not a Supporter. ", playersource, 27, 89, 224, true)
  end
end
addCommandHandler("supportmode", Supportermode)
function StatsSupportermode()
  for i, player in ipairs(getElementsByType("player")) do
    if supporterMode[player] then
      setElementData(player, "food", foodd[player])
      setElementData(player, "thirst", thirstt[player])
    end
  end
end
setTimer(StatsSupportermode, 60000, 0)
function preventCommandSpam(commandName)
  if commandName == "login" or commandName == "logout" then
    cancelEvent()
  end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)
function kickPlayerOnHighPing()
  outputChatBox(getPlayerName(source) .. " was kicked, highping.", getRootElement(), 27, 89, 224, true)
  kickPlayer(source, "Your Ping was straight to high.")
end
addEvent("kickPlayerOnHighPing", true)
addEventHandler("kickPlayerOnHighPing", getRootElement(), kickPlayerOnHighPing)
local handsUp = false
local siting = false
function funcBindHandsup(player, key, keyState)
  if handsup then
    setPedAnimation(player, false)
    handsUp = false
  else
    setPedAnimation(player, "BEACH", "ParkSit_M_loop", nil, true, false, false, false)
    handsUp = true
  end
end
function funcBindSit(player, key, keyState)
  if siting then
    setPedAnimation(player, false)
    siting = false
  else
    setPedAnimation(player, "SHOP", "SHP_Rob_HandsUp", nil, true, false, false, false)
    siting = true
  end
end
function bindTheKeys()
  bindKey(source, ",", "down", funcBindHandsup)
  bindKey(source, ".", "down", funcBindSit)
end
addEventHandler("onPlayerLogin", getRootElement(), bindTheKeys)
