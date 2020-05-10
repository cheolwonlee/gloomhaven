pageList = {}
pageListS = {}
isSpawning = false
isLeaving = false
tableToken = "7ef9dd"
Casts = {
   P1 = {-38.75, 2.00, -44.50},
   P2 = {-14.68, 2.00, -44.50},
   P3 = {9.25, 2.00, -44.50},
   P4 = {33.32, 2.00, -44.50},
   P5 = {57.30, 2.00, -44.50}
}
zoneToColor = {}
zoneToColor["49a4e0"] = "Red"
zoneToColor["dac936"] = "White"
zoneToColor["62cd94"] = "Blue"
zoneToColor["963318"] = "Green"
zoneToColor["78094e"] = "Purple"
cardPositions = {
   P1 = {
      { - 16.60, 1.82, - 23.70}, { - 13.40, 1.82, - 23.70}
   },
   P2 = {
      { - 9.32, 1.82, - 23.70}, { - 6.15, 1.82, - 23.70}
   },
   P3 = {
      {6.14, 1.82, - 23.70}, {9.33, 1.82, - 23.70}
   },
   P4 = {
      {13.41, 1.82, - 23.70}, {16.58, 1.82, - 23.70}
   },
   P5 = {
       {63.22, 1.82, -38.61}, {66.40, 1.82, -38.66}
   }
  
}
-- Three slots for scripting button 7-9 and the images have to be in 8000x8000
backgroundImages = {
   --Blue Noise
   "http://cloud-3.steamusercontent.com/ugc/789758809466396754/209547F7DF350997ECF52C2DA5B43CC248C2AF47/",
   --Blue with Image
   "http://cloud-3.steamusercontent.com/ugc/1018319371832643033/26A91EC8F2DA37977132C0BB59ABA1B93D11C5DD/",
   --Red with Image
   "http://cloud-3.steamusercontent.com/ugc/1018319371832606380/E749A4C6C8E6BBC5ECFF8104C046F6B737D0CBD0/"
}

function onLoad(save_state)
   for i = 1, 54 do
      table.insert(pageList, "Rulebook Page " .. i)
   end
   for i = 1, 122 do
      table.insert(pageListS, "Scenario Page " .. i)
   end
end

function cleanArea(params)
   local pos = params[1].getPosition()
   local selfObject = params[2]
   selfObject.setPosition({pos.x - 5, pos.y + 1, pos.z + 12})
   local bagPos = {pos.x + 0.62, pos.y + 1, pos.z - 33}
   local envelopes = Global.getTable("envelopes")
   local name = selfObject.getName()
   local hittedBag = false

   local hitlist = Physics.cast({
      origin = bagPos,
      direction = {0, 1, 0},
      type = 2,
      size = {3, 3, 3},
      max_distance = 0,
      debug = false
   }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}

   for i, j in pairs(hitlist) do
      if j.hit_object.tag == "Bag" and j.hit_object.getName() ~= "Summons" then
         hittedBag = j.hit_object
      end
   end

   if hittedBag then
      local _, _, zone = playerCheck(pos.x)
      for u, v in pairs(getObjectFromGUID(zone).getObjects()) do
         if v.getGUID() ~= "dff000" and v.getGUID() ~= "42d2b6" and v ~= selfObject and v.getName() ~= "Remove Player" and v ~= hittedBag then
            hittedBag.putObject(v)
         end
      end
      hittedBag.setDescription("Repacked")
      hittedBag.setPositionSmooth({pos.x, pos.y + 1, pos.z + 12}, false, true)
   end


   selfObject.setPosition(bagPos)
   selfObject.setRotationSmooth({0.00, 270.00, 0.00})
   selfObject.setVelocity({0.00, 0.00, 0.00})
   selfObject.setAngularVelocity({0.00, 0.00, 0.00})

   Wait.frames(function() checkInside({name, pos, selfObject}) end, 5)

   params[1].destruct()
end

function checkInside(params)
   local envelopes = Global.getTable("envelopes")
   local bag = params[3]
   local posMat = params[2]
   local bagContent = {}
   for i, j in pairs(bag.getObjects()) do
      local name = j.name
      if name:find('Player Mat') then
         bagContent.playerMat = {
            guid = j.guid,
            pos = posMat,
            lock = true,
            state = envelopes[params[1]].state,
            hide = true,
            PM = true
         }
      end
      if name == "Character Mat" then
         bagContent.charMat = {
            guid = j.guid,
            lock = true,
            pos = {posMat.x + 2.2, posMat.y + 0.12, posMat.z - 0.3}
         }
      end
      if name == params[1] then

         bagContent.figure = {
            guid = j.guid,
            pos = {posMat.x, posMat.y + 1, posMat.z + 6}
         }
      end
      if name == "Starting Abilities" then
         bagContent.startAbi = {
            guid = j.guid,
            pos = {posMat.x, posMat.y + 1, posMat.z - 6},
            draw = true
         }
      end
      if name == "Advanced Abilities" and Global.getTable("setup").advancedAbilities then
         bagContent.advAbi = {
            guid = j.guid,
            pos = {posMat.x + - 3.2, posMat.y + 2, posMat.z - 32.4}
         }
      end
      if name == "Summons" then
         bagContent.summons = {
            guid = j.guid,
            pos = {posMat.x + 9.45, posMat.y + 2, posMat.z + 2.2}
         }
      end
      if name == "Trackers" then
         bagContent.trackers = {
            guid = j.guid,
            pos = {posMat.x + 7.7, posMat.y + 1, posMat.z + 2.2}
         }
      end
      if name == "Character Sheet" then
         bagContent.charSheet = {
            guid = j.guid,
            pos = {posMat.x + 6.31, posMat.y + 1, posMat.z - 34.23}
         }
      end
      if name == "Attack Modifiers" and Global.getTable("setup").advancedModifiers then
         bagContent.attMod = {
            guid = j.guid,
            pos = {posMat.x + - 7, posMat.y + 2, posMat.z - 31.5}
         }
      end
      if name == "You Died" or name:match("%d+ hp") then
         bagContent.hp = {
            guid = j.guid,
            pos = {posMat.x + 9.3, posMat.y + 1, posMat.z - 4.58}
         }
      end
      if name:find("Noob") or name:match("%d+ xp") then
         bagContent.xp = {
            guid = j.guid,
            pos = {posMat.x + 9.3, posMat.y + 1, posMat.z - 6.37}
         }
      end
   end

   local color, _, _, deckGUID = playerCheck(posMat.x)
   local amDeck = nil
   for u, v in pairs(bagContent) do
      local content = bag.takeObject({
         position = v.pos,
         smooth = false,
         guid = v.guid
      })
      if u == "figure" then
         content.setRotation({0, 0, 0})
      else
         content.setRotation({0, 180, 0})
      end
      if not bag.getDescription():find("Repacked") then
         if v.state then
            if v.state < #content.getStates() + 2 then
               content = content.setState(v.state)
            end
         end
         if v.hide and Global.getTable("setup").hidePMTooltip then content.tooltip = false end
         if v.draw then
            local player = ""
            Wait.frames(function() content.deal(15, color) end, 5)
         end
      else
         if u == "attMod" then
            amDeck = {content, v.pos}
         end
      end
      if v.lock then content.lock() end
   end

   if not bag.getDescription():find("Repacked") then
      getObjectFromGUID("6c775e").takeObject({position = {posMat.x + 9.3, posMat.y + 1, posMat.z - 4.58}, rotation = {0, 180, 0}, callback_function = function(obj) obj.setState(envelopes[params[1]].life) end, smooth = false})
      getObjectFromGUID("0625c4").takeObject({position = {posMat.x + 9.3, posMat.y + 1, posMat.z - 6.37}, rotation = {0, 180, 0}, smooth = false})

      local modDeck = getObjectFromGUID(deckGUID).takeObject({position = {posMat.x - 4.7, posMat.y + 1, posMat.z + 3.4}, rotation = {0, 180, 180}, smooth = false})
      modDeck.shuffle()
      if bag.getName() == "Beast Tyrant" then
         bagObj = bag.getObjects()
         bag.deal(#bagObj, color)
      end
   else
      bagObj = bag.getObjects()
      bag.deal(#bagObj, color)
      Wait.time(function() putBack({bag, color, {posMat.x - 4.7, posMat.y + 1, posMat.z + 3.4}, amDeck}) end, 2)
   end
end

function putBack(params)
   for _, ho in pairs(Player[params[2]].getHandObjects(1)) do
      if ho.tag == "Deck" then
         if ho.getDescription():find("Player") then
            ho.setPosition(params[3])
         else
            if params[4] ~= nil then
               params[4][1].setPosition(params[3])
               ho.setPosition(params[4][2])
            end
         end
      elseif ho.tag ~= "Card" and ho.getName() ~= "Bear Companion" then
         params[1].putObject(ho)
      end
   end
end

function playerCheck(x)
   local player, num, zone, modDeck
   if x < -40 then
      player = "Red"
      num = 1
      zone = "49a4e0"
      modDeck = "bb85b9"
   elseif (x < -20 and x > -30) then
      player = "White"
      num = 2
      zone = "dac936"
      modDeck = "d23231"
    elseif (x < 10 and x > -10) then
      player = "Blue"
      num = 3
      zone = "62cd94"
      modDeck = "74238d"
   elseif (x < 30 and x > 20) then
      player = "Green"
      num = 4
      zone = "963318"
      modDeck = "20d00f"
   elseif (x < 50 and x > 40) then
      player = "Purple"
      num = 5
      zone = "78094e"
      modDeck = "546710"
   end
   return player, num, zone, modDeck
end

function exSetState(params)
   params[1].setState(params[2])
end

function onScriptingButtonDown(index, color)
   local playerList = {Player["Red"], Player["White"], Player["Blue"], Player["Green"], Player["Purple"]}
   local activeColor = ""
   if index < 3 then
      local activePlayer = 0
      local obj = Player[color].getHoverObject()
      for k, v in pairs(playerList) do
         for i, j in pairs(v.getHandObjects()) do
            if obj == j then
               activePlayer = "P" .. k
               activeColor = v.color
               break
            end
         end
      end
      if activePlayer ~= 0 then
         local tabInfo = getNotebookTabs()
         local tab = ""

         for _, t in pairs(tabInfo) do
            if t.title == "Options" then tab = t.body end
         end

         if tab:find("flip revealed:yes") then
            obj.flip()
         end

         local hitlist = Physics.cast({
            origin = cardPositions[activePlayer][index],
            direction = {0, 1, 0},
            type = 3,
            size = {0.5, 2, 0.5},
            max_distance = 0,
            debug = false
         })

         for i, j in pairs(hitlist) do
            if j.hit_object.tag == "Card" or j.hit_object.tag == "Deck" then
               j.hit_object.deal(20, activeColor)
            end
         end
         Wait.frames(function() obj.setPosition(cardPositions[activePlayer][index]) end, 10)
      end
   elseif index == 3 then
      local playArea
      for _, obj in pairs(getAllObjects()) do
         if obj.getName() == "Play Area" then playArea = obj end
      end

      if playArea then
         playArea.call("buttonClickedEx", {"AMD"})
      end
   elseif index > 6 and index < 10 then
      local token = getObjectFromGUID(tableToken)
      token.setCustomObject({image = backgroundImages[index - 6]})
      token.reload()
      Wait.frames(function() Wait.condition(function() local obj = getObjectFromGUID("7ef9dd") obj.tooltip = false obj.lock() obj.interactable = false end, function() return checkLoaded(token) end) end, 1)
   end
end

function onObjectLeaveContainer(container, leave_object)
   local find = container.getName():find("Standee")
   if not find then
      find = container.getName():find("Horizontal")
      if not find then
         find = container.getName():find("Vertical")
      end
   end

   if find ~= nil then
      Wait.condition(function() leaving(container, leave_object, find) end, function() return not isLeaving end)
   end
end

function leaving(container, leave_object, find)
   isLeaving = true
   if monsters[container.getName():sub(1, find - 2)] then
      local monsterName = leave_object.getName()
      local numbers = {}
      if monsters[monsterName].count == 1 then
         isLeaving = false
         return
      end
      for i = 1, monsters[monsterName].count do
         table.insert(numbers, i)
      end
      local hitlist = Physics.cast({
         origin = {0, 1, 0},
         direction = {0, 1, 0},
         type = 3,
         size = {100, 10, 65},
         max_distance = 0,
         debug = false
      })
      local removedNumbers = ""
      for _, j in pairs(hitlist) do
         if j.hit_object.getName():find(monsterName) then
            local str = j.hit_object.getName():gsub(monsterName, "")
            local num = tonumber(str)
            if num ~= nil then
               for x, i in pairs(numbers) do
                  if i == num then
                     removedNumbers = removedNumbers .. x .. "(" .. i .. ")" .. "|"
                     table.remove(numbers, x)
                  end
               end
            end
         end
      end
      local numbs = ""
      for x, i in pairs(numbers) do
         numbs = numbs .. x .. "(" .. i .. ")" .. "|"
      end
      rand = math.random(1, #numbers)
      if numbers[rand] == nil then
         broadcastToAll("All " .. monsterName .. " are on the table!", {1, 0, 0})
         isLeaving = false
         isSpawning = false
         leave_object.destruct()
      else
         leave_object.setName(leave_object.getName() .. " " .. numbers[rand])
         if not leave_object.getDescription():find("Horizontal") and not leave_object.getDescription():find("Vertical") then
            Wait.condition(function() leave_object.UI.setAttribute("number", "image", numbers[rand]) end, function() return checkLoaded(leave_object) end)
            Wait.condition(function() isLeaving = false end, function() return checkLoaded(leave_object) end)
         else
            Wait.frames(function() isLeaving = false end, 1)
         end
      end
   else
      isLeaving = false
   end
end

function spawnMonster(params)
   Wait.condition(function() startSpawn(params) end, function() return not isSpawning end)
end

function startSpawn(params)
   isSpawning = true
   local monster = nil
   local monsterRotation = {0.00, 0.00, 0.00}
   local monsterPosition = params.monsterPosition
   local boss = false
   if params.monsterType == nil then params.monsterType = "Standee" end
   if params.monsterDifficulty == nil then params.monsterDifficulty = "normal" end
   if params.monsterType ~= "Standee" then monsterRotation = {0.00, 180.00, 0.00} end

   local hitlist = Physics.cast({
      origin = {145, 0, 0},
      direction = {0, 1, 0},
      type = 3,
      size = {20, 50, 50},
      max_distance = 0,
      debug = false
   })

   for i, j in pairs(hitlist) do
      if j.hit_object.getName() == params.monsterName then
         monster = j.hit_object
      end
   end

   local pos, bagOffset = findFreeSpot()
   local figureBag = findMonster(params.monsterName)
   if figureBag and not figureBag.getName():find(params.monsterType) then
      print("Not the same typ of monsterbag. Please remove the monster and click again.")
      isSpawning = false
      return
   end
   local partySheet = nil
   local sl = nil
   for _, obj in pairs(getAllObjects()) do
      if obj.getDescription():find("Party Sheet") then
         partySheet = obj
         break
      end
   end

   if partySheet ~= nil then
      sl = tonumber(partySheet.UI.getAttribute("scenarioLevel", "Text"))
      local stats = getObjectFromGUID("6c1b20").getTable("stats")[params.monsterName][sl + 1]
      if stats.normal == nil then boss = true end
   end

   if monster ~= nil then
      if not figureBag and pos ~= nil then
         local statSheetHeight = 0.1
         getObjectFromGUID("f01091").takeObject({
            position = pos,
            rotation = {0.00, 180.00, 0.00},
            smooth = true
         }).lock()
         local brownBag = monster.takeObject({
            position = {pos[1], pos[2], - 27},
            smooth = true
         })
         for _, obj in pairs(brownBag.getObjects()) do
            if obj.name == "Boss" then
               boss = true
            end
         end
         local rotationStatSheet = {monsters[params.monsterName].rotationStatSheet[1], monsters[params.monsterName].rotationStatSheet[2], monsters[params.monsterName].rotationStatSheet[3]}
         if sl ~= nil then
            if not boss then
               if sl > 3 then
                  if rotationStatSheet[2] > 180 then statSheetHeight = 0.23 end
                  if rotationStatSheet[3] > 90 then
                     rotationStatSheet[3] = 0
                     statSheetHeight = 0.23
                  else
                     rotationStatSheet[3] = 180
                  end
               else
                  if rotationStatSheet[2] < 181 then statSheetHeight = 0.23 end
                  if rotationStatSheet[3] > 90 then
                     statSheetHeight = 0.1
                  end
               end
               rotationStatSheet[2] = rotationStatSheet[2] - (sl % 4) * 90
               if params.monsterName == "Living Corpse" and rotationStatSheet[3] > 90 then
                  rotationStatSheet[2] = 270 - (sl % 4) * 90
               end
            else
               rotationStatSheet[2] = rotationStatSheet[2] - (sl % 4) * 90
               if sl > 3 then
                  statSheetHeight = 0.23
                  rotationStatSheet[3] = 180
               end
            end
            if params.monsterName == "City Archer" or params.monsterName == "Living Corpse" or params.monsterName:find("Commander") then
               if statSheetHeight == 0.23 then
                  statSheetHeight = 0.1
               else
                  statSheetHeight = 0.23
               end
            end
         end

         for _, obj in pairs(brownBag.getObjects()) do
            local bagName = params.monsterName .. " " .. params.monsterType
            if boss then bagName = params.monsterName .. " Standee" end
            if obj.name == bagName then
               figureBag = brownBag.takeObject({
                  position = {pos[1] - bagOffset, pos[2], pos[3]},
                  rotation = {0.00, 180.00, 0.00},
                  smooth = true,
                  guid = obj.guid
               })
               figureBag.lock()
            elseif obj.name:find("Stat Sheet") then
               brownBag.takeObject({
                  position = {pos[1] - 2.07, pos[2] + statSheetHeight, pos[3] + 0.5},
                  rotation = rotationStatSheet,
                  smooth = true,
                  guid = obj.guid
               }).lock()
            elseif not obj.name:find("Standee") and not obj.name:find("Horizontal") and not obj.name:find("Vertical") then
               local deck = brownBag.takeObject({
                  position = {pos[1] + 2.89, pos[2] + 3, pos[3] + 1.86},
                  rotation = {0, 180, 180},
                  smooth = true,
                  guid = obj.guid,
               })
               Wait.condition(function() Wait.time(function() deck.shuffle() end, 0.5, 5) end, function() return checkLoaded(deck) end)
            end
         end
         local rotation = 0
         local sleevePos = {pos[1] - 2.07, 1.96, pos[3] + 0.5}
         if monsters[params.monsterName].count > 6 then
            rotation = 180
            sleevePos = {pos[1] - 2.07, 1.82, pos[3] + 0.5}
         end
         getObjectFromGUID("b26c16").takeObject({
            position = sleevePos,
            rotation = {0.00, 0.00, rotation},
            smooth = true
         }).lock()
         broadcastToAll('The Monster, "' .. params.monsterName .. '", has been prepared.', {1, 1, 1})
         brownBag.destruct()
      else
         if not figureBag and pos == nil then
            broadcastToAll('All 8 Slots are ocupied!', {1, 1, 1})
            isSpawning = false
            return
         end
         -- broadcastToAll('The Monster, "' .. params.monsterName .. '", is already on the board!\nTook one monster from this bag.', {1, 1, 1})
         -- figureBag.highlightOn({0, 1, 0}, 5)

      end
      if params.monsterPlacement ~= false then
         Wait.condition(
            function()
               if monsterPosition == nil then
                  monsterPosition = getMonsterPos(figureBag.getPosition())
               end
               figure = figureBag.takeObject({
                  position = monsterPosition,
                  rotation = monsterRotation,
                  smooth = false
               })
               if params.monsterType == "Standee" then
                  if not boss then
                     Wait.condition(function() Wait.frames(function() figure.call("setTyp", {params.monsterDifficulty}) isSpawning = false end, 1) end, function() return checkLoaded(figure) end)
                  else
                     Wait.condition(function() setHealth({figure, params.monsterName}) figure.call("setBossFlag") figure.call("setTyp", {}) isSpawning = false end, function() return checkLoaded(figure) end)
                  end
               else
                  if params.monsterDifficulty == "elite" then
                     Wait.frames(function() local newName = figure.getName() figure = figure.setState(2) figure.setName(newName) isSpawning = false end, 2)
                  else
                     isSpawning = false
                  end
               end
            end,
         function() return not figureBag.isSmoothMoving() end)
      else
         Wait.condition(function() isSpawning = false end, function() return not figureBag.isSmoothMoving() end)
      end
   else
      broadcastToAll('The Monster, "' .. params.monsterName .. '", was not found!', {1, 1, 1})
      isSpawning = false
   end
end

function checkLoaded(obj)
   if not obj.loading_custom and not obj.spawning then
      return true
   end

   return false
end

--Wait Time
function wait(time)
   local start = os.time()
   repeat
      coroutine.yield(0)
   until os.time() > start + time
end

function getMonsterPos(figureBagPos)
   local x = -1
   -- 1.71
   local z = -12.12
   if figureBagPos.x > - 46 and figureBagPos.x < - 45 or figureBagPos.x > 20 and figureBagPos.x < 21 then
      x = 1
   end
   if figureBagPos.z < - 20 then
      z = -28.80
   end

   for i = 0, 9 do
      local pos = {figureBagPos.x + x * 1.75 * i, 1.71, z}
      local found = false
      local hitList = Physics.cast({
         origin = pos, direction = {0, 1, 0}, type = 2,
         size = {1, 1, 1}, max_distance = 0, debug = false
      })
      for _, entry in ipairs(hitList) do
         if entry.hit_object.guid ~= "7ef9dd" and entry.hit_object.guid ~= "437cd7" and entry.hit_object.guid ~= "dff000" and entry.hit_object.guid ~= "42d2b6" and entry.hit_object.getGUID() ~= "577a97" then
            found = true
         end
      end
      if not found then
         return pos
      end
   end
end

function changeHP(params)
   if params[1] ~= false then
      local obj = getPlayerFromName(params[1])
      if obj ~= false then
         local current = obj.getStateId()
         if not (current == 31 and params[2] == 0) then
            if current ~= params[2] then
               if params[2] < 1 then
                  obj.setState(31)
               else
                  obj.setState(params[2])
               end
            end
         end
      end
   end
end

function getPlayerFromName(name)
   for color, i in pairs(Global.getTable("colorToPlayer")) do
      if color ~= "Black" then
         for _, j in pairs(getObjectFromGUID(i.zone).getObjects()) do
            if j.getName():find(name) then
               local hitlist = Physics.cast({
                  origin = Casts[i.pre],
                  direction = {0, 1, 0},
                  type = 3,
                  size = {1, 2, 1},
                  max_distance = 0,
                  debug = false
               })
               for _, v in pairs(hitlist) do
                  if v.hit_object.getStates() ~= nil then
                     if #v.hit_object.getStates() == 30 then
                        return v.hit_object
                     end
                  end
               end
            end
         end
      end
   end
   return false
end

function setHealth(params)
   if params[1] ~= nil then
      local health = {
         value = 10,
         max = 10
      }
      local partySheet = nil
      for _, obj in pairs(getAllObjects()) do
         if obj.getDescription() == "Party Sheet" then
            partySheet = obj
            break
         end
      end
      if partySheet ~= nil then
         local level = tonumber(partySheet.UI.getAttribute("scenarioLevel", "text"))
         local playerCount = 0
         for color, i in pairs(Global.getTable("colorToPlayer")) do
            if color ~= "Black" then
               local playerMat = false
               for _, j in pairs(getObjectFromGUID(i.zone).getObjects()) do
                  if j.getName():find("Player Mat") then
                     playerMat = true
                     playerCount = playerCount + 1
                  end
               end
               if playerMat then
                  Global.UI.setAttribute(i.pre, "active", "true")
               else
                  Global.UI.setAttribute(i.pre, "active", "false")
               end
            end
         end
         health.max = tonumber(getObjectFromGUID("6c1b20").getTable("stats")[params[2]][level + 1].health:sub(1, - 3)) * playerCount
         health.value = health.max
         params[1].setTable("health", health)
      end
      params[1].call("updateHealthUI")
   end
end

function findMonster(monsterName)
   local hitlist = Physics.cast({
      origin = {0, 1, 0},
      direction = {0, 1, 0},
      type = 3,
      size = {100, 2, 50},
      max_distance = 0,
      debug = false
   })
   local nameList = {
      [monsterName .. " Standee"] = true,
      [monsterName .. " Horizontal"] = true,
      [monsterName .. " Vertical"] = true
   }
   for _, j in pairs(hitlist) do
      if nameList[j.hit_object.getName()] then
         return j.hit_object
      end
   end
   return false
end

function findFreeSpot()
   local start = {x = 27.56, y = 1.70, z = -16.72}
   local z = {0, 0, 1, 1, 0, 0, 1, 1}
   local pos = {}
   for i = 1, 8 do
      pos = {(start.x + 11.38 * (i > 4 and 1 or 0)) * math.pow(-1, i - 1), start.y, (start.z - 7.58 * z[i])}
      local hitlist = Physics.cast({
         origin = pos,
         direction = {0, 1, 0},
         type = 3,
         size = {10, 1, 6.8},
         max_distance = 0,
         debug = false
      })
      local foundMonster = false
      for _, j in pairs(hitlist) do
         if j.hit_object.getName() == "Monster Mat" then
            foundMonster = true
         end
      end
      if not foundMonster then
         return pos, 7 * math.pow(-1, i) * (i > 4 and 1 or - 1)
      end
   end
   return nil
end

function spawnAll()
   startLuaCoroutine(self, "coSpawnAll")
end

function coSpawnAll()
   local board = getObjectFromGUID("437cd7")
   local count = 1
   local pos = {x = -45.94, y = 1.70, z = 15.91} -- -44.19
   for i, j in pairs(monsters) do
      if i ~= "Vicious Drake" then
         spawnMonster({monsterName = i, monsterPosition = {pos.x + count * 1.75, pos.y, pos.z}, monsterDifficulty = "normal", monsterType = "Vertical"})
         if count % 8 == 0 then
            wait(10)
            board.call("cleanMonster")
            wait(1)
         end
         count = count + 1
      end
   end
   spawnMonster({monsterName = "Inox Bodyguard", monsterPosition = {pos.x + count * 1.75, pos.y, pos.z}, monsterDifficulty = "normal", monsterType = "Standee"})
   return 1
end

monsters = {
   ["Aesther Ashblade"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 20 + 3},
   ["Aesther Scout"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 20 + 3},
   ["Ancient Artillery"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 0 + 3},
   ["Bandit Guard"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 10 + 3},
   ["Bandit Archer"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 12 + 3},
   ["Black Imp"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -5 + 3},
   ["Cave Bear"] = {count = 4, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 0 + 3},
   ["City Guard"] = {count = 6, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 14 + 3},
   ["City Archer"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 12 + 3},
   ["Cultist"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 17 + 3},
   ["Deep Terror"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -2 + 3},
   ["Earth Demon"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 40 + 3},
   ["Flame Demon"] = {count = 6, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 18 + 3},
   ["Forest Imp"] = {count = 10, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = -13 + 3},
   ["Frost Demon"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 10 + 3},
   ["Giant Viper"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -8 + 3},
   ["Harrower Infester"] = {count = 4, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 14 + 3},
   ["Hound"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 10 + 3},
   ["Inox Guard"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 35 + 3},
   ["Inox Archer"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 40 + 3},
   ["Inox Shaman"] = {count = 4, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 30 + 3},
   ["Living Bones"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 10 + 3},
   ["Living Corpse"] = {count = 6, rotationStatSheet = {0.00, 90.00, 0.00}, HPBarOffset = 10 + 3},
   ["Living Spirit"] = {count = 6, rotationStatSheet = {0.00, 180.00, 180.00}, HPBarOffset = 10 + 3},
   ["Lurker"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 32 + 3},
   ["Night Demon"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 12 + 3},
   ["Ooze"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 5 + 3},
   ["Rending Drake"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -10 + 3},
   ["Savvas Icestorm"] = {count = 4, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 16 + 3},
   ["Savvas Lavaflow"] = {count = 4, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 12 + 3},
   ["Spitting Drake"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 5 + 3},
   ["Sun Demon"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 10 + 3},
   ["Stone Golem"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 47 + 3},
   ["Valrath Savage"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 25 + 3},
   ["Valrath Tracker"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 25 + 3},
   ["Vermling Scout"] = {count = 10, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -3 + 3},
   ["Vermling Shaman"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = -3 + 3},
   ["Wind Demon"] = {count = 6, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 12 + 3},
   ["Bandit Commander"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 25 + 3},
   ["Captain of the Guard"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 20 + 3},
   ["Dark Rider"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 45 + 3},
   ["Elder Drake"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 44 + 3},
   ["Human Commander"] = {count = 1, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 23 + 3},
   ["Inox Bodyguard"] = {count = 2, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 38 + 3},
   ["Jekserah"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 20 + 3},
   ["Manifestation of Corruption"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 15 + 3},
   ["Merciless Overseer"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 22 + 3},
   ["Prime Demon"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 60 + 3},
   ["The Betrayer"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 25 + 3},
   ["The Colorless"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 37 + 3},
   ["The Gloom"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 35 + 3},
   ["The Sightless Eye"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 32 + 3},
   ["Valrath Commander"] = {count = 1, rotationStatSheet = {0.00, 180.00, 0.00}, HPBarOffset = 25 + 3},
   ["Winged Horror"] = {count = 1, rotationStatSheet = {0.00, 270.00, 0.00}, HPBarOffset = 39 + 3}
}
monsters["Vicious Drake"] = monsters["Rending Drake"]