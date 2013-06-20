function cheackResourceRequirements(res)
  local reason = false
  if not string.find(getServerName(), "GTA:SA DayZ Version") then
    reason = "Servername incorrect prefix #2"
  end
  if not string.find(getServerName(), "| dayz-mta.net |", 0, true) then
    reason = "Servername incorrect prefix #1"
  end
  if getMaxPlayers() > 77 then
    reason = "To much Slots."
  end
  if getResourceName(getThisResource()) == "DayZ" then
  else
    reason = "Resource name does not match."
  end
  if reason ~= false then
    outputServerLog("Resource " .. getResourceName(res) .. " wasn't started (" .. reason .. ").")
    outputChatBox("Resource " .. getResourceName(res) .. " wasn't started (" .. reason .. ").", getRootElement(), 255, 255, 255)
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), cheackResourceRequirements)
function checkPlayerSlots()
  if getMaxPlayers() > 77 then
    stopResource(getResourceFromName("DayZ"))
  end
end
setTimer(checkPlayerSlots, 10000, 4)
local itemTable = {
  farm = {
    {
      "Wood",
      1463,
      0.4,
      0,
      13
    },
    {
      "Bandage",
      1578,
      0.5,
      0,
      4
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      9
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      5
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      6
    },
    {
      "Burger",
      2768,
      1,
      0,
      2
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      5
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      5
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      8
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      7
    },
    {
      "Knife",
      335,
      1,
      90,
      4
    },
    {
      "Lighter",
      328,
      0.4,
      90,
      4
    },
    {
      "Desert Eagle",
      348,
      1,
      90,
      2
    },
    {
      "Morphine",
      1579,
      1,
      0,
      4
    },
    {
      "Tent",
      1279,
      1,
      0,
      0.5
    },
    {
      "Pistol",
      346,
      1,
      90,
      3
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      3.5
    },
    {
      "Country Rifle",
      357,
      1,
      90,
      3
    },
    {
      "Shotgun",
      349,
      1,
      90,
      3
    },
    {
      "Tire",
      1073,
      1,
      0,
      2
    },
    {
      "Civilian Skin",
      1241,
      2,
      0,
      2.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      3
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    }
  },
  residential = {
    {
      "Lighter",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood",
      1463,
      0.4,
      0,
      5
    },
    {
      "Pistol",
      346,
      1,
      90,
      4
    },
    {
      "Silenced Pistol",
      347,
      1,
      90,
      4
    },
    {
      "Shotgun",
      349,
      1,
      90,
      4
    },
    {
      "Uzi",
      352,
      1,
      90,
      3
    },
    {
      "Knife",
      335,
      1,
      90,
      5
    },
    {
      "Katana",
      339,
      1,
      90,
      3
    },
    {
      "Pizza",
      1582,
      1,
      0,
      5
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      5
    },
    {
      "Roadflare",
      324,
      1,
      90,
      9
    },
    {
      "Milk",
      2856,
      1,
      0,
      5
    },
    {
      "Small Backpack",
      3026,
      1,
      0,
      6
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "Grenade",
      342,
      1,
      0,
      0.5
    },
    {
      "Desert Eagle",
      348,
      1,
      90,
      2
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      2
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      1
    },
    {
      "MP5",
      353,
      1,
      90,
      1
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Country Rifle",
      357,
      1,
      90,
      1.5
    },
    {
      "Alice Backpack",
      1248,
      1,
      0,
      1.5
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Skin",
      1241,
      2,
      0,
      3.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      4
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      4
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      5
    },
    {
      "TEC-9",
      372,
      1,
      90,
      2
    },
    {
      "Burger",
      2768,
      1,
      0,
      2
    }
  },
  military = {
    {
      "Lighter",
      328,
      0.4,
      90,
      2
    },
    {
      "Pistol",
      346,
      1,
      90,
      10
    },
    {
      "Silenced Pistol",
      347,
      1,
      90,
      3
    },
    {
      "Shotgun",
      349,
      1,
      90,
      4
    },
    {
      "Uzi",
      352,
      1,
      90,
      5.5
    },
    {
      "Knife",
      335,
      1,
      90,
      4
    },
    {
      "Katana",
      339,
      1,
      90,
      3
    },
    {
      "Pizza",
      1582,
      1,
      0,
      2
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      2
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      2
    },
    {
      "Roadflare",
      324,
      1,
      90,
      2
    },
    {
      "Milk",
      2856,
      1,
      0,
      1
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      4
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      2
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      3
    },
    {
      "Grenade",
      342,
      1,
      0,
      4
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      3.5
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      2
    },
    {
      "MP5",
      353,
      1,
      90,
      4
    },
    {
      "Watch",
      2710,
      1,
      0,
      4
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      3
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Country Rifle",
      357,
      1,
      90,
      3
    },
    {
      "Alice Backpack",
      1248,
      1,
      0,
      4
    },
    {
      "Night Vision Goggles",
      368,
      1,
      90,
      1.5
    },
    {
      "Tire",
      1073,
      1,
      0,
      2
    },
    {
      "Morphine",
      1579,
      1,
      0,
      4
    },
    {
      "Army Skin",
      1247,
      2,
      0,
      4.5
    },
    {
      "Civilian Skin",
      1241,
      2,
      0,
      3
    },
    {
      "TEC-9",
      372,
      1,
      90,
      3
    },
    {
      "AK-47",
      355,
      1,
      90,
      3.5
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      3
    },
    {
      "Map",
      1277,
      0.8,
      90,
      7
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      1
    },
    {
      "Engine",
      929,
      0.3,
      0,
      2
    },
    {
      "Tent",
      1279,
      1,
      0,
      4.5
    },
    {
      "Sniper Skin",
      1213,
      2,
      0,
      1.5
    },
    {
      "M4",
      356,
      1,
      90,
      1
    },
    {
      "Sniper Rifle",
      358,
      1,
      90,
      1.5
    },
    {
      "Infrared Goggles",
      369,
      1,
      90,
      3
    },
    {
      "Small Backpack",
      3026,
      1,
      0,
      5
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      2
    }
  },
  industrial = {
    {
      "Wire Fence",
      933,
      0.25,
      0,
      7
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      3
    },
    {
      "Tire",
      1073,
      1,
      0,
      4
    },
    {
      "Engine",
      929,
      0.3,
      0,
      3.5
    },
    {
      "Shotgun",
      349,
      1,
      90,
      2
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      4
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      4
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      5
    },
    {
      "Burger",
      2768,
      1,
      0,
      2
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      3
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      3
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      4
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      6
    },
    {
      "Full Patrol Canister",
      1650,
      1,
      0,
      1.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      1
    },
    {
      "Watch",
      2710,
      1,
      0,
      2
    },
    {
      "Lighter",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood",
      1463,
      0.4,
      0,
      2
    },
    {
      "Pistol",
      346,
      1,
      90,
      2
    },
    {
      "Shotgun",
      349,
      1,
      90,
      3
    },
    {
      "Uzi",
      352,
      1,
      90,
      3
    },
    {
      "Knife",
      335,
      1,
      90,
      3
    },
    {
      "Katana",
      339,
      1,
      90,
      3
    },
    {
      "Pizza",
      1582,
      1,
      0,
      3
    },
    {
      "Roadflare",
      324,
      1,
      90,
      5
    },
    {
      "Milk",
      2856,
      1,
      0,
      5
    },
    {
      "Small Backpack",
      3026,
      1,
      0,
      6
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      1
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    }
  },
  supermarket = {
    {
      "Raw Meat",
      2804,
      0.5,
      90,
      1
    },
    {
      "Lighter",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood",
      1463,
      0.4,
      0,
      5
    },
    {
      "Pistol",
      346,
      1,
      90,
      3.5
    },
    {
      "Uzi",
      352,
      1,
      90,
      2
    },
    {
      "Knife",
      335,
      1,
      90,
      7
    },
    {
      "Katana",
      339,
      1,
      90,
      3
    },
    {
      "Pizza",
      1582,
      1,
      0,
      7
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      5
    },
    {
      "Roadflare",
      324,
      1,
      90,
      6
    },
    {
      "Milk",
      2856,
      1,
      0,
      5
    },
    {
      "Small Backpack",
      3026,
      1,
      0,
      6
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      7
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      8
    },
    {
      "Burger",
      2768,
      1,
      0,
      7
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "MP5",
      353,
      1,
      90,
      1
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Country Rifle",
      357,
      1,
      90,
      2
    },
    {
      "Alice Backpack",
      1248,
      1,
      0,
      1.5
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Skin",
      1241,
      2,
      0,
      3.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      4
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    }
  },
  other = {
    {
      "Raw Meat",
      2804,
      0.5,
      90
    },
    {
      "Cooked Meat",
      2806,
      0.5,
      90
    },
    {
      "Full Patrol Canister",
      1650,
      1,
      0
    },
    {
      "Empty Water Bottle",
      2683,
      1,
      0
    },
    {
      "Standart Skin",
      1577,
      2,
      0
    },
    {
      "Night Vision Goggles",
      368,
      1,
      90
    },
    {
      "Infrared Goggles",
      369,
      1,
      90
    },
    {
      "Shotgun Ammo",
      2358,
      2,
      0
    },
    {
      "Assault Ammo",
      1271,
      2,
      0
    },
    {
      "Pistol Ammo",
      3013,
      2,
      0
    },
    {
      "Rocket Ammo",
      3082,
      0.7,
      90
    },
    {
      "Sniper Ammo",
      2358,
      2,
      0
    },
    {
      "Smg Ammo",
      2041,
      2,
      0
    },
    {
      "Lighter",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood",
      1463,
      0.4,
      0,
      5
    },
    {
      "Pistol",
      346,
      1,
      90,
      3.5
    },
    {
      "Uzi",
      352,
      1,
      90,
      2
    },
    {
      "Knife",
      335,
      1,
      90,
      7
    },
    {
      "Katana",
      339,
      1,
      90,
      3
    },
    {
      "Pizza",
      1582,
      1,
      0,
      7
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Patrol Canister",
      1650,
      1,
      0,
      5
    },
    {
      "Roadflare",
      324,
      1,
      90,
      6
    },
    {
      "Milk",
      2856,
      1,
      0,
      5
    },
    {
      "Small Backpack",
      3026,
      1,
      0,
      6
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "MP5",
      353,
      1,
      90,
      1
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Country Rifle",
      357,
      1,
      90,
      2
    },
    {
      "Alice Backpack",
      1248,
      1,
      0,
      1.5
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      1.5
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Skin",
      1241,
      2,
      0,
      3.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      4
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      3
    },
    {
      "Engine",
      929,
      0.3,
      0,
      3.5
    },
    {
      "Shotgun",
      349,
      1,
      90,
      3
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      4
    },
    {
      "Silenced Pistol",
      347,
      1,
      90,
      7
    },
    {
      "Grenade",
      342,
      1,
      0,
      4
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      5
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      4
    },
    {
      "Army Skin",
      1247,
      2,
      0,
      4.5
    },
    {
      "TEC-9",
      372,
      1,
      90,
      4
    },
    {
      "AK-47",
      355,
      1,
      90,
      7
    },
    {
      "Rocket Launcher",
      359,
      1,
      90,
      1
    },
    {
      "Sniper Skin",
      1213,
      2,
      0,
      1.5
    },
    {
      "M4",
      356,
      1,
      90,
      1
    },
    {
      "Sniper Rifle",
      358,
      1,
      90,
      1.5
    },
    {
      "Heat-Seeking RPG",
      360,
      1,
      90,
      3
    },
    {
      "Bandage",
      1578,
      0.5,
      0,
      4
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      5
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      6
    },
    {
      "Burger",
      2768,
      1,
      0,
      2
    },
    {
      "Tent",
      1279,
      1,
      0,
      0.5
    },
    {
      "Pistol",
      346,
      1,
      90,
      3
    },
    {
      "Desert Eagle",
      348,
      1,
      90,
      3
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    },
    {
      "Medic Kit",
      2891,
      2.2,
      0
    },
    {
      "Blood Bag",
      1580,
      1,
      0
    },
    {
      "Radio Device",
      2966,
      0.5,
      0,
      5
    },
    {
      "Radio Amplifier",
      330,
      1,
      0,
      6
    }
  }
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
function createItemPickup(item, x, y, z, tableStringName)
  if item and x and y and z then
    do
      local object = createObject(itemTable[tostring(tableStringName)][item][2], x, y, z - 0.875, itemTable[tostring(tableStringName)][item][4], 0, math.random(0, 360))
      setObjectScale(object, itemTable[tostring(tableStringName)][item][3])
      setElementCollisionsEnabled(object, false)
      setElementFrozen(object, true)
      local col = createColSphere(x, y, z, 0.75)
      setElementData(col, "item", itemTable[tostring(tableStringName)][item][1])
      setElementData(col, "parent", object)
      setTimer(function()
        if isElement(col) then
          destroyElement(col)
          destroyElement(object)
        end
      end, 900000, 1)
      return object
    end
  end
end
function table.size(tab)
  local length = 0
  for _ in pairs(tab) do
    length = length + 1
  end
  return length
end
function math.percentChance(percent, repeatTime)
  local hits = 0
  for i = 1, repeatTime do
    local number = math.random(0, 200) / 2
    if percent >= number then
      hits = hits + 1
    end
  end
  return hits
end
function createItemLoot(lootPlace, x, y, z, id)
  col = createColSphere(x, y, z, 1.25)
  setElementData(col, "itemloot", true)
  setElementData(col, "parent", lootPlace)
  setElementData(col, "MAX_Slots", 12)
  for i, item in ipairs(itemTable[lootPlace]) do
    local value = math.percentChance(item[5], math.random(1, 2))
    setElementData(col, item[1], value)
    local ammoData, weapID = getWeaponAmmoType(item[1], true)
    if ammoData and value > 0 then
      setElementData(col, ammoData, math.random(1, 2))
    end
  end
  refreshItemLoot(col, lootPlace)
  return col
end
function refreshItemLoot(col, place)
  local objects = getElementData(col, "objectsINloot")
  if objects then
    if objects[1] ~= nil then
      destroyElement(objects[1])
    end
    if objects[2] ~= nil then
      destroyElement(objects[2])
    end
    if objects[3] ~= nil then
      destroyElement(objects[3])
    end
  end
  local counter = 0
  local obejctItem = {}
  for i, item in ipairs(itemTable.other) do
    if getElementData(col, item[1]) and getElementData(col, item[1]) > 0 then
      if counter == 3 then
        break
      end
      counter = counter + 1
      local x, y, z = getElementPosition(col)
      obejctItem[counter] = createObject(item[2], x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, item[4])
      setObjectScale(obejctItem[counter], item[3])
      setElementCollisionsEnabled(obejctItem[counter], false)
      setElementFrozen(obejctItem[counter], true)
    end
  end
  if obejctItem[1] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[1] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[1], 0)
    setElementCollisionsEnabled(obejctItem[1], false)
    setElementFrozen(obejctItem[1], true)
  end
  if obejctItem[2] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[2] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[2], 0)
    setElementCollisionsEnabled(obejctItem[2], false)
    setElementFrozen(obejctItem[2], true)
  end
  if obejctItem[3] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[3] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[3], 0)
    setElementCollisionsEnabled(obejctItem[3], false)
    setElementFrozen(obejctItem[3], true)
  end
  setElementData(col, "objectsINloot", {
    obejctItem[1],
    obejctItem[2],
    obejctItem[3]
  })
end
addEvent("refreshItemLoot", true)
addEventHandler("refreshItemLoot", getRootElement(), refreshItemLoot)
function createPickupsOnServerStart()
  iPickup = 0
  for i, pos in ipairs(pickupPositions.residential) do
    iPickup = iPickup + 1
    createItemLoot("residential", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart2, 5000, 1)
end
function createPickupsOnServerStart2()
  for i, pos in ipairs(pickupPositions.industrial) do
    iPickup = iPickup + 1
    createItemLoot("industrial", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart3, 5000, 1)
end
function createPickupsOnServerStart3()
  for i, pos in ipairs(pickupPositions.farm) do
    iPickup = iPickup + 1
    createItemLoot("farm", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart4, 5000, 1)
end
function createPickupsOnServerStart4()
  for i, pos in ipairs(pickupPositions.supermarket) do
    iPickup = iPickup + 1
    createItemLoot("supermarket", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart5, 5000, 1)
end
function createPickupsOnServerStart5()
  for i, pos in ipairs(pickupPositions.military) do
    iPickup = iPickup + 1
    createItemLoot("military", pos[1], pos[2], pos[3], iPickup)
  end
end
createPickupsOnServerStart()
vehicleFuelTable = {
  {422, 80},
  {470, 100},
  {468, 30},
  {433, 140},
  {437, 140},
  {509, 0},
  {487, 60},
  {497, 60},
  {453, 60}
}
function getVehicleMaxFuel(loot)
  local modelID = getElementModel(getElementData(loot, "parent"))
  for i, vehicle in ipairs(vehicleFuelTable) do
    if modelID == vehicle[1] then
      return vehicle[2]
    end
  end
  return false
end
function onPlayerTakeItemFromGround(itemName, col)
  itemPlus = 1
  if itemName == "Pistol Ammo" then
    itemPlus = 17
  elseif itemName == "Smg Ammo" then
    itemPlus = 40
  elseif itemName == "Assault Ammo" then
    itemPlus = 30
  elseif itemName == "Sniper Ammo" then
    itemPlus = 10
  elseif itemName == "Shotgun Ammo" then
    itemPlus = 7
  elseif itemName == "M4" or itemName == "AK-47" or itemName == "Sniper Rifle" or itemName == "Shotgun" or itemName == "SPAZ-12 Combat Shotgun" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "Rocket Launcher" or itemName == "Country Rifle" then
    removeBackWeaponOnDrop()
  end
  local x, y, z = getElementPosition(source)
  local id, ItemType = getItemTablePosition(itemName)
  setElementData(source, itemName, (getElementData(source, itemName) or 0) + itemPlus)
  destroyElement(getElementData(col, "parent"))
  destroyElement(col)
end
addEvent("onPlayerTakeItemFromGround", true)
addEventHandler("onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround)
function onPlayerChangeLoot(loot)
  local players = getElementsWithinColShape(loot, "player")
  for theKey, player in ipairs(players) do
    triggerClientEvent(player, "refreshLootManual", player, loot)
  end
end
addEvent("onPlayerChangeLoot", true)
addEventHandler("onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot)
function playerDropAItem(itemName)
  local x, y, z = getElementPosition(source)
  local item, itemString = getItemTablePosition(itemName)
  local itemPickup = createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
end
addEvent("playerDropAItem", true)
addEventHandler("playerDropAItem", getRootElement(), playerDropAItem)
function getItemTablePosition(itema)
  for id, item in ipairs(itemTable[tostring("other")]) do
    if itema == item[1] then
      return id, "other"
    end
  end
  return item, itemString
end
function refreshItemLoots()
  outputChatBox("#ffaa00ATTENTION #ffffff - #aaff0a Item spawnpoints will be refreshed, causing server lag.", getRootElement(), 255, 255, 255, true)
  for i, loots in ipairs(getElementsByType("colshape")) do
    local itemloot = getElementData(loots, "itemloot")
    if itemloot then
      local objects = getElementData(loots, "objectsINloot")
      if objects then
        if objects[1] ~= nil then
          destroyElement(objects[1])
        end
        if objects[2] ~= nil then
          destroyElement(objects[2])
        end
        if objects[3] ~= nil then
          destroyElement(objects[3])
        end
      end
      destroyElement(loots)
    end
  end
  createPickupsOnServerStart()
  setTimer(refreshItemLootPoints, 14400000, 1)
end
function refreshItemLootPoints()
  local time = getRealTime()
  local hour = time.hour
  outputChatBox("#ff2200ATTENTION #ffffff - #22ff0a Item spawnpoints will be refreshed in 1 minute, causing server lag.", getRootElement(), 255, 255, 255, true)
  setTimer(refreshItemLoots, 60000, 1)
end
setTimer(refreshItemLootPoints, 14400000, 1)
