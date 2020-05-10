String_TreasureIndexDeck = "Treasure Index Deck - SPOILERS"
fullSetup_guid = "8d2074"
Unlockable_guid = "346ed5"
Scripts_guid = "75ab50"
treasureDeck_guid = "bfef03"

infiniteBagsGUIDs = {
   MapTiles = "4895cd",
   Corridors = "359306",
   DifficultTerrain = "4efdc4",
   HazardousTerrain = "0b51bb",
   -- ObjectiveTokens = "a945e4",
   Obstacles = "c912f5",
   -- ScenarioAidTokens = "0c647c",
   Traps = "0a3abe",
   TreasureChests = "fe14ef",
   Doors = "21be0e",
}
infiniteBagsGUIDs["Coin 1"] = "a41a54"

conversionFromNumberToName = {
   "Corridors",
   "DifficultTerrain",
   "HazardousTerrain",
   "ObjectiveTokens",
   "Obstacles",
   "ScenarioAidTokens",
   "Traps",
   "TreasureChests"
}

tilesGUIDsFromBag = {
   MapTiles = {},
   Corridors = {},
   DifficultTerrain = {},
   HazardousTerrain = {},
   ObjectiveTokens = {},
   Obstacles = {},
   ScenarioAidTokens = {},
   Traps = {},
   TreasureChests = {},
   Doors = {}
}

-- tilesGUIDsFromBag.MapTiles["A1"] = "1216f1"
-- tilesGUIDsFromBag.MapTiles["A2"] = "3a41e2"
-- tilesGUIDsFromBag.MapTiles["A3"] = "ccd9e8"
-- tilesGUIDsFromBag.MapTiles["A4"] = "086d42"
-- tilesGUIDsFromBag.MapTiles["B1"] = "e7b2ac"
-- tilesGUIDsFromBag.MapTiles["B2"] = "854314"
-- tilesGUIDsFromBag.MapTiles["B3"] = "3f53f0"
-- tilesGUIDsFromBag.MapTiles["B4"] = "9b23df"
-- tilesGUIDsFromBag.MapTiles["C1"] = "7b13c0"
-- tilesGUIDsFromBag.MapTiles["C2"] = "d4c4f1"
-- tilesGUIDsFromBag.MapTiles["D1"] = "47de92"
-- tilesGUIDsFromBag.MapTiles["D2"] = "8c0d93"
-- tilesGUIDsFromBag.MapTiles["E1"] = "8339bd"
-- tilesGUIDsFromBag.MapTiles["F1"] = "d7fe48"
-- tilesGUIDsFromBag.MapTiles["G1"] = "3af584"
-- tilesGUIDsFromBag.MapTiles["G2"] = "6cea69"
-- tilesGUIDsFromBag.MapTiles["H1"] = "495677"
-- tilesGUIDsFromBag.MapTiles["H2"] = "085ec0"
-- tilesGUIDsFromBag.MapTiles["H3"] = "6ecaa3"
-- tilesGUIDsFromBag.MapTiles["I1"] = "6729ae"
-- tilesGUIDsFromBag.MapTiles["I2"] = "3a32de"
-- tilesGUIDsFromBag.MapTiles["J1"] = "07c705"
-- tilesGUIDsFromBag.MapTiles["J2"] = "f4e793"
-- tilesGUIDsFromBag.MapTiles["K1"] = "de6864"
-- tilesGUIDsFromBag.MapTiles["K2"] = "c3608a"
-- tilesGUIDsFromBag.MapTiles["L1"] = "6ef06e"
-- tilesGUIDsFromBag.MapTiles["L2"] = "c9a6cb"
-- tilesGUIDsFromBag.MapTiles["L3"] = "d5afd2"
-- tilesGUIDsFromBag.MapTiles["M1"] = "aff402"
-- tilesGUIDsFromBag.MapTiles["N1"] = "71a88d"
--
-- tilesGUIDsFromBag.Corridors["Earth Corridor 1"] = "e815f5"
-- tilesGUIDsFromBag.Corridors["Earth Corridor 2"] = "a7f591"
-- tilesGUIDsFromBag.Corridors["Man Stone Corridor 1"] = "84e181"
-- tilesGUIDsFromBag.Corridors["Man Stone Corridor 2"] = "8893ae"
-- tilesGUIDsFromBag.Corridors["Pressure Plate"] = "1e160c"
-- tilesGUIDsFromBag.Corridors["Stone Corridor 1"] = "15193a"
-- tilesGUIDsFromBag.Corridors["Stone Corridor 2"] = "ceef35"
-- tilesGUIDsFromBag.Corridors["Wooden Corridor 1"] = "5253f7"
-- tilesGUIDsFromBag.Corridors["Wooden Corridor 2"] = "9fd014"
--
-- tilesGUIDsFromBag.DifficultTerrain["Log"] = "01c0ef"
-- tilesGUIDsFromBag.DifficultTerrain["Rubble"] = "34e12b"
-- tilesGUIDsFromBag.DifficultTerrain["Stairs Horizontal"] = "6df219"
-- tilesGUIDsFromBag.DifficultTerrain["Stairs Vertical"] = "0662bf"
-- tilesGUIDsFromBag.DifficultTerrain["Water 1"] = "fabf3b"
-- tilesGUIDsFromBag.DifficultTerrain["Water 2"] = "a53be1"
-- tilesGUIDsFromBag.DifficultTerrain["Water 3"] = "1d225b"
--
-- tilesGUIDsFromBag.HazardousTerrain["Hot Coals 1"] = "68596d"
-- tilesGUIDsFromBag.HazardousTerrain["Hot Coals 2"] = "32270b"
-- tilesGUIDsFromBag.HazardousTerrain["Hot Coals 3"] = "be10ad"
-- tilesGUIDsFromBag.HazardousTerrain["Thorns"] = "5e912f"
--
--
-- tilesGUIDsFromBag.Obstacles["Altar Vertical"] = "463b2f"
-- tilesGUIDsFromBag.Obstacles["Altar Horizontal"] = "ea8a9c"
-- tilesGUIDsFromBag.Obstacles["Barrel"] = "56c9dc"
-- tilesGUIDsFromBag.Obstacles["Bookcase"] = "5fb7bf"
-- tilesGUIDsFromBag.Obstacles["Boulder"] = "ea7cc4"
-- tilesGUIDsFromBag.Obstacles["Boulder 2"] = "83d994"
-- tilesGUIDsFromBag.Obstacles["Boulder 3"] = "497a38"
-- tilesGUIDsFromBag.Obstacles["Bush 1"] = "dfb39c"
-- tilesGUIDsFromBag.Obstacles["Cabinet"] = "ca2cec"
-- tilesGUIDsFromBag.Obstacles["Crate A"] = "95b717"
-- tilesGUIDsFromBag.Obstacles["Crate B"] = "4ddc59"
-- tilesGUIDsFromBag.Obstacles["Crystal"] = "765252"
-- tilesGUIDsFromBag.Obstacles["Dark Pit"] = "b7c60c"
-- tilesGUIDsFromBag.Obstacles["Fountain"] = "6e9943"
-- tilesGUIDsFromBag.Obstacles["Nest"] = "5b6016"
-- tilesGUIDsFromBag.Obstacles["Rock Column"] = "8d22f9"
-- tilesGUIDsFromBag.Obstacles["Sarcophagus A"] = "e28df6"
-- tilesGUIDsFromBag.Obstacles["Sarcophagus B"] = "b8808e"
-- tilesGUIDsFromBag.Obstacles["Shelf"] = "3e42a3"
-- tilesGUIDsFromBag.Obstacles["Stalagmites"] = "0ce4be"
-- tilesGUIDsFromBag.Obstacles["Stone Pillar"] = "a445c0"
-- tilesGUIDsFromBag.Obstacles["Stump"] = "6f7dca"
-- tilesGUIDsFromBag.Obstacles["Table"] = "ffacb0"
-- tilesGUIDsFromBag.Obstacles["Totem"] = "60e999"
-- tilesGUIDsFromBag.Obstacles["Tree"] = "ec2f38"
-- tilesGUIDsFromBag.Obstacles["Wall Section"] = "5ec6f3"
--
-- tilesGUIDsFromBag.Traps["Bear Trap"] = "e01292"
-- tilesGUIDsFromBag.Traps["Poison Gas"] = "563a41"
-- tilesGUIDsFromBag.Traps["Spike Trap"] = "723c8a"
--
-- tilesGUIDsFromBag.TreasureChests["Treasure Chest Horizontal"] = "b4295c"
-- tilesGUIDsFromBag.TreasureChests["Treasure Chest Vertical"] = "8a27c1"
--
-- tilesGUIDsFromBag.Doors["Stone Door Horizontal"] = "ceedf1"
-- tilesGUIDsFromBag.Doors["Stone Door Vertical"] = "366d4a"
-- tilesGUIDsFromBag.Doors["Dark Fog"] = "ffdf39"
-- tilesGUIDsFromBag.Doors["LIght Fog"] = "39c3b8"
-- tilesGUIDsFromBag.Doors["Wooden Door Horizontal"] = "76956a"
-- tilesGUIDsFromBag.Doors["Wooden Door Vertical"] = "75481a"

scenarioPageList = {3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 18, 19, 20, 22, 23, 24, 25, 26, 28, 29, 31, 32, 34, 35, 37, 38, 39, 40, 41, 43, 44, 45, 46, 47, 49, 50, 51, 53, 54, 56, 57, 58, 60, 61, 62, 63, 64, 65, 66, 68, 69, 71, 72, 73, 74, 75, 76, 77, 78, 80, 81, 82, 83, 84, 86, 87, 88, 89, 90, 92, 93, 94, 95, 96, 97, 99, 100, 101, 103, 104, 105, 106, 107, 108, 110, 111, 112, 113, 114, 115, 116, 117, 118}

function getBagContent(bag, name)
   if bag == nil then return end
   for _, obj in pairs(bag.getObjects()) do
      if tilesGUIDsFromBag[name][obj.name] then return end
      tilesGUIDsFromBag[name][obj.name] = obj.guid
   end
end

function createMap(params)
   --params.NumScenario > 1-95
   --params.NumCharacters > 1-4
   --params.HiddenRooms > true/false
   --params.MonsterStandee > true/false

   local scenarioInformation = getObjectFromGUID(fullSetup_guid).getTable("ScenarioInformation_All")[params.NumScenario]
   local startingRooms = {}
   local doorsToSpawn = {}

   -- scenario page
   local tabInfo = getNotebookTabs()
   local tab = ""
   local spawn3D = false

   for _, t in pairs(tabInfo) do
      if t.title == "Options" then tab = t.body end
   end
   if tab ~= "" then
      local settings = tab:match("scenario page:(%a+)")
      if settings == "spawn" then
         spawnScenarioPages(scenarioInformation.scenarioPages)
      elseif settings == "change" then
         for _, obj in pairs(getAllObjects()) do
            if params.NumScenario < 96 and obj.getName() == "Scenario Book" then
               obj.book.setPage(scenarioPageList[params.NumScenario] - 1, false)
               break
            end
         end
      end
      spawn3D = tab:match("3D model:(%a+)")
   end
   if scenarioInformation.gridType == nil then
      broadcastToAll("Check the Scenario Book for this Scenario!", "Red")
      return
   end
   Grid.type = scenarioInformation.gridType + 1
   -- Place Map Tiles
   local mapTiles = getBagFromInfinite(infiniteBagsGUIDs.MapTiles)
   getBagContent(mapTiles, "MapTiles")
   local startRooms = true
   for k, v in pairs(scenarioInformation.mapTiles) do
      if not checkPosForName(v.position, v.tile) then
         mapTiles.takeObject({position = v.position, rotation = v.rotation, smooth = false, guid = tilesGUIDsFromBag.MapTiles[v.tile]}).lock()
      end

      if startRooms then
         table.insert(startingRooms, v.tile)
      end

      if v.startTiles ~= nil then
         startRooms = false
         if params.HiddenRooms then break end
      end
   end
   mapTiles.destruct()

   -- Place Overlay Tiles
   for i = 1, #startingRooms do
      --Monster
      if scenarioInformation.mapTiles[i].monsters ~= nil then
         for _, v in pairs(scenarioInformation.mapTiles[i].monsters) do
            for _, t in ipairs(v.tiles) do
               if t.numCharacters[params.NumCharacters] ~= nil then
                  local parameter = {}
                  --Set Parameters
                  parameter.monsterName = v.name
                  if params.MonsterStandee then
                     parameter.monsterType = "Standee"
                  else
                     if scenarioInformation.gridType == 1 then
                        parameter.monsterType = "Horizontal"
                     elseif scenarioInformation.gridType == 2 then
                        parameter.monsterType = "Vertical"
                     end
                  end
                  if t.numCharacters[params.NumCharacters] == 1 then
                     parameter.monsterDifficulty = "normal"
                  elseif t.numCharacters[params.NumCharacters] == 2 then
                     parameter.monsterDifficulty = "elite"
                  end
                  parameter.monsterPosition = t.position
                  --Call Spawn Monster
                  getObjectFromGUID(Scripts_guid).call("spawnMonster", parameter)
               end
            end
         end
      end
      --Overlay Tiles
      if scenarioInformation.mapTiles[i].overlayTiles ~= nil then
         for _, v in pairs(scenarioInformation.mapTiles[i].overlayTiles) do
            local tilesBag = getBagFromInfinite(infiniteBagsGUIDs[conversionFromNumberToName[v.bag]])
            getBagContent(tilesBag, conversionFromNumberToName[v.bag])
            local deleteBag = true
            for _, t in pairs(v.type) do
               if t.name == "Coin 1" then
                  tilesBag = getObjectFromGUID(infiniteBagsGUIDs[t.name])
                  deleteBag = false
                  for _, l in pairs(t.tiles) do
                     if not checkPosForName(l.position, t.name) then
                        tilesBag.takeObject({position = l.position, rotation = l.rotation, smooth = false})
                     end
                  end
               else
                  if spawn3D == "exchange" then
                     if tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Horizontal", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Horizontal", "") .. " (3D)"
                     elseif tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Vertical", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Vertical", "") .. " (3D)"
                     end
                     if t.name == "Table (3D)" then
                        for k in pairs(t.tiles) do
                           t.tiles[k].rotation = {x = t.tiles[k].rotation.x, y = t.tiles[k].rotation.y, z = 0}
                        end
                     end
                  end
                  local tile = checkPosForName(t.tiles[1].position, t.name)
                  if not tile then
                     tile = tilesBag.takeObject({position = t.tiles[1].position, rotation = t.tiles[1].rotation, smooth = false, guid = tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name]})
                     Wait.condition(function() tile.lock() end, function() return checkLoaded(tile) end)
                     if t.name:find("Treasure") then
                        Wait.condition(function() setScript(tile, "Treasure", t.tiles[1].params.buttonLabel, NumScenario) end, function() return checkLoaded(tile) end)
                     end
                  end
                  for k, l in pairs(t.tiles) do
                     if k > 1 then
                        if getObjectFromGUID(tile) ~= nil then
                           tile = getObjectFromGUID(tile)
                        end
                        if not checkPosForName(l.position, t.name) then
                           local obj = tile.clone()
                           obj.setPosition(l.position)
                           obj.setRotation(l.rotation)
                           obj.lock()
                        end
                     end
                  end
                  if spawn3D == "add" then
                     if tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Horizontal", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Horizontal", "") .. " (3D)"
                     elseif tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Vertical", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Vertical", "") .. " (3D)"
                     end
                     if t.name == "Table (3D)" then
                        for k in pairs(t.tiles) do
                           t.tiles[k].rotation = {x = t.tiles[k].rotation.x, y = t.tiles[k].rotation.y, z = 0}
                        end
                     end
                     local tile = checkPosForName(t.tiles[1].position, t.name)
                     if not tile then
                        tile = tilesBag.takeObject({position = t.tiles[1].position, rotation = t.tiles[1].rotation, smooth = false, guid = tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name]})
                        Wait.condition(function() tile.lock() end, function() return checkLoaded(tile) end)
                        if t.name:find("Treasure") then
                           Wait.condition(function() setScript(tile, "Treasure", t.tiles[1].params.buttonLabel, NumScenario) end, function() return checkLoaded(tile) end)
                        end
                     end
                     for k, l in pairs(t.tiles) do
                        if k > 1 then
                           if getObjectFromGUID(tile) ~= nil then
                              tile = getObjectFromGUID(tile)
                           end
                           if not checkPosForName(l.position, t.name) then
                              local obj = tile.clone()
                              obj.setPosition(l.position)
                              obj.setRotation(l.rotation)
                              obj.lock()
                           end
                        end
                     end
                  end
               end
            end
            if deleteBag then
               tilesBag.destruct()
            end
         end
      end
      --Start Tiles
      if scenarioInformation.mapTiles[i].startTiles ~= nil then
         local doorName = scenarioInformation.mapTiles[i].startTiles.name
         local doorsBag = getBagFromInfinite(infiniteBagsGUIDs.Corridors)
         getBagContent(doorsBag, "Corridors")
         local door = checkPosForName(scenarioInformation.mapTiles[i].startTiles.tiles[1].position, doorName)
         if not door then
            door = doorsBag.takeObject({position = scenarioInformation.mapTiles[i].startTiles.tiles[1].position, rotation = scenarioInformation.mapTiles[i].startTiles.tiles[1].rotation, smooth = false, guid = tilesGUIDsFromBag.Corridors[doorName]})
            Wait.condition(function() door.lock() door.setName("Start Area") end, function() return checkLoaded(door) end)
            setScript(door, "Start", nil, nil)
         end
         for k, l in pairs(scenarioInformation.mapTiles[i].startTiles.tiles) do
            if k > 1 then
               if getObjectFromGUID(door) ~= nil then
                  door = getObjectFromGUID(door)
               end
               if not checkPosForName(l.position, doorName) then
                  local obj = door.clone()
                  obj.setPosition(l.position)
                  obj.setRotation(l.rotation)
                  obj.lock()
                  obj.setName("Start Area")
               end
            end
         end
         doorsBag.destruct()
      end
      --Doors
      if scenarioInformation.doorTiles ~= nil then
         for k, v in pairs(scenarioInformation.doorTiles) do
            for _, doorTile in pairs(v.tiles) do
               local adjacentTiles = ""
               for _, adjTile in pairs(doorTile.adjacentTiles) do
                  adjacentTiles = adjacentTiles .. adjTile
               end
               if adjacentTiles:find(startingRooms[i]) then
                  if doorsToSpawn[v.name] == nil then
                     doorsToSpawn[v.name] = {}
                  end
                  for _, starting in pairs(startingRooms) do
                     adjacentTiles = adjacentTiles:gsub(starting, "")
                  end
                  table.insert(doorsToSpawn[v.name], {position = doorTile.position, rotation = doorTile.rotation, adjacentTile = adjacentTiles})
               end
            end
         end
      end
   end

   placeDoor(doorsToSpawn, params.NumScenario, params.MonsterStandee, params.NumCharacters)

   if not params.HiddenRooms then
      for k, v in pairs(scenarioInformation.monsterList) do
         local monsterInfo = {monsterName = v, monsterPlacement = false}
         if params.MonsterStandee then
            monsterInfo.monsterType = "Standee"
         else
            if scenarioInformation.gridType == 1 then
               monsterInfo.monsterType = "Horizontal"
            elseif scenarioInformation.gridType == 2 then
               monsterInfo.monsterType = "Vertical"
            end
         end
         getObjectFromGUID(Scripts_guid).call("spawnMonster", monsterInfo)
      end
   end

end

function revealRoom(params)
   local scenarioInformation = getObjectFromGUID(fullSetup_guid).getTable("ScenarioInformation_All")[params.NumScenario]
   local roomInformation = {}
   local doorsToSpawn = {}
   local mapTilesSpawned = false
   local tabInfo = getNotebookTabs()
   local tab = ""
   local spawn3D = false

   for _, t in pairs(tabInfo) do
      if t.title == "Options" then tab = t.body end
   end
   if tab ~= "" then
      spawn3D = tab:match("3D model:(%a+)")
   end

   -- Place Map Tiles
   local mapTiles = getBagFromInfinite(infiniteBagsGUIDs.MapTiles)
   getBagContent(mapTiles, "MapTiles")
   for k, v in pairs(scenarioInformation.mapTiles) do
      if params.room:find(v.tile) then
         table.insert(roomInformation, v)
         if not checkPosForName(v.position, v.tile) then
            mapTiles.takeObject({position = v.position, rotation = v.rotation, smooth = false, guid = tilesGUIDsFromBag.MapTiles[v.tile]}).lock()
            mapTilesSpawned = true
         end
         if scenarioInformation.doorTiles ~= nil then
            for i, j in pairs(scenarioInformation.doorTiles) do
               for _, doorTile in pairs(j.tiles) do
                  local adjacentTiles = ""
                  for _, adjTile in pairs(doorTile.adjacentTiles) do
                     adjacentTiles = adjacentTiles .. adjTile
                  end
                  if adjacentTiles:find(scenarioInformation.mapTiles[k].tile) then
                     if doorsToSpawn[j.name] == nil then
                        doorsToSpawn[j.name] = {}
                     end
                     adjacentTiles = adjacentTiles:gsub(scenarioInformation.mapTiles[k].tile, "")
                     table.insert(doorsToSpawn[j.name], {position = doorTile.position, rotation = doorTile.rotation, adjacentTile = adjacentTiles})
                  end
               end
            end
         end
      end
   end
   mapTiles.destruct()

   for _, room in pairs(roomInformation) do
      if room.monsters ~= nil then
         local tableToSpawn = {}
         for _, v in pairs(room.monsters) do
            for _, t in ipairs(v.tiles) do
               if t.numCharacters[params.NumCharacters] ~= nil then
                  local parameter = {}
                  --Set Parameters
                  parameter.monsterName = v.name
                  if params.MonsterStandee then
                     parameter.monsterType = "Standee"
                  else
                     if scenarioInformation.gridType == 1 then
                        parameter.monsterType = "Horizontal"
                     elseif scenarioInformation.gridType == 2 then
                        parameter.monsterType = "Vertical"
                     end
                  end
                  if t.numCharacters[params.NumCharacters] == 1 then
                     parameter.monsterDifficulty = "normal"
                  elseif t.numCharacters[params.NumCharacters] == 2 then
                     parameter.monsterDifficulty = "elite"
                  end
                  parameter.monsterPosition = t.position
                  if tableToSpawn[v.name] == nil then tableToSpawn[v.name] = {} end
                  table.insert(tableToSpawn[v.name], parameter)
               end
            end
         end
         for _, monster in pairs(tableToSpawn) do
            for _, individual in pairs(monster) do
               --Call Spawn Monster
               getObjectFromGUID(Scripts_guid).call("spawnMonster", individual)
            end
         end
      end


      if room.overlayTiles ~= nil then
         for _, v in pairs(room.overlayTiles) do
            local tilesBag = getBagFromInfinite(infiniteBagsGUIDs[conversionFromNumberToName[v.bag]])
            getBagContent(tilesBag, conversionFromNumberToName[v.bag])
            local deleteBag = true
            for _, t in pairs(v.type) do
               if t.name == "Coin 1" then
                  tilesBag = getObjectFromGUID(infiniteBagsGUIDs[t.name])
                  deleteBag = false
                  for _, l in pairs(t.tiles) do
                     if not checkPosForName(l.position, t.name) then
                        tilesBag.takeObject({position = l.position, rotation = l.rotation, smooth = false})
                     end
                  end
               else
                  if spawn3D == "exchange" then
                     if tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Horizontal", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Horizontal", "") .. " (3D)"
                     elseif tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Vertical", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Vertical", "") .. " (3D)"
                     end
                     if t.name == "Table (3D)" then
                        for k in pairs(t.tiles) do
                           t.tiles[k].rotation = {x = t.tiles[k].rotation.x, y = t.tiles[k].rotation.y, z = 0}
                        end
                     end
                  end
                  local tile = checkPosForName(t.tiles[1].position, t.name)
                  if not tile then
                     tile = tilesBag.takeObject({position = t.tiles[1].position, rotation = t.tiles[1].rotation, smooth = false, guid = tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name]})
                     Wait.condition(function() tile.lock() end, function() return checkLoaded(tile) end)
                     if t.name:find("Treasure") then
                        Wait.condition(function() setScript(tile, "Treasure", t.tiles[1].params.buttonLabel, NumScenario) end, function() return checkLoaded(tile) end)
                     end
                  end
                  for k, l in pairs(t.tiles) do
                     if k > 1 then
                        if getObjectFromGUID(tile) ~= nil then
                           tile = getObjectFromGUID(tile)
                        end
                        if not checkPosForName(l.position, t.name) then
                           local obj = tile.clone()
                           obj.setPosition(l.position)
                           obj.setRotation(l.rotation)
                           obj.lock()
                           if t.name:find("Treasure") then
                              Wait.condition(function() setScript(obj, "Treasure", l.params.buttonLabel, NumScenario) end, function() return checkLoaded(obj) end)
                           end
                        end
                     end
                  end
                  if spawn3D == "add" then
                     if tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Horizontal", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Horizontal", "") .. " (3D)"
                     elseif tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name:gsub(" Vertical", "") .. " (3D)"] then
                        t.name = t.name:gsub(" Vertical", "") .. " (3D)"
                     end
                     if t.name == "Table (3D)" then
                        for k in pairs(t.tiles) do
                           t.tiles[k].rotation = {x = t.tiles[k].rotation.x, y = t.tiles[k].rotation.y, z = 0}
                        end
                     end
                     local tile = checkPosForName(t.tiles[1].position, t.name)
                     if not tile then
                        tile = tilesBag.takeObject({position = t.tiles[1].position, rotation = t.tiles[1].rotation, smooth = false, guid = tilesGUIDsFromBag[conversionFromNumberToName[v.bag]][t.name]})
                        Wait.condition(function() tile.lock() end, function() return checkLoaded(tile) end)
                        if t.name:find("Treasure") then
                           Wait.condition(function() setScript(tile, "Treasure", t.tiles[1].params.buttonLabel, NumScenario) end, function() return checkLoaded(tile) end)
                        end
                     end
                     for k, l in pairs(t.tiles) do
                        if k > 1 then
                           if getObjectFromGUID(tile) ~= nil then
                              tile = getObjectFromGUID(tile)
                           end
                           if not checkPosForName(l.position, t.name) then
                              local obj = tile.clone()
                              obj.setPosition(l.position)
                              obj.setRotation(l.rotation)
                              obj.lock()
                              if t.name:find("Treasure") then
                                 Wait.condition(function() setScript(obj, "Treasure", l.params.buttonLabel, NumScenario) end, function() return checkLoaded(obj) end)
                              end
                           end
                        end
                     end
                  end
               end
            end
            if deleteBag then
               tilesBag.destruct()
            end
         end
      end
   end
   placeDoor(doorsToSpawn, params.NumScenario, params.MonsterStandee, params.NumCharacters)
end

function setScript(obj, typ, info, NumScenario, MonsterStandee, NumCharacters)
   local ScriptConstruct = "revealRoom = true"
   .. "\nfunction onLoad()"
   .. "\n	local open = false"
   .. "\n	local ButtonTable = {"
   .. "\n		click_function	= 'selfFunction'"
   .. "\n		,function_owner	= self"
   .. "\n		,position		= {x=0,y=0,z=0}"
   .. "\n		,rotation		= {x=0,y=180-self.getRotation().y,z=0}"
   if typ == "Door" then
      ScriptConstruct = ScriptConstruct
      .. "\n		,label			= ' Door'"
      .. "\n		,color			= {0.408,0.525,0.910}"
      .. "\n		,height			= 250"
      .. "\n		,width			= 500"
      .. "\n		,font_size		= 200"
   elseif typ == "Start" then
      ScriptConstruct = ScriptConstruct
      .. "\n		,label			= ' Start'"
      .. "\n		,color			= {0.612,0.678,0.741}"
      .. "\n		,height			= 250"
      .. "\n		,width			= 500"
      .. "\n		,font_size		= 200"
   elseif typ == "Treasure" then
      ScriptConstruct = ScriptConstruct
      .. "\n		,label			= '" .. info .. "'"
      .. "\n		,color			= {0.941,0.694,0.027}"
      .. "\n		,height			= 250"
      .. "\n		,width			= 280"
      .. "\n		,font_size		= 200"
   end
   ScriptConstruct = ScriptConstruct
   .. "\n	}"
   if typ == "Door" then
      ScriptConstruct = ScriptConstruct
      .. "\n	if"
      .. "\n		self.getName() == 'Stone Door Horizontal'"
      .. "\n		or self.getName() == 'Stone Door Vertical'"
      .. "\n		or self.getName() == 'Wooden Door Horizontal'"
      .. "\n		or self.getName() == 'Wooden Door Vertical'"
      .. "\n	then"
      .. "\n		ButtonTable.position.y = -0.13"
      .. "\n		ButtonTable.rotation.z = 180"
      .. "\n	end"
      .. "\n"
      .. "\n	if ButtonTable.label == 'Teleport' then"
      .. "\n		ButtonTable.width = 700"
      .. "\n	end"
   end

   ScriptConstruct = ScriptConstruct
   .. "\n	self.createButton(ButtonTable)"
   .. "\nend"
   .. "\n"
   .. "\nfunction selfFunction()"
   if typ == "Door" then
      ScriptConstruct = ScriptConstruct
      .. "\n	if not open then open = true self.editButton({index=0, label='Open?'}) return end"
      .. "\n	local params = {"
      .. "\n			room = '" .. info .. "'"
      .. "\n			,NumCharacters = " .. NumCharacters
      .. "\n			,MonsterStandee = " .. (MonsterStandee == true and "true" or "false")
      .. "\n			,NumScenario = " .. NumScenario
      .. "\n	}"
      .. "\n	if revealRoom then getObjectFromGUID('" .. self.getGUID() .. "').call('revealRoom',params) end"
      .. "\n	self.unlock()"
      .. "\n	self.flip()"
      .. "\n	Wait.condition(function() self.lock() end, function() return self.resting end, 10)"
   elseif typ == "Start" then
      ScriptConstruct = ScriptConstruct
      .. "\n	local AllObjects = getAllObjects()"
      .. "\n"
      .. "\n	for _,obj in ipairs(AllObjects) do"
      .. "\n		if obj.getName() == 'Start Area' then"
      .. "\n			obj.destruct()"
      .. "\n		end"
      .. "\n	end"
   elseif typ == "Treasure" and info ~= "G" then
      ScriptConstruct = ScriptConstruct
      .. "\n	local params = {"
      .. "\n		card = " .. info
      .. "\n		,guid = self.guid"
      .. "\n}"
      .. "\n	getObjectFromGUID('" .. self.getGUID() .. "').call('getTreasureCard',params)"
   end
   ScriptConstruct = ScriptConstruct
   .. "\nend"
   obj.setLuaScript(ScriptConstruct)
end

function placeDoor(doorsToSpawn, NumScenario, MonsterStandee, NumCharacters)
   local faceUpDoors = {}
   faceUpDoors["LIght Fog"] = true
   faceUpDoors["Dark Fog"] = true
   -- Place Door Tiles
   local doorTiles = getBagFromInfinite(infiniteBagsGUIDs.Doors)
   getBagContent(doorTiles, "Doors")
   for k, v in pairs(doorsToSpawn) do
      local door = checkPosForName(v[1].position, k)
      if not door then
         door = doorTiles.takeObject({position = v[1].position, rotation = v[1].rotation, smooth = false, guid = tilesGUIDsFromBag.Doors[k]})
         Wait.condition(function() door.lock() end, function() return checkLoaded(door) end)
         Wait.condition(function() setScript(door, "Door", v[1].adjacentTile, NumScenario, MonsterStandee, NumCharacters) end, function() return checkLoaded(door) end)
      else
         local obj = getObjectFromGUID(door)
         obj.setVar("revealRoom", false)
      end
      if #v > 1 then
         for c, l in pairs(v) do
            if c > 1 then
               if getObjectFromGUID(door) ~= nil then
                  door = getObjectFromGUID(door)
               end
               local doorToCheck = checkPosForName(l.position, k)
               if not doorToCheck then
                  local obj = door.clone()
                  obj.setPosition(l.position)
                  obj.setRotation(l.rotation)
                  obj.lock()
                  setScript(obj, "Door", l.adjacentTile, NumScenario, MonsterStandee, NumCharacters)
               else
                  Wait.frames(
                     function()
                        local obj = getObjectFromGUID(doorToCheck)
                        obj.setVar("revealRoom", false)
                     end,
                  1)
               end
            end
         end
      end
   end
   doorTiles.destruct()
end

function spawnScenarioPages(params)
   local position = {x = -28.937500, y = 1.799863, z = 3.788861}

   if #params == 2 then position.x = position.x - 10.5 end

   for _, i in ipairs(params) do
      i.type = "Custom_Token"
      i.position = position
      i.rotation = {x = 0, y = 180, z = 0}
      i.scale = {x = 3, y = 1, z = 3}
      i.sound = false
      i.snap_to_grid = true

      spawnObject(i).setCustomObject(i)
      position.x = position.x + 10.5
   end
end

--Get Treasure Card
function getTreasureCard(params)
   local Unlockable = getObjectFromGUID(Unlockable_guid)
   local CardName = ""
   local deck = nil
   local foundInChest = false

   --Draw Treasure Deck out of Unlockable Chest
   for _, obj in ipairs(Unlockable.getObjects()) do
      if obj.name == String_TreasureIndexDeck then
         local pos = Unlockable.getPosition()
         pos.y = pos.y - 10
         deck = Unlockable.takeObject({
            guid = obj.guid
            , position = pos
            , smooth = false
         })
         foundInChest = true
         break
      end
   end

   if deck == nil then
      deck = getObjectFromGUID(treasureDeck_guid)
      if deck ~= nil then
         if deck.getName() ~= String_TreasureIndexDeck then
            deck = findTreasureDeck()
         end
      else
         deck = findTreasureDeck()
      end
   end

   if deck == nil then
      broadcastToAll("Treasure Deck not found!", "Red")
      return
   end

   if params.card < 10 then CardName = CardName .. "0" end
   CardName = CardName .. params.card

   for _, card in ipairs(deck.getObjects()) do
      if card.nickname:find(CardName) then
         deck.takeObject({
            guid = card.guid
            , position = {x = -22.312502, y = 1.771799, z = 3.788862}
            , rotation = {x = -0.000252, y = 180.000000, z = -0.000764}
            , smooth = false
         }).lock()
         break
      end
   end

   if foundInChest then
      Unlockable.putObject(deck)
   end
   getObjectFromGUID(params.guid).destruct()
end

function findTreasureDeck()
   for _, obj in pairs(getAllObjects()) do
      if obj.getName() == String_TreasureIndexDeck then
         return obj
      end
   end
   return nil
end

function checkPosForName(pos, name)
   local hitlist = Physics.cast({
      origin = pos,
      direction = {0, 1, 0},
      type = 3,
      size = {1, 20, 1},
      max_distance = 0,
      debug = false
   })

   for u, v in pairs(hitlist) do
      if v.hit_object.getName():find(name) then return v.hit_object.getGUID() end
   end
   return nil
end

function getBagFromInfinite(guid)
   local infiniteBag = getObjectFromGUID(guid)
   if infiniteBag ~= nil then
      local pos = infiniteBag.getPosition()
      pos.y = pos.y - 5
      local bag = infiniteBag.takeObject({position = pos, smooth = false})
      Wait.condition(function() bag.lock() end, function() return checkLoaded(bag) end)
      return bag
   end
end

function checkLoaded(obj)
   if not obj.loading_custom and not obj.spawning then
      return true
   end

   return false
end