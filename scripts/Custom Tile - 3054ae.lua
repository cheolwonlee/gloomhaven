function onLoad(save_state)
   self.createButton({
      click_function = "addPlayer",
      function_owner = self,
      label = "",
      position = {0, 0.05, 0},
      color = {0, 0, 0, 0},
      width = 2400,
      height = 600
   })
end

function addPlayer(obj, color, alt_click)
   if alt_click == true then
     markArea()
     self.UI.setAttribute("DeleteButton", "active", "true")
     Global.UI.setAttribute("clearPlayAreaYN", "active", "true")
   else
      local makeBoard = true
      local pos = self.getPosition()
      local hitlist = Physics.cast({
         origin = self.positionToWorld({0.0, 0, - 10.75}),
         direction = {0, 1, 0},
         type = 2,
         size = {1, 1, 1},
         max_distance = 0,
         debug = false
      }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}

      for k, v in pairs(hitlist) do

         if v.hit_object.getName() == "Play Area" then
            makeBoard = false
         end
      end
      local playArea = nil
      if makeBoard == true then
         playArea = getObjectFromGUID("457c84").takeObject({
            position = {0.00, 1.65, - 21.21},
            rotation = {0.00, 180.00, 0.00},
            smooth = false
         })
         Wait.condition(function() playArea.lock() playArea.call("buttonClickedEx", {"EIB"}) playArea.call("buttonClickedEx", {"MAMDeck"}) end, function() return not playArea.isSmoothMoving() and checkLoaded(playArea) end)
         tokenbag()
      else
         broadcastToAll("Play Area is allready in place.", "Red")
      end
   end
end

function checkLoaded(obj)
   if not obj.loading_custom and not obj.spawning then
      return true
   end

   return false
end

function markArea()
  local hitlist = Physics.cast({
    origin = {0.00, 2, -20.5},
    direction = {0, 1, 0},
    type = 3,
    size = {39, 1, 16.5},
    max_distance = 0,
    debug = false
  })

  local objToDestroy = {}

  for i,j in pairs(hitlist) do
    if j.hit_object ~= self and j.hit_object.getGUID() ~= "7ef9dd" and j.hit_object.getGUID() ~= "577a97" then
      j.hit_object.highlightOn({1,0,0}, 10)
      table.insert(objToDestroy, j.hit_object)
    end
  end
  return objToDestroy
end

function NoClicked()
  self.UI.setAttribute("DeleteButton", "active", "false")
  Global.UI.setAttribute("clearPlayAreaYN", "active", "false")
end

function cleanArea()
  local toDestroy = markArea()
  for i,j in pairs(toDestroy) do
    j.destruct()
  end
  NoClicked()
end

function tokenbag()
   local bag = getObjectFromGUID("10a47a")
   local bagPos = bag.getPosition()
   bagPos.y = bagPos.y + 5
   bag.takeObject({
      position = bagPos,
      smooth = false,
      guid = "70114a"
   }).lock()
   Wait.condition(token, function() return checkLoaded(getObjectFromGUID("70114a")) end)
end

function token()
   local bag = getObjectFromGUID("70114a")
   local positionTable = {}
   positionTable["ad805d"] = {0.00, 130.00, 0.00}
   positionTable["c0dd7c"] = {0.00, 90.00, 0.00}
   positionTable["2b445e"] = {0.00, 90.00, 0.00}
   positionTable["33bf9e"] = {0.00, 90.00, 0.00}
   positionTable["5fbb5e"] = {0.00, 0.00, 0.00}
   positionTable["d73dc6"] = {0.00, 0.00, 0.00}
   positionTable["25a639"] = {0.00, 0.00, 0.00}
   positionTable["c8ccdf"] = {0.00, 0.00, 0.00}
   positionTable["9e190e"] = {0.00, 0.00, 0.00}
   positionTable["a41a54"] = {0.00, 180.00, 0.00}
   positionTable["b6efed"] = {0.00, 90.00, 0.00}
   positionTable["083f97"] = {0.00, 170.00, 0.00}
   positionTable["cc25ae"] = {0.00, 165.00, 0.00}
   positionTable["20a120"] = {0.00, 170.00, 0.00}

   local c = 0

   for k, v in pairs(positionTable) do
      bag.takeObject({
         position = {-17.00 + c * 2.6153, 1.65, -13.00},
         rotation = v,
         smooth = true,
         guid = k
      }).lock()
      c = c + 1
   end

   getObjectFromGUID("70114a").destruct()
end

function checkLoaded(obj)
   if obj == nil then return false end
   if not obj.loading_custom and not obj.spawning then
      return true
   end
   return false
end