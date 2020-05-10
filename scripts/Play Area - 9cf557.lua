EIFBag = "bf8414"

Casts = {
  P1F = {2.41, 0, 0.4},
  P1S = {1.94, 0, 0.4},
  P1H = self.positionToLocal({-38.71, 1.88, -44.58}),
  P1E = self.positionToLocal({-38.71, 1.88, -46.37}),
  P2F = {1.35, 0, 0.4},
  P2S = {0.88, 0, 0.4},
  P2H = self.positionToLocal({-14.71, 1.88, -44.59}),
  P2E = self.positionToLocal({-14.71, 1.88, -46.37}),
  P3F = {-0.88, 0, 0.4},
  P3S = {-1.35, 0, 0.4},
  P3H = self.positionToLocal({9.29, 1.88, -44.58}),
  P3E = self.positionToLocal({9.29, 1.88, -46.37}),
  P4F = {-1.94, 0, 0.4},
  P4S = {-2.41, 0, 0.4},
  P4H = self.positionToLocal({33.29, 1.88, -44.59}),
  P4E = self.positionToLocal({33.29, 1.88, -46.37}),
  P5F = self.positionToLocal({63.22, 2.08, -38.61}),
  P5S = self.positionToLocal({66.37, 2.08, -38.64}),
  P5H = self.positionToLocal({57.29, 1.88, -44.59}),
  P5E = self.positionToLocal({57.29, 1.88, -46.37}),
  AMD = {0.3, 0, -0.75},
  AMS = {-0.3, 0, -0.75}
}
playerCasts = {
  P1 = {A = {{-48.85, 2.08, -34.79}, {-45.69, 1.85, -34.79}, {-42.53, 1.85, -34.79}, {-39.37, 1.85, -34.79}},
        D = {-52.43, 1.85, -40.80},
        L = {-39.37, 1.85, -40.80},
        AMDiscard = {-52.72, 2, -33.96},
        AMDeck = {-52.72, 2, -36.62},
        class = {-45.82, 1.89, -40.30}
      },
  P2 = {A = {{-24.85, 1.85, -34.79}, {-21.69, 1.85, -34.79}, {-18.53, 1.85, -34.79}, {-15.37, 1.85, -34.80}},
        D = {-28.43, 1.85, -40.80},
        L = {-15.37, 1.85, -40.81},
        AMDiscard = {-28.73, 2, -33.96},
        AMDeck = {-28.72, 2, -36.62},
        class = {-21.82, 1.89, -40.29}
      },
  P3 = {A = {{-0.84, 1.85, -34.79}, {2.32, 1.85, -34.79}, {5.48, 1.85, -34.79}, {8.63, 1.85, -34.80}},
        D = {-4.43, 1.85, -40.80},
        L = {8.63, 1.85, -40.80},
        AMDiscard = {-4.72, 2, -33.96},
        AMDeck = {-4.72, 2, -36.62},
        class = {2.18, 1.89, -40.30}
      },
  P4 = {A = {{23.16, 1.85, -34.79}, {26.32, 1.85, -34.79}, {29.48, 1.85, -34.79}, {32.63, 1.85, -34.80}},
        D = {19.57, 1.85, -40.80},
        L = {32.63, 1.85, -40.81},
        AMDiscard = {19.28, 2, -33.96},
        AMDeck = {19.28, 2, -36.62},
        class = {26.18, 1.89, -40.30}
      },
  P5 = {A = {{47.16, 1.85, -34.79}, {50.32, 1.85, -34.79}, {53.48, 1.85, -34.79}, {56.63, 1.85, -34.80}},
        D = {43.57, 1.85, -40.80},
        L = {56.63, 1.85, -40.81},
        AMDiscard = {43.28, 2, -33.96},
        AMDeck = {43.28, 2, -36.62},
        class = {50.18, 1.89, -40.30}
      }
}

elements = {
  Fire = {inert = {-3.22, 2.07, -17.18 - 4.48}, waning = {-0.64, 2.07, -17.18 - 4.48}, strong = {3.22, 2.07, -17.18 - 4.48}},
  Ice = {inert = {-1.94, 2.07, -17.96 - 4.48}, waning = {0.64, 2.07, -17.96 - 4.48}, strong = {1.94, 2.07, -17.96 - 4.48}},
  Air = {inert = {-3.22, 2.07, -18.96 - 4.48}, waning = {-0.64, 2.07, -18.96 - 4.48}, strong = {3.22, 2.07, -18.96 - 4.48}},
  Earth = {inert = {-1.94, 2.07, -19.75 - 4.48}, waning = {0.64, 2.07, -19.75 - 4.48}, strong = {1.94, 2.07, -19.75 - 4.48}},
  Light = {inert = {-3.22, 2.07, -20.46 - 4.48}, waning = {-0.64, 2.07, -20.46 - 4.48}, strong = {3.22, 2.07, -20.46 - 4.48}},
  Dark = {inert = {-1.94, 2.07, -21.48 - 4.48}, waning = {0.64, 2.07, -21.48 - 4.48}, strong = {1.94, 2.07, -21.48 - 4.48}}
}

colorsToTable = {
  Red = {0.856, 0.1, 0.094},
  White = {1, 1, 1},
  Blue = {0.118, 0.53, 1},
  Green = {0.192, 0.701, 0.168},
  Purple = {0.627, 0.118, 0.941},
  Black = {0, 0, 0}
}

function onLoad(save_state)
  createButt("P1FFA", -2.4, 0.718, nil, "Active Card")
  createButt("P1FFD", -2.4, 0.805, nil, "Discard Card")
  createButt("P1FFL", -2.4, 0.895, nil, "Lost Card")
  createButt("P1SFA", -1.94, 0.718, nil, "Active Card")
  createButt("P1SFD", -1.94, 0.805, nil, "Discard Card")
  createButt("P1SFL", -1.94, 0.895, nil, "Lost Card")

  createButt("P2FFA", -1.349, 0.718, nil, "Active Card")
  createButt("P2FFD", -1.349, 0.805, nil, "Discard Card")
  createButt("P2FFL", -1.349, 0.895, nil, "Lost Card")
  createButt("P2SFA", -0.895, 0.718, nil, "Active Card")
  createButt("P2SFD", -0.895, 0.805, nil, "Discard Card")
  createButt("P2SFL", -0.895, 0.895, nil, "Lost Card")

  createButt("P3FFA", 0.895, 0.718, nil, "Active Card")
  createButt("P3FFD", 0.895, 0.805, nil, "Discard Card")
  createButt("P3FFL", 0.895, 0.895, nil, "Lost Card")
  createButt("P3SFA", 1.349, 0.718, nil, "Active Card")
  createButt("P3SFD", 1.349, 0.805, nil, "Discard Card")
  createButt("P3SFL", 1.349, 0.895, nil, "Lost Card")

  createButt("P4FFA", 1.94, 0.718, nil, "Active Card")
  createButt("P4FFD", 1.94, 0.805, nil, "Discard Card")
  createButt("P4FFL", 1.94, 0.895, nil, "Lost Card")
  createButt("P4SFA", 2.4, 0.718, nil, "Active Card")
  createButt("P4SFD", 2.4, 0.805, nil, "Discard Card")
  createButt("P4SFL", 2.4, 0.895, nil, "Lost Card")

  P5FFA = self.positionToLocal({63.19, 2.08, -41.15})
  P5FFD = self.positionToLocal({63.19, 2.08, -41.75})
  P5FFL = self.positionToLocal({63.19, 2.08, -42.35})
  P5SFA = self.positionToLocal({66.35, 2.08, -41.15})
  P5SFD = self.positionToLocal({66.35, 2.08, -41.75})
  P5SFL = self.positionToLocal({66.35, 2.08, -42.35})
  createButt("P5FFA", P5FFA.x * -1, P5FFA.z, nil, "Active Card")
  createButt("P5FFD", P5FFD.x * -1, P5FFD.z, nil, "Discard Card")
  createButt("P5FFL", P5FFL.x * -1, P5FFL.z, nil, "Lost Card")
  createButt("P5SFA", P5SFA.x * -1, P5SFA.z, nil, "Active Card")
  createButt("P5SFD", P5SFD.x * -1, P5SFD.z, nil, "Discard Card")
  createButt("P5SFL", P5SFL.x * -1, P5SFL.z, nil, "Lost Card")

  createButt("P1HM", -2.538, -0.693, "sign", "Remove HP", " lost 1 HP")
  createButt("P1HP", -2.333, -0.693, "sign", "Add HP", " gained 1 HP")
  createButt("P1EM", -2.145, -0.693, "sign", "Remove XP", " lost 1 XP")
  createButt("P1EP", -1.9, -0.693, "sign", "Add XP", " gained 1 XP")

  createButt("P2HM", -1.713, -0.693, "sign", "Remove HP", " lost 1 HP")
  createButt("P2HP", -1.507, -0.693, "sign", "Add HP", " gained 1 HP")
  createButt("P2EM", -1.32, -0.693, "sign", "Remove XP", " lost 1 XP")
  createButt("P2EP", -1.075, -0.693, "sign", "Add XP", " gained 1 XP")

  createButt("P3HM", 1.072, -0.693, "sign", "Remove HP", " lost 1 HP")
  createButt("P3HP", 1.277, -0.693, "sign", "Add HP", " gained 1 HP")
  createButt("P3EM", 1.467, -0.693, "sign", "Remove XP", " lost 1 XP")
  createButt("P3EP", 1.71, -0.693, "sign", "Add XP", " gained 1 XP")

  createButt("P4HM", 1.9, -0.693, "sign", "Remove HP", " lost 1 HP")
  createButt("P4HP", 2.105, -0.693, "sign", "Add HP", " gained 1 HP")
  createButt("P4EM", 2.292, -0.693, "sign", "Remove XP", " lost 1 XP")
  createButt("P4EP", 2.538, -0.693, "sign", "Add XP", " gained 1 XP")

  P5HM = self.positionToLocal({62.59, 2.08, -35.02})
  P5HP = self.positionToLocal({64.02, 2.08, -35.02})
  P5EM = self.positionToLocal({65.31, 2.08, -35.02})
  P5EP = self.positionToLocal({67.01, 2.08, -35.02})
  createButt("P5HM", P5HM.x * -1, P5HM.z, "sign", "Remove HP", " lost 1 HP")
  createButt("P5HP", P5HP.x * -1, P5HP.z, "sign", "Add HP", " gained 1 HP")
  createButt("P5EM", P5EM.x * -1, P5EM.z, "sign", "Remove XP", " lost 1 XP")
  createButt("P5EP", P5EP.x * -1, P5EP.z, "sign", "Add XP", " gained 1 XP")

  createButt("AMD", -0.775, -0.752, "AM", "Draw a Modifier Card")
  createButt("AMS", 0.775, -0.752, "AM", "Shuffle the Modifier Deck")
  createButt("MAMDeck", -0.29, -0.75, "Element", "Get the Modifier ")

  createButt("EIB", 0, 0.215, "EIB", "Get an Elemental Infusion Board")

  createButt("ConFire", 0.905, -0.195, "Element", "Consume ", " consumed ")
  createButt("ConIce", 1.2, -0.195, "Element", "Consume ", " consumed ")
  createButt("ConAir", 1.49, -0.195, "Element", "Consume ", " consumed ")
  createButt("ConEarth", 1.78, -0.195, "Element", "Consume ", " consumed ")
  createButt("ConLight", 2.07, -0.195, "Element", "Consume ", " consumed ")
  createButt("ConDark", 2.36, -0.195, "Element", "Consume ", " consumed ")

  createButt("CreDark", -0.902, -0.195, "Element", "Create ", " created ")
  createButt("CreLight", -1.2, -0.195, "Element", "Create ", " created ")
  createButt("CreEarth", -1.498, -0.195, "Element", "Create ", " created ")
  createButt("CreAir", -1.793, -0.195, "Element", "Create ", " created ")
  createButt("CreIce", -2.09, -0.195, "Element", "Create ", " created ")
  createButt("CreFire", -2.387, -0.195, "Element", "Create ", " created ")


end

function createButt(name, x, z, type, tooltip, broadcast)

  self.setVar(name, function (obj, player_clicker_color) buttonClicked(name, broadcast, player_clicker_color) end)
  buttonParameter = {
    click_function = name,
    function_owner = self,
    label          = "",
    position       = {x, 0.11, z},
    scale          = {0.1, 0.1, 0.1},
    width          = 1500,
    height         = 300,
    color          = {1,1,1,0.1},
    tooltip        = tooltip
  }

  if type == "Element" then
    buttonParameter.width = 750
    buttonParameter.height = 750
    buttonParameter.color = {1,1,1,0}
    buttonParameter.tooltip = tooltip .. name:sub(4)
  elseif type == "AM" then
    buttonParameter.width = 1350
    buttonParameter.height = 450
  elseif type == "EIB" then
    buttonParameter.width = 3300
    buttonParameter.height = 500
  elseif type == "sign" then
    buttonParameter.width = 400
    buttonParameter.height = 400
    buttonParameter.color = {1,1,1,0}
  end

  self.createButton(buttonParameter)
end

function uiConsume(a, b, c)
  buttonClicked(c, " consumed ", a.color)
end
function uiCreate(a, b, c)
  buttonClicked(c, " created ", a.color)
end

function addHpEx(params)
  pre = params[1] .. (params[2] == 1 and "HP" or "HM")
  print(pre)
  buttonClicked(params[1] .. (params[2] == 1 and "HP" or "HM"), params[2] == 1 and " gained 1 HP" or " lost 1 HP", nil)
end

function buttonClicked(clicked, broadcast, player_clicker_color)
  local pre = clicked:sub(1,3)
  local element = clicked:sub(4)
  local origin, size

  if pre == "Cre" then
    origin = {0.18, 0, 0.37}
    size = {4.9, 1, 7}
  elseif pre == "Con" or pre == "low" then
    origin = {-0.18, 0, 0.37}
    size = {4.9, 1, 7}
  else
    origin = Casts[pre]
    size = {1, 1, 1}
  end

  if pre == "MAM" then
    getObjectFromGUID("987957").takeObject({
      position       = {-2.05, 1.87, -16.05},
      rotation       = {0.00, 179.97, 180.00},
      flip           = false
    })
    return
  end

  if origin ~= nil then
    local hitlist = Physics.cast({
      origin       = self.positionToWorld(origin),
      direction    = {0, 1, 0},
      type         = 3,
      size         = size,
      max_distance = 0,
      debug        = false
    }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}

    for u, v in pairs(hitlist) do
      if pre == "Cre" and v.hit_object.getName() == element then
        v.hit_object.setPosition(elements[element].strong)
        broadcastToAll(Player[player_clicker_color].steam_name .. broadcast .. element, colorsToTable[player_clicker_color])
        return
      elseif pre == "Con" and v.hit_object.getName() == element then
        v.hit_object.setPosition(elements[element].inert)
        broadcastToAll(Player[player_clicker_color].steam_name .. broadcast .. element, colorsToTable[player_clicker_color])
        return
      elseif pre == "low" and v.hit_object.getName() == element then
        if v.hit_object.getPosition().x > 1 then
          v.hit_object.setPosition(elements[element].waning)
          broadcastToAll(element .. " is now Waning!", {1,1,1})
        else
          v.hit_object.setPosition(elements[element].inert)
          broadcastToAll(element .. " is now Inert!", {1,1,1})
        end
        return
      elseif v.hit_object.getStates() ~= nil then
        if #v.hit_object.getStates() == 30 then
          local newObj = nil
          if v.hit_object.getStateId() == 31 then
            if element == "P" then
              newObj = v.hit_object.setState(1)
            else
              newObj = v.hit_object
            end
          elseif v.hit_object.getStateId() == 1 then
            if element == "M" then
              newObj = v.hit_object.setState(31)
            else
              newObj = v.hit_object.setState(v.hit_object.getStateId() + (element == "P" and 1 or -1))
            end
          else
            newObj = v.hit_object.setState(v.hit_object.getStateId() + (element == "P" and 1 or -1))
          end
          if clicked:sub(3,3) == "H" then
            changeHP(clicked:sub(1,2), newObj.getStateId())
          end
          broadcastToAll(checkClass(clicked:sub(1,2)) .. broadcast .. ". From: " .. v.hit_object.getName() .. " To: " .. newObj.getName(), colorsToTable[player_clicker_color])
          return
        end
      elseif clicked:sub(1,1) == "P" and v.hit_object.tag == "Card"  then
        if clicked:sub(4) == "Reveal" then
          v.hit_object.flip()
          return v.hit_object.getName():sub(-3,-2), v.hit_object.getDescription()
        elseif clicked:sub(5,5) == "A" then
          local pos = checkEmpty(playerCasts[clicked:sub(1,2)].A)
          if pos then
            v.hit_object.setPosition(pos)
          end
        elseif clicked:sub(5,5) == "D" then
          v.hit_object.setPosition(playerCasts[clicked:sub(1,2)].D)
        elseif clicked:sub(5,5) == "L" then
          v.hit_object.setPosition(playerCasts[clicked:sub(1,2)].L)
        end
        return
      elseif pre == "AMD" and v.hit_object.tag == "Deck" then
        local nCard = v.hit_object.takeObject({position = self.positionToWorld({Casts.AMS[1], Casts.AMS[2]+1, Casts.AMS[3]}), flip = true})
        broadcastToAll("Monster Drew Attack Modifier: " .. nCard.getDescription(), {1,1,1})
        return
      elseif pre == "AMD" and v.hit_object.tag == "Card" then
        v.hit_object.setPosition(self.positionToWorld({Casts.AMS[1], Casts.AMS[2]+1, Casts.AMS[3]}))
        v.hit_object.flip()
        broadcastToAll("Monster Drew Attack Modifier: " .. v.hit_object.getDescription(), {1,1,1})
        return
      elseif pre == "AMS" and (v.hit_object.tag == "Deck" or v.hit_object.tag == "Card") then
        hitlist = Physics.cast({
          origin       = self.positionToWorld(Casts.AMD),
          direction    = {0, 1, 0},
          type         = 3,
          size         = {1, 1, 1},
          max_distance = 0,
          debug        = false
        })
        for _, c in pairs(hitlist) do
          if c.hit_object.tag == "Deck" then
            c.hit_object.putObject(v.hit_object)
            c.hit_object.shuffle()
            return
          end
        end
        v.hit_object.setPosition(self.positionToWorld({Casts.AMD[1], Casts.AMD[2]+1, Casts.AMD[3]}))
        v.hit_object.flip()
        v.hit_object.shuffle()
        v.hit_object.shuffle()
      end
    end
    if pre == "Con" then
      broadcastToAll("No " .. element .. " to consume!", colorsToTable[player_clicker_color])
    end
  end

  if pre == "EIB" then
    local bag = getObjectFromGUID("bf8414").takeObject({position = {0.00, 1.52, -7.50}, smooth = false})
    bag.takeObject({position = {0.00, 1.85, -22.67}, rotation = {0.00, 0.00, 0.00}, smooth = false}).lock()
    bag.takeObject({position = {-3.23, 2.07, -17.19 - 4.48}, rotation = {0.00, 180.00, 180.00}})
    bag.takeObject({position = {-1.95, 2.07, -17.97 - 4.48}, rotation = {0.00, 180.00, 180.00}})
    bag.takeObject({position = {-3.22, 2.07, -18.95 - 4.48}, rotation = {0.00, 0.00, 180.00}})
    bag.takeObject({position = {-1.93, 2.07, -19.75 - 4.48}, rotation = {0.00, 180.00, 0.00}})
    bag.takeObject({position = {-3.21, 2.07, -20.46 - 4.48}, rotation = {0.00, 180.00, 0.00}})
    bag.takeObject({position = {-1.94, 2.07, -21.48 - 4.48}, rotation = {0.00, 180.00, 0.00}})
    bag.takeObject({position = {-3.30, 2.08, -14.38 - 4.48}, rotation = {0.00, 0.00, 0.00}})
    bag.destruct()
  end
end

function changeHP(player, hp)
  local name = checkClass(player)
  local char = nil

  if name ~= "" then
    char = findChar(name)
  end
  if char ~= nil then
    local hpTable = char.getTable("health")
    hpTable.value = hp
    char.setTable("health", hpTable)
    char.call("setHealth")
  end
end
function checkClass(player)
  local hitlist = Physics.cast({
    origin       = playerCasts[player].class,
    direction    = {0, 1, 0},
    type         = 3,
    size         = {1, 1, 1},
    max_distance = 0,
    debug        = false
  })
  for _, c in pairs(hitlist) do
    if c.hit_object.getName() == "Character Mat" then
      return c.hit_object.getDescription()
    end
  end
  return nil
end

function findChar(name)
  local hitlist = Physics.cast({
    origin = {0.00, 2, 7},
    direction = {0, 1, 0},
    type = 3,
    size = {92, 1, 32},
    max_distance = 0,
    debug = false
  })

  for _, j in pairs(hitlist) do
    if j.hit_object.getName():find(name) then
      if j.hit_object.getDescription():find("/") then
        return j.hit_object
      end
    end
  end
  return nil
end

function checkAMDiscard()
  local hitlist = Physics.cast({
    origin       = self.positionToWorld(Casts.AMS),
    direction    = {0, 1, 0},
    type         = 3,
    size         = {1, 1, 1},
    max_distance = 0,
    debug        = false
  })
  for _, c in pairs(hitlist) do
    if c.hit_object.tag == "Deck" then
      for _, u in pairs(c.hit_object.getObjects()) do
        if u.description:find("shuffle") then
          buttonClicked("AMS")
        end
      end
    elseif c.hit_object.tag == "Card" then
      if c.hit_object.getDescription():find("shuffle") then
        buttonClicked("AMS")
      end
    end
  end
end
function checkAMDiscard()
   local shuffle = false
   local deck = nil
   local hitlist = Physics.cast({
      origin = self.positionToWorld(Casts.AMS),
      direction = {0, 1, 0},
      type = 3,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   })

   for _, c in pairs(hitlist) do
      if c.hit_object.tag == "Deck" then
         for _, u in pairs(c.hit_object.getObjects()) do
            if toCheck[u.name] then
               local card = c.hit_object.takeObject({
                  position = toCheck[u.name],
                  guid = u.guid,
               })
               checkAMDiscard()
               return
            elseif u.description:find("shuffle") then
               shuffle = true
            end
         end
      elseif c.hit_object.tag == "Card" then
         if toCheck[c.hit_object.getName()] then
            c.hit_object.setPositionSmooth(toCheck[c.hit_object.getName()])
         elseif c.hit_object.getDescription():find("shuffle") then
            shuffle = true
         end
      end
   end
   if shuffle then
      Wait.time(function() buttonClicked("AMS") end, 1)
   end
   -- checkBlessCurse({"AMS"})
end

function checkAMDeck()
   local hitlist = Physics.cast({
      origin = self.positionToWorld(Casts.AMD),
      direction = {0, 1, 0},
      type = 3,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   })
   for _, c in pairs(hitlist) do
      if c.hit_object.tag == "Deck" then
         for _, u in pairs(c.hit_object.getObjects()) do
            if (u.name ~= nil and toCheck ~= nil) then
              if toCheck[u.name] then
                 local card = c.hit_object.takeObject({
                    position = toCheck[u.name],
                    guid = u.guid,
                    flip = true
                 })
              end
            end
         end
      elseif c.hit_object.tag == "Card" then
         if toCheck[c.hit_object.getName()] then
            if c.hit_object.is_face_down then c.hit_object.flip() end
            c.hit_object.setPositionSmooth(toCheck[c.hit_object.getName()])
         end
      end
   end
end
function buttonClickedEx(param)
  return buttonClicked(param[1])
end

function checkEmpty(posTable)
  local found = false
  for i, j in pairs(posTable) do
    found = false
    local hitlist = Physics.cast({
      origin       = j,
      direction    = {0, 1, 0},
      type         = 3,
      size         = {1, 1, 1},
      max_distance = 0,
      debug        = false
    })

    for u, v in pairs(hitlist) do
      if v.hit_object.tag == "Card" then found = true end
    end
    if found == false then return j end
  end

  return false
end
