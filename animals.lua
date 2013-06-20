animals = {
  {
    -1350.775390625,
    -1070.8291015625,
    160.71176147461
  },
  {
    -1369.1123046875,
    -1094.70703125,
    163.45556640625
  },
  {
    -1431.8876953125,
    -1093.189453125,
    162.88122558594
  },
  {
    -1456.1787109375,
    -1064.6630859375,
    168.23822021484
  },
  {
    -1483.6357421875,
    -1024.376953125,
    170.4222869873
  },
  {
    -1468.3408203125,
    -988.3291015625,
    192.51156616211
  },
  {
    -1431.3173828125,
    -934.0478515625,
    201.39248657227
  },
  {
    -1577.904296875,
    -1020.0693359375,
    143.08142089844
  },
  {
    -1587.375,
    -1018.236328125,
    141.72036743164
  },
  {
    -1590.380859375,
    -1040.8505859375,
    134.61396789551
  },
  {
    -1581.958984375,
    -1072.4111328125,
    133.2043762207
  },
  {
    -1584.595703125,
    -1106.2001953125,
    138.63221740723
  },
  {
    -1550.591796875,
    -1137.1181640625,
    136.79585266113
  },
  {
    -1498.1083984375,
    -1180.9814453125,
    125.67600250244
  },
  {
    -1428.4541015625,
    -1225.892578125,
    106.43696594238
  },
  {
    -411.271484375,
    -1338.080078125,
    25.689184188843
  },
  {
    -373.59375,
    -1307.2568359375,
    26.628273010254
  },
  {
    -372.1689453125,
    -1259.75,
    31.759468078613
  },
  {
    -393.7333984375,
    -1195.427734375,
    60.393005371094
  },
  {
    -417.9150390625,
    -1180.4599609375,
    63.334930419922
  },
  {
    -433.0888671875,
    -1156.3349609375,
    61.920516967773
  },
  {
    -336.744140625,
    -1267.5693359375,
    23.735641479492
  },
  {
    -303.19140625,
    -1275.9599609375,
    10.24838924408
  },
  {
    -233.025390625,
    -1235.2373046875,
    6.5470447540283
  },
  {
    -193.0166015625,
    -1232.7568359375,
    10.130974769592
  },
  {
    -176.25,
    -1223.6298828125,
    8.0039596557617
  },
  {
    -166.5498046875,
    -1286.111328125,
    3.5691347122192
  },
  {
    -969.5048828125,
    -1738.703125,
    77.557479858398
  },
  {
    -966.748046875,
    -1776.2470703125,
    80.165809631348
  },
  {
    -976.7177734375,
    -1808.9462890625,
    90.694877624512
  },
  {
    -978.0849609375,
    -1827.4521484375,
    93.413543701172
  },
  {
    -986.23046875,
    -1855.9130859375,
    85.224227905273
  },
  {
    -1095.68359375,
    -1869.5302734375,
    86.347923278809
  },
  {
    -1168.853515625,
    -1864.869140625,
    79.263336181641
  },
  {
    -1221.1416015625,
    -1859.6591796875,
    76.356552124023
  },
  {
    -650.044921875,
    -2077.580078125,
    28.14298248291
  },
  {
    -632.34765625,
    -2062.50390625,
    32.527751922607
  },
  {
    -537.833984375,
    -1992.03515625,
    47.49878692627
  },
  {
    -498.4375,
    -1957.61328125,
    38.346961975098
  }
}
function spawnDayZAnimals()
  for i, animal in ipairs(animals) do
    local x, y, z = animal[1], animal[2], animal[3]
    ped = createPed(math.random(12, 14), x, y, z)
    setElementData(ped, "animal", true)
  end
end
spawnDayZAnimals()
function destroyDeadAnimalAndRespawn(ped, pedCol)
  destroyElement(ped)
  destroyElement(pedCol)
  ped = createPed(math.random(12, 14), x, y, z)
  setElementData(ped, "animal", true)
end
function createDeadAnimal()
  killPed(source)
  local x, y, z = getElementPosition(source)
  local skin = getElementModel(source)
  local ped = createPed(skin, x, y, z)
  local pedCol = createColSphere(x, y, z, 1.5)
  killPed(ped)
  setElementData(pedCol, "parent", ped)
  setElementData(pedCol, "playername", "Animal")
  setElementData(pedCol, "deadman", true)
  setElementData(pedCol, "MAX_Slots", 0)
  setElementData(pedCol, "deadreason", "This Animal was killed around " .. hours .. ":" .. minutes .. " o'clock.")
  if getElementModel(source) == 12 then
    setElementData(pedCol, "Raw Meat", 8)
  elseif getElementModel(source) == 13 then
    setElementData(pedCol, "Raw Meat", 4)
  elseif getElementModel(source) == 14 then
    setElementData(pedCol, "Raw Meat", 2)
  end
  destroyElement(source)
  setTimer(destroyDeadAnimalAndRespawn, 1800000, 1, ped, pedCol)
end
addEvent("createDeadAnimal", true)
addEventHandler("createDeadAnimal", getRootElement(), createDeadAnimal)
