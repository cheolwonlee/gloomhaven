function onLoad(save_state)
  self.createButton({
    click_function = "removePlayer",
    function_owner = self,
    label          = "",
    position       = {0,0.05,0},
    color          = {0, 0, 0, 0},
    width          = 2400,
    height         = 600
  })
end

function removePlayer()
  local posSelf = self.getPosition()
  local pos = {x = posSelf.x, y = posSelf.y - 0.05, z = posSelf.z - 8.17}
  local bagPos = {pos.x + 0.62, pos.y + 1, pos.z - 33}
  local hittedBag = false
  local zone
  if pos.x < -40 then
    zone = "49a4e0"
  elseif (pos.x < -20 and pos.x > -30) then
    zone = "dac936"
  elseif (pos.x < 10 and pos.x > -10) then
    zone = "62cd94"
  elseif (pos.x < 30 and pos.x > 20) then
    zone = "963318"
  elseif (pos.x < 50 and pos.x > 40) then
    zone = "78094e"
  end

  for i,j in pairs(getObjectFromGUID(zone).getObjects()) do
    if j.tag == "Bag" and j.getName() ~= "Summons" then
      j.lock()
      hittedBag = j
    end
  end

  for u,v in pairs(getObjectFromGUID(zone).getObjects()) do
    if hittedBag then
      if v.getGUID() ~= "dff000" and v.getGUID() ~= "42d2b6" and v ~= self and v ~= hittedBag then
        hittedBag.putObject(v)
      end
    else
      if v.getName():find("Player Mat") then
        v.destruct()
      end
    end
  end
  if hittedBag then
    hittedBag.unlock()
    hittedBag.setPositionSmooth({pos.x, pos.y + 2, pos.z}, true, true)
    hittedBag.setDescription("Repacked")
  end
  self.setState(1)
end