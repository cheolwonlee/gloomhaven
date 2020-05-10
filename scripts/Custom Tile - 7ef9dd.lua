

function cleanArea()
  local toDestroy = markArea()
  for i,j in pairs(toDestroy) do
    j.destruct()
  end
  NoClicked()
end

function cleanMonster()
  local toDestroy = markMonsters()
  for i,j in pairs(toDestroy) do
    j.destruct()
  end
  NoClickedMonster()
end

function checkArea()
  markArea()
  self.UI.setAttribute("DeleteButton", "active", "true")
  Global.UI.setAttribute("clearAreaYN", "active", "true")
end

function checkMonster()
  markMonsters()
  self.UI.setAttribute("DeleteMonsters1", "active", "true")
  self.UI.setAttribute("DeleteMonsters2", "active", "true")
  Global.UI.setAttribute("clearAreaYNMonster", "active", "true")
end

function NoClicked()
  self.UI.setAttribute("DeleteButton", "active", "false")
  Global.UI.setAttribute("clearAreaYN", "active", "false")
end

function NoClickedMonster()
  self.UI.setAttribute("DeleteMonsters1", "active", "false")
  self.UI.setAttribute("DeleteMonsters2", "active", "false")
  Global.UI.setAttribute("clearAreaYNMonster", "active", "false")
end

function markArea()
  local hitlist = Physics.cast({
    origin = {0.00, 2, 6.5},
    direction = {0, 1, 0},
    type = 3,
    size = {93, 1, 37},
    max_distance = 0,
    debug = false
  })

  local objToDestroy = {}

  for i,j in pairs(hitlist) do
    if j.hit_object ~= self and j.hit_object.getGUID() ~= "577a97" then
      j.hit_object.highlightOn({1,0,0}, 10)
      table.insert(objToDestroy, j.hit_object)
    end
  end
  return objToDestroy
end

function markMonsters()
  local hitlist = Physics.cast({
    origin = {33.2, 1, -19.5},
    direction = {0, 1, 0},
    type = 3,
    size = {29, 3, 18},
    max_distance = 0,
    debug = false
  })

  local objToDestroy = {}

  for i,j in pairs(hitlist) do
    if j.hit_object ~= self and j.hit_object.getGUID() ~= "577a97" then
      j.hit_object.highlightOn({1,0,0}, 10)
      table.insert(objToDestroy, j.hit_object)
    end
  end

  hitlist = Physics.cast({
    origin = {-33.2, 1, -19.5},
    direction = {0, 1, 0},
    type = 3,
    size = {29, 3, 18},
    max_distance = 0,
    debug = false
  })

  for i,j in pairs(hitlist) do
    if j.hit_object ~= self and j.hit_object.getGUID() ~= "577a97" then
      j.hit_object.highlightOn({1,0,0}, 10)
      table.insert(objToDestroy, j.hit_object)
    end
  end
  return objToDestroy
end