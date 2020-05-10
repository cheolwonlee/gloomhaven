setup = {
   advancedAbilities = true,
   advancedModifiers = true,
   hidePMTooltip = true,
   buttons = true
}
autoSetup_guid = "faad27"

mamd = { - 2.05, 1.88, - 16.05}
mamdp = {2.05, 1.88, - 16.05}

tableInilist = {}

envelopes = {}
-- if you put a player mat without states in then you have to use: state = nil
envelopes["Brute"] = {infi = "697f18", bag = "0f374f", state = 2, life = 10, HPBarOffset = 65}
envelopes["Scoundrel"] = {infi = "66309d", bag = "90dd43", state = 5, life = 8, HPBarOffset = 0}
envelopes["Spellweaver"] = {infi = "0507cf", bag = "5d3782", state = 6, life = 6, HPBarOffset = 15}
envelopes["Mindthief"] = {infi = "8c1ca4", bag = "ca026b", state = 4, life = 6, HPBarOffset = -20}
envelopes["Cragheart"] = {infi = "ec1d2a", bag = "2ae7c4", state = 3, life = 10, HPBarOffset = 30}
envelopes["Tinkerer"] = {infi = "fdef02", bag = "bdf901", state = 7, life = 8, HPBarOffset = -5}

toCheck = {}
toCheck["Player Curse"] = {51.60, 4.00, 23.65}
toCheck["Bless"] = {51.60, 4.00, 19.99}

function onLoad()
   megaFreeze() -- Make objects non-interactive
end

function onPlayerConnect(player_id)
   if player_id.steam_id == 76561198052321238 then
      player_id.changeColor("Red")
   end
end

function megaFreeze()
   -- 'bafa19', 'f7805a', '8bf5e2', 'dff000', '42d2b6', 'a1ae9dd', '59d54d', 'cf0917',
   -- '2f9ec3', 'd68151', 'c44dd8', '9118a6', 'ef095e', '17f87d', '507d38', '9dc275',
   -- '75f651', '20210d', '8db51c', 'e19d3f',
   local megaFreezeIT = {
      '6c1b20', '75ab50', 'f3ffb7', 'b53fb2', '41393b', 'a75fcd', '7ef9dd', 'faad27', '577a97',
      '15adf5', '0625c4', '0625c4', '4895cd', '29c2ce', '457c84', '6a8ca6', 'bb85b9', 'd23231', '74238d',
      '20d00f', '4efdc4', '359306', '0a3abe', 'c912f5', '21be0e', '0b51bb', 'a945e4', '0c647c', 'fe14ef',
      '8d2074', '3ea749', '3458a9', '987957', 'bf8414', '2d991e', 'f01091', 'b26c16', '98e1c8', '12706c',
      '8a51d4', '1a6a23', '18de4d', 'ebb04b', '6932a3', 'ca2eee', 'dc7e4a', 'f5e920', '928d79', 'ba742d',
      '687bc6', '5da349', '6ea8ae', 'f65129', '2f952d', 'f710b4', 'adc4de', '68e7e5', '4808dc', 'fe77ad',
      '25122d', 'c7b03c', '9d3e72', '5b42a1', '6de3bc', '8fb906', '046050', '2e70a8', '289cd7', '610e7e',
      'dbd624', 'c5625e', '939696', 'ba943a', '1fa5cf', 'f401dc', 'f2b50f', '75a0ec', '5accd8', '2c53e8',
      '12ede2', '102226', '9e7fc2', 'e596ad', '8b43a1', 'fa65df', 'e8893d', '4257e9', '88419d', 'aedd1b',
   'e7267a', '6c775e', '10a47a', 'a41a54' }

   --megaFreeze ACTIVATE!
   for _, guid in pairs(megaFreezeIT) do
      obj = getObjectFromGUID(guid)
      if obj ~= nil then
         obj.interactable = false
         obj.tooltip = false
      else
         print("Megafreeze did not found this GUID: ", guid)
      end
   end
end

function mark(player, value, id)
   if UI.getAttribute(id, "color") == "rgba(0, 0, 0, 0.95)" then
      UI.setAttribute(id, "color", "rgba(0.6, 0, 0, 0.95)")
      tableInilist[tonumber(id:sub(9))][4] = true
      looting(id)
   else
      UI.setAttribute(id, "color", "rgba(0, 0, 0, 0.95)")
      tableInilist[tonumber(id:sub(9))][4] = false
   end
   UI.setAttribute(id, "textColor", "rgba(1, 1, 1, 1)")
end

function looting(id)
   local classesInPlay = {}
   for color, _ in pairs(colorToPlayer) do
      if color ~= "Black" then
         local class = getClassFromColor(color)
         if class then
            if UI.getValue(id):find(class) then
               classesInPlay[class] = color
            end
         end
      end
   end

   for _, obj in pairs(getAllObjects()) do
      if classesInPlay[obj.getName()] then
         local findCoin = Physics.cast({
            origin = obj.getPosition(),
            direction = {0, 1, 0},
            type = 3,
            size = {0.5, 2, 0.5},
            max_distance = 0,
            debug = false
         }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}
         for _, found in pairs(findCoin) do
            if found.hit_object.getName():find("Coin") or found.hit_object.getName():find("Treasure Chest") then
               found.hit_object.setPositionSmooth(colorToPlayer[classesInPlay[obj.getName()]].coin)
               found.hit_object.unlock()
            end
         end
      end
   end
end

function reveal()
  local playArea = nil
  local colors = {"Red", "White", "Blue", "Green", "Purple"}
  local hitlist = Physics.cast({
    origin = {0.00, 1.73, - 16.67},
    direction = {0, 1, 0},
    type = 3,
    size = {1, 1, 1},
    max_distance = 0,
    debug = false
  })

  for u, v in pairs(hitlist) do
    if v.hit_object.getName() == "Play Area" then playArea = v.hit_object end
  end

  if playArea == nil then return end


  for color, x in pairs(colorToPlayer) do
    if color ~= "Black" then
      local hitlist = Physics.cast({
        origin = x.FC,
        direction = {0, 1, 0},
        type = 3,
        size = {1,1,1},
        max_distance = 0,
        debug = false
      })
      local card = nil
      for _, obj in pairs(hitlist) do
        if obj.hit_object.tag == "Card" then
          card = obj.hit_object
        end
      end
      if card == nil then
        local class = getClassFromColor(color)
        if class ~= "" and class ~= nil then
          local found = false
          for _, ini in pairs(tableInilist) do
            if ini[3] == class then
              found = true
            end
          end
          if found == false then
            local alive = true
            for _, obj in pairs(getObjectFromGUID(colorToPlayer[color].zone).getObjects()) do
              if obj.getName() == "You Died" then
                alive = false
              end
            end
            if alive then
              broadcastToAll(class .. " has no Initiative!", {1, 0, 0})
              return
            end
          end
        end
      end
    end
  end

  broadcastToAll("New Round started. All Initiative Cards revealed.", {1, 1, 1})

  local charList = {}

  for i = 1, 5 do
    local init, char = playArea.call("buttonClickedEx", {"P" .. i .. "FReveal"})
    local tbInit = playArea.call("buttonClickedEx", {"P" .. i .. "SReveal"})
    if init ~= nil then
      table.insert(tableInilist, {tonumber(init), tonumber(tbInit), char})
    end
  end

   for _, o in pairs(getAllObjects()) do
      if o.getName() == "Monster Mat" then
         local hitlist = Physics.cast({
            origin = o.getPosition(),
            direction = {0, 1, 0},
            type = 3,
            size = {9, 2, 5},
            max_distance = 0,
            debug = false
         }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}
         local monsterName = nil
         for i, j in pairs(hitlist) do
            if j.hit_object.getName():find("Stat Sheet") then
               monsterName = j.hit_object.getName():gsub(" Stat Sheet", "")
            end
         end
         if findMonster(monsterName) then
            local ini, name, desc = o.call("drawCard")
            local baseStats = nil
            if ini ~= nil then
               ini:gsub("(%d+)", function(a) table.insert(tableInilist, {tonumber(a), 999, monsterName, false, desc:sub(2)}) end)
            end
         end
      end
   end

  table.sort(tableInilist, function(a, b) if a[1] == b[1] then return a[2] < b[2] else return a[1] < b[1] end end)
  createIniList()
end


function attributesToString(table)
   local string = ""

   if table.attributes and #table.attributes > 0 then
      string = string .. "Attributes: "
      for i, j in pairs(table.attributes) do
         string = string .. j .. ", "
      end
   end
   if table.immunities and #table.immunities > 0 then
      string = string .. "Immunities: "
      for i, j in pairs(table.immunities) do
         string = string .. j .. ", "
      end
   end
   if table.special1 then
      string = string .. "\nSpecial1: "
      for i, j in pairs(table.special1) do
         string = string .. j .. ", "
      end
   end
   if table.special2 then
      string = string .. "\nSpecial2: "
      for i, j in pairs(table.special2) do
         string = string .. j
      end
   end
   return string
end

function findMonster(monsterName)
   local hitlist = Physics.cast({
      origin = {0.00, 2, 7},
      direction = {0, 1, 0},
      type = 3,
      size = {93, 1, 35},
      max_distance = 0,
      debug = false
   })

   for _, j in pairs(hitlist) do
      if j.hit_object.getName():find(monsterName) then
         return j.hit_object
      end
   end
   return false
end

function endRound()
   local playArea
   local hitlist = Physics.cast({
      origin = {0.00, 1.73, - 16.67},
      direction = {0, 1, 0},
      type = 3,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   })

   for u, v in pairs(hitlist) do
      if v.hit_object.getName() == "Play Area" then playArea = v.hit_object end
   end

   if playArea == nil then return end

   broadcastToAll("Round ends.", {1, 1, 1})

   playArea.call("checkAMDiscard")

   for _, o in pairs(getAllObjects()) do
      if o.getName() == "Monster Mat" then
         local discard = o.call("getDiscard")
         if discard then
            if discard.tag == "Deck" then
               for _, u in pairs(discard.getObjects()) do
                  if u.description:find("shuffle") then
                     o.call("reshuffle")
                  end
               end
            elseif discard then
               if discard.getDescription():find("shuffle") then
                  o.call("reshuffle")
               end
            end
         end
      elseif o.getName():find("Player Mat") then
         checkReshuffle(o)
      end
   end

   local elements = {"Fire", "Ice", "Air", "Earth", "Light", "Dark"}
   for _, j in pairs(elements) do
      playArea.call("buttonClickedEx", {"low" .. j})
   end

   moveRoundTracker()

   clearIniList()
   tableInilist = {}
   Wait.frames(function() UI.setAttribute("MonsterAbilityCard", "active", false) UI.setAttribute("MACText", "text", "") end, 10)
end

function checkReshuffle(o)
   local hitlist = Physics.cast({
      origin = o.positionToWorld({0.62, 0, - 0.8}),
      direction = {0, 1, 0},
      type = 2,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}
   local shuffle = nil

   for _, c in pairs(hitlist) do
      if c.hit_object.tag == "Deck" then
         for _, u in pairs(c.hit_object.getObjects()) do
            if toCheck[u.name] then
               local card = c.hit_object.takeObject({
                  position = toCheck[u.name],
                  guid = u.guid,
               })
               checkReshuffle(o)
               return
            elseif u.name:find("Shuffle") then
               shuffle = c.hit_object
            end
         end
      elseif c.hit_object.tag == "Card" then
         if toCheck[c.hit_object.getName()] then
            c.hit_object.setPositionSmooth(toCheck[c.hit_object.getName()])
         elseif c.hit_object.getName():find("Shuffle") then
            shuffle = c.hit_object
         end
      end
   end
   if shuffle then
      shuffle.flip()
      shuffle.setPositionSmooth(o.positionToWorld({0.62, 1, - 0.44}))
      Wait.time(
         function()
            local findDeck = Physics.cast({
               origin = o.positionToWorld({0.62, 0, - 0.5}),
               direction = {0, 1, 0},
               type = 2,
               size = {1, 1, 1},
               max_distance = 0,
               debug = false
            }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}
            for x, y in pairs(findDeck) do
               if y.hit_object.tag == "Deck" or y.hit_object.tag == "Card" then
                  Wait.time(function() y.hit_object.shuffle() end, 0.5, 5)
               end
            end
         end,
      1)
   end
end

function checkForBlessCurse(deck)
   if deck.tag == "Deck" then
      for _, u in pairs(deck.getObjects()) do
         if toCheck[u.name] then
            local card = deck.takeObject({
               position = toCheck[u.name],
               guid = u.guid,
               flip = true
            })
         end
      end
   elseif deck.tag == "Card" then
      if toCheck[deck.getName()] then
         deck.setPositionSmooth(toCheck[deck.getName()])
      end
   end
end

function moveRoundTracker()
   local tabInfo = getNotebookTabs()
   local tab = ""
   local tracker = {
      number = -0.6
   }

   for _, t in pairs(tabInfo) do
      if t.title == "Options" then tab = t.body end
   end
   if tab == "" then return end

   if not (tab:match("move:(%a*)") == "yes") then return end
   if tab:match("count:(%a*)") == "up" then
      tracker.number = 0.6
   elseif tab:match("count:(%a*)") ~= "down" then
      return
   end

   local roundTracker = nil
   local startPos = {x = -3.30, y = 1.92, z = -18.86}
   for i = 0, 11 do
      local hitlist = Physics.cast({
         origin = {startPos.x + 0.6 * i, startPos.y, startPos.z},
         direction = {0, 1, 0},
         type = 3,
         size = {1, 1, 1},
         max_distance = 0,
         debug = false
      })

      for u, v in pairs(hitlist) do
         if v.hit_object.getName() == "Round Tracker" then roundTracker = v.hit_object end
      end
   end
   if roundTracker then
      local oldPos = roundTracker.getPosition()
      if oldPos.x < - 3 and tracker.number == -0.6 then
         broadcastToAll("Last Round Ended!", {1, 0, 0})
         return
      end
      if not (oldPos.x > 3 and tracker.number == 0.6) then
         roundTracker.setPosition({oldPos.x + tracker.number, oldPos.y, oldPos.z})
         return
      end
      broadcastToAll("Round 12 Ended!", {1, 0, 0})
   end

end

function drawClicked(player, value, id)
   local origin, discard, color
   if id == nil then
      color = player.color
   else
      color = id
   end

   origin = colorToPlayer[color].AMDeck
   discard = colorToPlayer[color].AMDiscard

   local hitlist = Physics.cast({
      origin = origin,
      direction = {0, 1, 0},
      type = 3,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   })

   local drawn = false
   for _, c in pairs(hitlist) do
      if c.hit_object.tag == "Deck" then
         local newCard = c.hit_object.takeObject({position = discard, flip = true})
         if color == "Black" then
            broadcastToAll("The Monsters drew: " .. newCard.getDescription(), {1, 1, 1})
         elseif shown.soloMode == true then
            broadcastToAll(getClassFromColor(color) .. " drew: " .. newCard.getName(), {1, 1, 1})
         else
            broadcastToAll(player.steam_name .. " (" .. getClassFromColor(color) .. ") drew: " .. newCard.getName(), {1, 1, 1})
         end
         drawn = true
         return
      elseif c.hit_object.tag == "Card" then
         c.hit_object.setPosition(discard)
         c.hit_object.flip()
         if shown.soloMode == true then
            broadcastToAll(getClassFromColor(color) .. " drew: " .. c.hit_object.getName(), {1, 1, 1})
         else
            broadcastToAll(player.steam_name .. " (" .. getClassFromColor(color) .. ") drew: " .. c.hit_object.getName(), {1, 1, 1})
         end
         drawn = true
         return
      end
   end
   if not drawn then

   end
end

function sortHand(player, value, id)
   local handObjects
   if id == nil then
      handObjects = player.getHandObjects(1)
   else
      handObjects = Player[id].getHandObjects(1)
   end

   local cards = {}
   local handPos = {}
   for i, j in pairs(handObjects) do
      table.insert(cards, {j, tonumber(j.getName():sub(-3, - 2))})
      table.insert(handPos, j.getPosition())
   end
   table.sort(cards, function(a, b) return a[2] < b[2] end)
   for i, j in ipairs(cards) do
      j[1].setPosition(handPos[i])
   end
end

function longRest(player, value, id)
   local color
   if id == nil then
      color = player.color
   else
      color = id
   end
   local class = getClassFromColor(color)
   broadcastToAll(class .. " takes a Long Rest.", colorToPlayer[color].color)
   table.insert(tableInilist, {99, 99, class})
end

function getClassFromColor(color)
   local zone = colorToPlayer[color].zone

   for i, j in pairs(getObjectFromGUID(zone).getObjects()) do
      if j.getName() == "Character Mat" then
         return j.getDescription()
      end
   end
end

function createIniList()
   -- Global.UI.setAttribute("iniList", "height", 10 + #tableInilist * 35 + (#tableInilist - 1) * 5)
   -- &#x27A7;
   local xml = Global.UI.getXmlTable()
   for i, j in pairs(xml) do
      if j.attributes.id == "iniList" then
         for k, v in ipairs(tableInilist) do
            local tempTable = {
               tag = "HorizontalLayout",
               attributes = {
               },
               children = {
                  {
                     tag = "Button",
                     attributes = {
                        class = "ini",
                        textColor = "#FFFFFF",
                        onClick = "mark",
                        minWidth = "250",
                        id = "iniEntry" .. k
                     },
                     value = v[1] .. " - " .. v[3]
                  },
                  {
                     tag = "Button",
                     attributes = {
                        class = "ini",
                        active = (v[5] ~= nil) and true or false,
                        textColor = "#FFFFFF",
                        onClick = "getMonsterAC",
                        text = ">",
                        id = "MonsterAbilityCard" .. k
                     }
                  }
               }
            }
            table.insert(xml[i].children[1].children, tempTable)
         end
      end
   end
   Global.UI.setXmlTable(xml)

   Wait.frames(function() Global.UI.setAttribute("iniList", "height", 10 + #tableInilist * 35 + (#tableInilist - 1) * 5) end, 5)
   -- Wait.frames(function() Global.UI.setAttribute("iniList", "height", #tableInilist * 70 + (#tableInilist + 1) * 5) end, 20)
   Wait.frames(remark, 30)
end

function getMonsterAC(player, value, id)
   UI.setAttribute("MonsterAbilityCard", "active", false)
   UI.setAttribute("MACText", "text", "")

   if UI.getAttribute(id, "color") == "rgba(0, 0, 0, 0.95)" then
      for k, v in ipairs(tableInilist) do
         UI.setAttribute("MonsterAbilityCard" .. k, "color", "rgba(0, 0, 0, 0.95)")
         UI.setAttribute("MonsterAbilityCard" .. k, "textColor", "rgba(1, 1, 1, 1)")
      end
      UI.setAttribute(id, "color", "rgba(0.6, 0, 0, 0.95)")
      UI.setAttribute("MACText", "text", tableInilist[tonumber(id:sub(19))][5])
      UI.setAttribute("MonsterAbilityCard", "active", true)
   else
      UI.setAttribute(id, "color", "rgba(0, 0, 0, 0.95)")
   end
   UI.setAttribute(id, "textColor", "rgba(1, 1, 1, 1)")
end

function remark()
   for i, j in ipairs(tableInilist) do
      if j[4] == true then
         mark(nil, nil, "iniEntry" .. i)
      end
   end
end

function clearIniList()
   Global.UI.setAttribute("iniList", "height", 0)
   local xml = Global.UI.getXmlTable()
   for i, j in pairs(xml) do
      if j.attributes.id == "iniList" then
         for k = 1, #xml[i].children[1].children do
            table.remove(xml[i].children[1].children)
         end
      end
   end
   Global.UI.setXmlTable(xml)

end

function showBI(player, value, id)
   if shown.soloMode == false then
      showForPlayer({panel = "BattleInterface", color = player.color})
   else
      showForPlayer({panel = "SoloInterface", color = player.color})
   end
end

function showButtons(player, value, id)
   if shown.buttons == false then
      Global.UI.show("buttons")
      shown.buttons = true
      Global.UI.setAttribute("showButtons", "text", "▲")
   else
      Global.UI.hide("buttons")
      shown.buttons = false
      Global.UI.setAttribute("showButtons", "text", "▼")
   end
end

function showIni(player, value, id)
   showForPlayer({panel = "iniList", color = player.color})
end

function showSolo()
   local settings = {nil,
      {height = "370", imageOffset = "0 155", tableOffset = "0 -165"},
      {height = "460", imageOffset = "0 200", tableOffset = "0 -210"},
      {height = "550", imageOffset = "0 247", tableOffset = "0 -253"},
   }
   local playerCount = 0
   for color, i in pairs(colorToPlayer) do
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

   if playerCount < 2 then
      broadcastToAll("In solo mode you need at least 2 characters", {1, 0, 0})
      return
   end

   Global.UI.setAttribute("SoloInterface", "height", settings[playerCount].height)
   Global.UI.setAttribute("BIImage", "offsetXY", settings[playerCount].imageOffset)
   Global.UI.setAttribute("tableSolo", "offsetXY", settings[playerCount].tableOffset)

   if shown.soloMode == false then
      Global.UI.show("SoloInterface")
      Global.UI.hide("BattleInterface")
      shown.soloMode = true
   else
      Global.UI.hide("SoloInterface")
      Global.UI.show("BattleInterface")
      shown.soloMode = false
   end
end

function spawnerClicked(player, value, id)
   if id == "ScenarioMS" then
      self.UI.setAttribute("ScenarioSpawner", "active", "true")
      self.UI.setAttribute("MonsterSpawner", "active", "false")
   elseif id == "SingleMS" then
      self.UI.setAttribute("MonsterSpawner", "active", "true")
      self.UI.setAttribute("ScenarioSpawner", "active", "false")
   elseif id == "showSpawner" then
      showForPlayer({panel = "Spawner", color = player.color})
   elseif id == "spawnMonster_Button" then
      local partySheet
      for _, obj in pairs(getAllObjects()) do
         if obj.getDescription():find("Party Sheet") then
            partySheet = obj
            break
         end
      end
      if partySheet then
         local oldLevel = partySheet.UI.getAttribute("scenarioLevel", "text")
         partySheet.UI.setAttribute("scenarioLevel", "text", self.UI.getAttribute("MSSLevel", "text"))
         getObjectFromGUID("75ab50").call("spawnMonster", {monsterName = self.UI.getAttribute("monsterDropdown", "selected"), monsterType = self.UI.getAttribute("typeDropdown", "selected"), monsterDifficulty = isElite and "elite" or "normal"})
         Wait.time(function() resetLevel({partySheet, oldLevel}) end, 0.5)
      else
         getObjectFromGUID("75ab50").call("spawnMonster", {monsterName = self.UI.getAttribute("monsterDropdown", "selected"), monsterType = self.UI.getAttribute("typeDropdown", "selected"), monsterDifficulty = isElite and "elite" or "normal"})
      end
   elseif id == "createMap" then
      createMap({tonumber(self.UI.getAttribute("SSScenario", "text"))})
      spawnerClicked(player, value, "showSpawner")
   elseif id == "win" or id == "lost" then
      local classesInPlay = {}
      for color, _ in pairs(colorToPlayer) do
         if color ~= "Black" then
            if getClassFromColor(color) then
               classesInPlay[getClassFromColor(color)] = color
            end
         end
      end
      for _, obj in pairs(getAllObjects()) do
         if classesInPlay[obj.getName()] then
            if obj.tag == "Figurine" then
               obj.setPositionSmooth(colorToPlayer[classesInPlay[obj.getName()]].coin)
               local hpTable = obj.getTable("health")
               Wait.time(function() obj.call("add") end, 0.2, hpTable.max - hpTable.value)
            end
         end
      end
      local levelToGold = {1, 2, 3, 3, 4, 4, 5}
      levelToGold[0] = 1
      local partySheet
      local playArea
      for _, obj in pairs(getAllObjects()) do
         if obj.getDescription():find("Party Sheet") then partySheet = obj end
         if obj.getName() == "Play Area" then playArea = obj end
      end

      if partySheet then
         local level = tonumber(partySheet.UI.getAttribute("scenarioLevel", "text"))
         local tabInfo = getNotebookTabs()
         local tab = ""
         for _, t in pairs(tabInfo) do
            if t.title == "Options" then tab = t.body end
         end
         if tab:match("solo/open information:(%a*)") == "yes" then
            level = level - 1
            if level < 0 then level = 0 end
         end
         for color, t in pairs(colorToPlayer) do
            if color ~= "Black" then
               local class = getClassFromColor(color)
               if class then
                  local coins = 0
                  local charSheet = nil
                  local xpToken = nil
                  local getting = {xp = 0, gold = 0}
                  for _, obj in pairs(getObjectFromGUID(t.zone).getObjects()) do
                     if obj.getName() == "Coin 1" then
                        if obj.getQuantity() > 0 then
                           coins = coins + obj.getQuantity()
                        else
                           coins = coins + 1
                        end
                        obj.destruct()
                     elseif obj.getName() == "Coin 5" then
                        if obj.getQuantity() > 0 then
                           coins = coins + obj.getQuantity() * 5
                        else
                           coins = coins + 5
                        end
                        obj.destruct()
                     elseif obj.getName() == "Character Sheet" then
                        charSheet = obj
                     elseif obj.getName():find("%d+ xp") then
                        xpToken = obj
                     end
                  end
                  if coins > 0 then
                     getting.gold = coins * levelToGold[level]
                  end
                  if xpToken then
                     getting.xp = xpToken.getStateId()
                     xpToken.setState(31)
                  end
                  if id == "win" then
                     getting.xp = getting.xp + 2 + level * 2
                  end
                  broadcastToAll(class .. " got " .. getting.gold .. " Gold and " .. getting.xp .. " XP.", color)
                  local AM = {AMDeck = nil, AMDiscard = nil}
                  for k, v in pairs(t) do
                     if k ~= "color" and k ~= "zone" and k ~= "pre" and k ~= "coin" and k ~= "items" and k ~= "equip" then
                        local hitlist = Physics.cast({
                           origin = v,
                           direction = {0, 1, 0},
                           type = 3,
                           size = {1, 1, 1},
                           max_distance = 0,
                           debug = false
                        })
                        for u, v in pairs(hitlist) do
                           if k == "FC" or k == "SC" or k == "D" or k == "L" or k:find("AS") then
                              if v.hit_object.tag == "Card" or v.hit_object.tag == "Deck" then v.hit_object.deal(20, color) end
                           end
                           if k == "AMDeck" or k == "AMDiscard" then
                              if v.hit_object.tag == "Card" or v.hit_object.tag == "Deck" then
                                 AM[k] = v.hit_object
                              end
                           end
                        end
                     end
                     if k == "equip" then
                        local hitlist = Physics.cast({
                           origin = v,
                           direction = {0, 1, 0},
                           type = 3,
                           size = {18, 1, 1},
                           max_distance = 0,
                           debug = false
                        })
                        for u, v in pairs(hitlist) do
                           if v.hit_object.tag == "Card" or v.hit_object.tag == "Deck" then
                              v.hit_object.setRotation({0, 180, 0})
                           end
                        end
                     end
                     if k == "items" then
                        local hitlist = Physics.cast({
                           origin = v,
                           direction = {0, 1, 0},
                           type = 3,
                           size = {3, 1, 10},
                           max_distance = 0,
                           debug = false
                        })
                        for u, v in pairs(hitlist) do
                           if v.hit_object.tag == "Card" or v.hit_object.tag == "Deck" then
                              v.hit_object.setRotation({0, 180, 0})
                           end
                        end
                     end
                  end

                  local deck
                  if AM.AMDiscard ~= nil and AM.AMDeck ~= nil then
                     deck = AM.AMDeck.putObject(AM.AMDiscard)
                     if not deck.is_face_down then deck.flip() end
                     deck.setPositionSmooth(t.AMDeck)
                  elseif AM.AMDiscard ~= nil then
                     if not AM.AMDiscard.is_face_down then AM.AMDiscard.flip() end
                     AM.AMDiscard.setPositionSmooth(t.AMDeck)
                     deck = AM.AMDiscard
                  else
                     if not AM.AMDeck.is_face_down then AM.AMDeck.flip() end
                     deck = AM.AMDeck
                  end
                  Wait.time(function() deck.shuffle() end, 0.5, 5)
                  Wait.time(function() checkForBlessCurse(deck) end, 3)
               end
            end
         end

         playArea.call("buttonClickedEx", {"AMS"})
         Wait.time(function() playArea.call("checkAMDeck") end, 3)
      end

      if id == "win" then
         broadcastToAll("Check your Battlegoals and read the Scenario Conclusion!", "Orange")
      else
         broadcastToAll("Discard your Battlegoals and try again!", "Orange")
      end

   end
end

function resetLevel(params)
   params[1].UI.setAttribute("scenarioLevel", "text", params[2])
end

function createMap(params)
   -- local spawner = getObjectFromGUID("8d2074")
   local spawner = nil
   for _, obj in pairs(getAllObjects()) do
      if obj.getName() == "Gloomhaven Scenario Full Setup" then
         if spawner == nil then
            spawner = obj
         else
            broadcastToAll('"There are two "Gloomhaven Scenario Full Setup" Objects. Delete one!', "Red")
            return
         end
      end
   end

   if spawner == nil then
      broadcastToAll('"There is no "Gloomhaven Scenario Full Setup" Objects. Get one!', "Red")
      return
   end

   spawner.setVar("NumScenario", params[1])

   local playerCount = {}
   for color, i in pairs(colorToPlayer) do
      if color ~= "Black" then
         for _, j in pairs(getObjectFromGUID(i.zone).getObjects()) do
            if j.getName():find("Player Mat") then
               table.insert(playerCount, color)
            end
         end
      end
   end

   -- if playerCount < 2 then playerCount = 2 end
   -- if playerCount > 4 then playerCount = 4 end

   spawner.setVar("NumCharacters", #playerCount < 2 and 2 or (#playerCount > 4 and 4 or #playerCount))
   if self.UI.getAttribute("HiddenRooms1Image", "image") == "Radio Button Selected" then
      spawner.setVar("TypeMap", 2)
   else
      spawner.setVar("TypeMap", 1)
   end

   if self.UI.getAttribute("typeDropdownScenario", "selected") == "Standee" then
      spawner.setVar("TypeMonster", 1)
   else
      spawner.setVar("TypeMonster", 2)
   end

   local tabInfo = getNotebookTabs()
   local tab = ""

   for _, t in pairs(tabInfo) do
      if t.title == "Options" then tab = t.body end
   end

   if tab:match("setup tool:(%a*)") == "new" then
      getObjectFromGUID(autoSetup_guid).call("createMap", {NumScenario = params[1], NumCharacters = #playerCount < 2 and 2 or (#playerCount > 4 and 4 or #playerCount), HiddenRooms = ((self.UI.getAttribute("HiddenRooms1Image", "image") == "Radio Button Selected") and true or false), MonsterStandee = ((self.UI.getAttribute("typeDropdownScenario", "selected") == "Standee") and true or false)})
   elseif tab:match("setup tool:(%a%a%a)") == "old" then
      spawner.call("createMap")
   end

   hitlist = Physics.cast({
      origin = mamdp,
      direction = {0, 1, 0},
      type = 3,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   })

   for _, v in pairs(hitlist) do
      if v.hit_object.tag == "Deck" or v.hit_object.tag == "Card" then
         hitlist = Physics.cast({
            origin = mamd,
            direction = {0, 1, 0},
            type = 3,
            size = {1, 1, 1},
            max_distance = 0,
            debug = false
         })

         for _, k in pairs(hitlist) do
            if k.hit_object.tag == "Deck" then
               k.hit_object.putObject(v.hit_object)
               Wait.time(function() k.hit_object.shuffle() end, 0.5, 5)
               break
            elseif k.hit_object.tag == "Card" then
               v.hit_object.putObject(k.hit_object)
               v.hit_object.flip()
               v.hit_object.setPositionSmooth(mamd)
               Wait.time(function() v.hit_object.shuffle() end, 0.5, 5)
               break
            end
         end
         break
      end
   end

   -- muss als letztes
   if tab:match("deal battle goals:(%a*)") == "yes" then
      local battleGoals = nil
      local hitlist = Physics.cast({
         origin = {51.60, 1.90, - 16.31},
         direction = {0, 1, 0},
         type = 3,
         size = {1, 1, 1},
         max_distance = 0,
         debug = false
      })

      for u, v in pairs(hitlist) do
         if v.hit_object.tag == "Deck" then battleGoals = v.hit_object end
      end

      if battleGoals == nil then return end

      if battleGoals.getQuantity() < 24 then
         broadcastToAll("There are less then 24 Battle Goals in the Deck. Discard Battle Goals and Deal by hand.", "Red")
         return
      end

      Wait.time(
         function()
            battleGoals.shuffle()
         end,
      0.3, 5)
      Wait.time(
         function()
            for _, color in pairs(playerCount) do
               battleGoals.deal(2, color)
            end
         end,
      3)
   end

end

function showForPlayer(params)
   local panel = params.panel
   local color = params.color
   local opened = self.UI.getAttribute(panel, "visibility")
   if opened == nil then opened = "" end

   if opened:find(color) then
      opened = opened:gsub("|" .. color, "")
      opened = opened:gsub(color .. "|", "")
      opened = opened:gsub(color, "")
      self.UI.setAttribute(panel, "visibility", opened)
      if opened == "" then
         self.UI.setAttribute(panel, "active", "false")
         shown[panel] = false
      end
   else
      if shown[panel] ~= true then
         self.UI.setAttribute(panel, "active", "true")
         self.UI.setAttribute(panel, "visibility", color)
         shown[panel] = true
      else
         self.UI.setAttribute(panel, "visibility", opened .. "|" .. color)
      end
   end
end

function updateSliderValue(player, value, id)
   if id == "SSSlider" then
      self.UI.setAttribute("SSScenario", "text", value)
   elseif id == "MSSlider" then
      self.UI.setAttribute("MSSlevel", "text", value)
   else
      self.UI.setAttribute(id, "value", value)
   end
end

function updateDropdown(player, value, id)
   self.UI.setAttribute(id, "selected", value)
end

function toggleChange(player, value, id)
   if id:find("HiddenRooms") then
      Global.UI.setAttribute(id .. "Image", "image", "Radio Button Selected")
      Global.UI.setAttribute("HiddenRooms" .. value .. "Image", "image", "Radio Button")
   else
      local isOn = Global.UI.getAttribute(id, "isOn")
      if isOn == "true" then
         self.setVar(id, false)
         Global.UI.setAttribute(id, "isOn", "false")
         Global.UI.hide(id .. "Image")
      else
         self.setVar(id, true)
         Global.UI.setAttribute(id, "isOn", "true")
         Global.UI.show(id .. "Image")
      end
   end
end

function cameraControls(player, value, id)
   if id == "showCamControls" then
      showForPlayer({panel = "CameraControl", color = player.color})
   end
end

function cameraPosition(player, button)
   local color
   color = player.color
   if button == "One" then
      Player[color].lookAt({
         position = {x = -36, y = 0, z = -40},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   elseif button == "Two" then
      Player[color].lookAt({
         position = {x = -12, y = 0, z = -40},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   elseif button == "Three" then
      Player[color].lookAt({
         position = {x = 12, y = 0, z = -40},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   elseif button == "Four" then
      Player[color].lookAt({
         position = {x = 36, y = 0, z = -40},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   elseif button == "Five" then
      Player[color].lookAt({
         position = {x = 50, y = 0, z = -40},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   elseif button == "showScenarioBoard" then
      Player[color].lookAt({
         position = {x = 0, y = 0, z = 4.5},
         pitch = 65,
         yaw = 0,
         distance = 40,
      })
   elseif button == "showGameBoard" then
      Player[color].lookAt({
         position = {x = 0, y = 0, z = -20},
         pitch = 90,
         yaw = 0,
         distance = 25,
      })
   end
end

-- function showCamForPlayer(params)
--    local panel = params.panel
--    local color = params.color
--    local opened = self.UI.getAttribute(panel, "visibility")
--    if opened == nil then opened = "" end
--    if opened:find(color) then
--       opened = opened:gsub("|" .. color, "")
--       opened = opened:gsub(color .. "|", "")
--       opened = opened:gsub(color, "")
--       self.UI.setAttribute(panel, "visibility", opened)
--       if opened == "" then
--          self.UI.setAttribute(panel, "active", "false")
--          shown.CameraControls = false
--       end
--    else
--       if shown.CameraControls == false then
--          self.UI.setAttribute(panel, "active", "true")
--          self.UI.setAttribute(panel, "visibility", color)
--          shown.CameraControls = true
--       else
--          self.UI.setAttribute(panel, "visibility", opened .. "|" .. color)
--       end
--    end
-- end

shown = {
   battleInterface = false,
   iniList = true,
   soloMode = false,
   spawner = false,
   CameraControls = false
}

isElite = false
threeD = false

boards = {
   map = "9cc037"
}

colorToPlayer = {
   Red = {zone = "49a4e0",
      color = {0.856, 0.1, 0.094},
      pre = "P1",
      AMDiscard = {-52.72, 1.82, -33.96},
      AMDeck = {-52.70, 1.85, -36.60},
      FC = { - 16.60, 1.82, - 23.70},
      SC = { - 13.40, 1.82, - 23.70},
      coin = { - 36.38, 5, - 42.54},
      AS1 = { - 36.85, 1.85, - 34.79},
      AS2 = { - 33.69, 1.85, - 34.79},
      AS3 = { - 30.53, 1.85, - 34.79},
      AS4 = { - 27.37, 1.85, - 34.79},
      D = { - 40.43, 1.85, - 40.80},
      L = { - 27.37, 1.85, - 40.80},
      equip = { - 37.03, 1.76, - 45.51},
      items = { - 44.39, 1.76, - 38.14}
   },
   White = {zone = "dac936",
      color = {1, 1, 1},
      pre = "P2",
      AMDiscard = {-28.73, 1.82, -33.96},
      AMDeck = {-28.70, 1.88, -36.60},
      FC = { - 9.32, 1.82, - 23.70},
      SC = { - 6.15, 1.82, - 23.70},
      coin = { - 12.25, 5, - 42.54},
      AS1 = { - 12.85, 1.85, - 34.79},
      AS2 = { - 9.69, 1.85, - 34.79},
      AS3 = { - 6.53, 1.85, - 34.79},
      AS4 = { - 3.37, 1.85, - 34.80},
      D = { - 16.43, 1.85, - 40.80},
      L = { - 3.37, 1.85, - 40.81},
      equip = { - 13.03, 1.76, - 45.51},
      items = { - 20.39, 1.76, - 38.14}
   },
   Blue = {zone = "62cd94",
      color = {0.118, 0.53, 1},
      pre = "P3",
      AMDiscard = {-4.72, 1.82, -33.96},
      AMDeck = {-4.70, 1.87, -36.60},
      FC = {6.14, 1.82, - 23.70},
      SC = {9.33, 1.82, - 23.70},
      coin = {11.68, 5, - 42.54},
      AS1 = {11.16, 1.85, - 34.79},
      AS2 = {20.63, 1.85, - 34.80},
      AS3 = {17.48, 1.85, - 34.79},
      AS4 = {14.32, 1.85, - 34.79},
      D = {7.57, 1.85, - 40.80},
      L = {20.63, 1.85, - 40.80},
      equip = {10.97, 1.76, - 45.51},
      items = {3.62, 1.76, - 38.14}
   },
   Green = {zone = "963318",
      color = {0.192, 0.701, 0.168},
      pre = "P4",
      AMDiscard = {19.28, 1.82, -33.96},
      AMDeck = {19.30, 1.87, -36.60},
      FC = {13.41, 1.82, - 23.70},
      SC = {16.58, 1.82, - 23.70},
      coin = {35.63, 5, - 42.54},
      AS1 = {35.16, 1.85, - 34.79},
      AS2 = {38.32, 1.85, - 34.79},
      AS3 = {41.48, 1.85, - 34.79},
      AS4 = {44.63, 1.85, - 34.80},
      D = {31.57, 1.85, - 40.80},
      L = {44.63, 1.85, - 40.81},
      equip = {34.97, 1.76, - 45.51},
      items = {27.62, 1.76, - 38.14}
   },
   Purple = {zone = "78094e",
      color = {0.627, 0.125, 0.941},
      pre = "P5",
      AMDiscard = {43.28, 1.82, -33.96},
      AMDeck = {43.30, 1.87, -36.60},
      FC = {63.22, 1.82, -38.61},
      SC = {66.40, 1.82, -38.66},
      coin = {35.63, 5, - 42.54},
      AS1 = {35.16, 1.85, - 34.79},
      AS2 = {38.32, 1.85, - 34.79},
      AS3 = {41.48, 1.85, - 34.79},
      AS4 = {44.63, 1.85, - 34.80},
      D = {31.57, 1.85, - 40.80},
      L = {44.63, 1.85, - 40.81},
      equip = {34.97, 1.76, - 45.51},
      items = {27.62, 1.76, - 38.14}
   },
   Black = {
      AMDiscard = {2.07, 2, - 11.49},
      AMDeck = { - 2.05, 2, - 11.51}
   }
}


envelopes["Banner Spear"] = {infi = "60bf35", bag = "b59f4d", state = nil, life = 10, HPBarOffset = 65}
envelopes["Blink Blade"] = {infi = "d9e30f", bag = "7e8039", state = nil, life = 8, HPBarOffset = 65}
envelopes["Deathwalker"] = {infi = "ce99a8", bag = "612865", state = nil, life = 6, HPBarOffset = 65}
envelopes["Drifter"] = {infi = "102960", bag = "b51fd8", state = nil, life = 10, HPBarOffset = 65}
envelopes["Necromancer"] = {infi = "e98874", bag = "e61c07", state = nil, life = 6, HPBarOffset = 65}
envelopes["Geminate"] = {infi = "34f948", bag = "c29079", state = nil, life = 8, HPBarOffset = 65}

envelopes["Demolitionist"] = {infi = "aa9c80", bag = "79faa6", state = nil, life = 8, HPBarOffset = 65}
envelopes["Hatchet"] = {infi = "1c647e", bag = "d30e07", state = nil, life = 8, HPBarOffset = 65}
envelopes["Red Guard"] = {infi = "00cfd6", bag = "3e600a", state = nil, life = 10, HPBarOffset = 65}
envelopes["Voidwarden"] = {infi = "25fbbf", bag = "bdf901", state = nil, life = 6, HPBarOffset = 65}

envelopes["Sawbones"] = {infi = "e5148c", bag = "87cff4", state = nil, life = 8, HPBarOffset = 30}
envelopes["Nightshroud"] = {infi = "8f7455", bag = "00c081", state = nil, life = 8, HPBarOffset = 30}
envelopes["Summoner"] = {infi = "0f9847", bag = "170ffc", state = nil, life = 8, HPBarOffset = 30}
envelopes["Beast Tyrant"] = {infi = "89bec7", bag = "21a9a6", state = nil, life = 6, HPBarOffset = 30}
envelopes["Sunkeeper"] = {infi = "bfe08d", bag = "5d0830", state = nil, life = 10, HPBarOffset = 30}
envelopes["Doomstalker"] = {infi = "b7fe6d", bag = "06b993", state = nil, life = 8, HPBarOffset = 30}
envelopes["Berserker"] = {infi = "7ff6c4", bag = "85c93e", state = nil, life = 10, HPBarOffset = 30}
envelopes["Elementalist"] = {infi = "21d7e7", bag = "3656de", state = nil, life = 6, HPBarOffset = 30}
envelopes["Soothsinger"] = {infi = "732351", bag = "0f374f", state = nil, life = 6, HPBarOffset = 30}
envelopes["Quartermaster"] = {infi = "d221fc", bag = "7b4f93", state = nil, life = 10, HPBarOffset = 30}
envelopes["Plagueherald"] = {infi = "10b86a", bag = "52a1ae", state = nil, life = 6, HPBarOffset = 30}
envelopes["Bladeswarm"] = {infi = "7c555d", bag = "0f374f", state = nil, life = 8, HPBarOffset = 30}
envelopes["Diviner"] = {infi = "ae2ea4", bag = "a0ea2c", state = nil, life = 6, HPBarOffset = 30}