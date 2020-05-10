prosp = {
   {min = 0, max = 999},
   {min = 1, max = 14},
   {min = 15, max = 21},
   {min = 22, max = 28},
   {min = 29, max = 35},
   {min = 36, max = 42},
   {min = 43, max = 49},
   {min = 50, max = 56},
   {min = 57, max = 63},
   {min = 64, max = 70},
   {min = 71, max = 95},
   {min = 71, max = 95},
   {min = 96, max = 133},
   {min = 134, max = 150}
}

function onLoad(save_state)

   buttonParameter = {
      function_owner = self,
      label = "",
      width = 400,
      height = 200,
      color = {0, 0, 0, 0},
      tooltip = "Lay out cards"
   }

   for i = 0, 13 do
      buttonParameter.position = { - 7.8 + 1.2 * i, 0.1, 0.7}
      self.setVar("button" .. i, function () layOut(i) end)
      buttonParameter.click_function = "button" .. i
      self.createButton(buttonParameter)
   end
end

function layOut(i)
   local pos = self.positionToWorld({7.8 - 1.2 * i, 0.5, - 0.16})
   local deck = checkForDeck(pos)

   if deck then
      for _, _ in pairs(deck.getObjects()) do
         deck.takeObject({
            position = getPosOrGetCards(),
            rotation = {0.00, 180.00, 0.00},
            smooth = false,
            flip = true,
            guid = getlowest(deck)
         })
      end
   else
      local foundCards = getPosOrGetCards(i)
      for h, card in pairs(foundCards) do
         -- card.setPosition({pos.x, pos.y + (#foundCards - h)*0.2, pos.z})
         card.setPosition({pos.x, 3, pos.z})
         card.setRotation({0, 90, 180})
      end
   end
end

function getlowest(deck)
   local cards = {}
   for i, j in pairs(deck.getObjects()) do
      local number = j.description:gsub("blue", "")
      number = number:gsub("red", "")
      table.insert(cards, {j.guid, tonumber(number)})
   end
   table.sort(cards, function(a, b) return a[2] < b[2] end)
   if #cards == 0 then return nil end
   return cards[1][1]
end

function checkForDeck(pos)
   local hitlist = Physics.cast({
      origin = pos,
      direction = {0, 1, 0},
      type = 2,
      size = {1, 1, 1},
      max_distance = 0,
      debug = false
   }) -- returns {{Vector point, Vector normal, float distance, Object hit_object}, ...}

   for i, j in pairs(hitlist) do
      if j.hit_object.tag == "Deck" then
         return j.hit_object
      end
   end

   return false
end

function getPosOrGetCards(d)
   local i, v = 0, 0
   local wasObjFound = false
   local posToCheck = {}
   local objFound = {}
   repeat
      posToCheck = { - 38.09 + 2.63 * i, 1.75, 34.21 + 4.52 * v}
      local wasObjFound = checkPosition(posToCheck)
      if wasObjFound == false then
         if d == nil then
            return posToCheck
         end
      elseif d ~= nil then
         local number = prosp[d + 1]
         local desc = wasObjFound.getDescription()
         local change = 0

         desc, change = desc:gsub("blue", "")
         if change ~= 0 then
            change = 11
         else
            desc, change = desc:gsub("red", "")
            if change ~= 0 then
               change = 10
            else
               change = d
            end
         end
         if tonumber(desc) ~= nil then
            if tonumber(desc) <= number.max and tonumber(desc) >= number.min and (change == d or d == 0) then
               table.insert(objFound, wasObjFound)
            end
         end
      end
      i = i + 1
      if i > 29 then
         i = 0
         v = v + 1
      end
   until v > 12
   if d == nil then return nil
   else return objFound
   end
end

function checkPosition(pos)
   local hitList = Physics.cast({
      origin = pos, direction = {0, 1, 0}, type = 2,
      size = {1, 1, 1}, max_distance = 0, debug = false
   })
   for _, entry in ipairs(hitList) do
      if entry.hit_object.guid ~= "7ef9dd" and entry.hit_object.guid ~= "577a97" then
         return entry.hit_object
      end
   end
   return false
end