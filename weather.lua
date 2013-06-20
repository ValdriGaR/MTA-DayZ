local realtime = getRealTime()
setTime(realtime.hour, realtime.minute)
setMinuteDuration(60000)
function setWeather2()
  local number = math.random(1, 6)
  if number == 2 then
    setWeather(7)
  elseif number == 3 then
    setWeather(12)
  elseif number == 4 then
    setWeather(7)
  elseif number == 5 then
    setWeather(4)
  end
end
setTimer(setWeather2, 3600000, 0)
setWeather2()
function setNight(bool)
  if bool == true then
    setSkyGradient(0, 0, 0, 0, 0, 0)
    setFarClipDistance(66)
    setFogDistance(-500)
  elseif bool == false then
    setSkyGradient(0, 0, 0, 0, 0, 0)
    setFarClipDistance(66)
    setFogDistance(0)
    setWeather(4)
  end
end
