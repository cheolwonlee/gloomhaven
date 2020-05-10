uiValues = {}

function onload(saved_data)

  loaded_data = JSON.decode(saved_data)
  if loaded_data ~= nil then
    self.UI.setXml(loaded_data)
	end

end

function onSave()
	local saved_data = JSON.encode(self.UI.getXml())
	-- saved_data = ""
	return saved_data
end

function addSub(param)
  local id = param[1]
  local amount = param[2]
  local value = tonumber(self.UI.getAttribute(id, "text")) + amount
  local playerLvlList = {playeronelvl = true, playertwolvl = true, playerthreelvl = true, playerfourlvl = true}
  if id == "partyReputation" then
    local shopPrice = 0
    if value > 20 then value = 20
    elseif value < -20 then value = -20 end
    if ((value >= 19) and (value <= 20)) then shopPrice = -5
    elseif ((value >= 15) and (value <= 18)) then shopPrice = -4
    elseif ((value >= 11) and (value <= 14)) then shopPrice = -3
    elseif ((value >= 7) and (value <= 10)) then shopPrice = -2
    elseif ((value >= 3) and (value <= 6)) then shopPrice = -1
    elseif ((value >= -2) and (value <= 2)) then shopPrice = 0
    elseif ((value >= -6) and (value <= -3)) then shopPrice = 1
    elseif ((value >= -10) and (value <= -7)) then shopPrice = 2
    elseif ((value >= -14) and (value <= -11)) then shopPrice = 3
    elseif ((value >= -18) and (value <= -15)) then shopPrice = 4
    elseif ((value >= -20) and (value <= -19)) then shopPrice = 5
    end
    self.UI.setAttribute("shopPrice", "text", shopPrice)
  elseif playerLvlList[id] then
    if value > 9 then value = 9
    elseif value < 0 then value = 0 end
    local count = 0
    local sum = 0
    for pl,_ in pairs(playerLvlList) do
      if id == pl then
        if value > 0 then count = count + 1; sum = sum + value end
      else
        if self.UI.getAttribute(pl, "text") ~= "0" then count = count + 1; sum = sum + self.UI.getAttribute(pl, "text") end
      end
    end
    if count == 0 then
      self.UI.setAttribute("averageLevel", "text", 0)
    else
      self.UI.setAttribute("averageLevel", "text", tonumber(string.format("%.2f", sum / count)))
    end

    editLevel()
  end
  self.UI.setAttribute(id, "text", value)
end

function editLevel()
  Wait.frames(function() self.UI.setAttribute("scenarioLevel", "text", math.ceil(tonumber(self.UI.getAttribute("averageLevel", "text"))/2)  + self.UI.getAttribute("difficulty", "value")) end, 1)
end

function getPlayerCount()
  local count = 0
  if self.UI.getAttribute("playerone", "text") ~= "" then count = count + 1 end
  if self.UI.getAttribute("playertwo", "text") ~= "" then count = count + 1 end
  if self.UI.getAttribute("playerthree", "text") ~= "" then count = count + 1 end
  if self.UI.getAttribute("playerfour", "text") ~= "" then count = count + 1 end
  return count
end

function changeDifficulty()
  if self.UI.getAttribute("difficulty", "text") == "Easy" then
    self.UI.setAttribute("difficulty", "value", "0")
    self.UI.setAttribute("difficulty", "text", "Normal")
  elseif self.UI.getAttribute("difficulty", "text") == "Normal" then
    self.UI.setAttribute("difficulty", "value", "1")
    self.UI.setAttribute("difficulty", "text", "Hard")
  elseif self.UI.getAttribute("difficulty", "text") == "Hard" then
    self.UI.setAttribute("difficulty", "value", "2")
    self.UI.setAttribute("difficulty", "text", "Very Hard")
elseif self.UI.getAttribute("difficulty", "text") == "Very Hard" then
    self.UI.setAttribute("difficulty", "value", "-1")
    self.UI.setAttribute("difficulty", "text", "Easy")
  end
  editLevel()
end

function onValueChanged(player, value, id)
  self.UI.setAttribute(id, "text", value)
  if id == "partyName" then
    self.setName(value)
  end
end

function onClick(player, value, id)
  if id == "difficulty" then
    changeDifficulty()
  elseif id:sub(1,3) == "add" then
    addSub({self.UI.getAttribute(id, "value"), 1})
  elseif id:sub(1,3) == "sub" then
    addSub({self.UI.getAttribute(id, "value"), -1})
  end
end