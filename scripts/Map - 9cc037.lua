hideBack = false
prosColor = {0, 0, 0, 255}
-- achievmentBoard = "546b57"
achievmentBoard = "43d5b8"

Buttons = {count = 0}
Pros = {}
locations = {}
tableML = {}

function onSave()
   self.script_state = JSON.encode({loc = locations, Prosp = Pros})
end

function onLoad(save_state)
   if save_state ~= "" then
      Pros = JSON.decode(save_state).Prosp
      locations = JSON.decode(save_state).loc
   end
   if Pros == nil then Pros = {} end
   if locations == nil then locations = {} end
   setML()
   setupButtons()
   setupProsperity()
   self.createButton({
      click_function = "addAchiev",
      function_owner = self,
      position = { - 0.35, 0, - 7.5},
      width = 5700,
      height = 750,
      color = {1, 1, 1, 0},
      tooltip = "Add Achievement"
   })
end

function addAchiev()
   obj = getObjectFromGUID(achievmentBoard)
   if obj == nil then
      new = getObjectFromGUID("3ea749").takeObject({
         position = {87.26, 1.69, 26.12},
         rotation = {0, 180, 0},
         smooth = false,
         guid = achievmentBoard
      })
      new.setLock(true)
   else
      getObjectFromGUID("3ea749").putObject(obj)
   end
end

function setupProsperity()
   local x = -5.70
   local z = 6.75
   for i = 0, 63 do
      createProsperity(i + 1, x + i * 0.181, z - i * 0.0029)
      Buttons.count = Buttons.count + 1
      if Pros[tostring(i)] == true then
         clickedPros(i + 1)
      else
         Pros[tostring(i)] = false
      end
   end
end

function getProsLevel()
   local prosp = 0
   for i = 0, 63 do
      if Pros[tostring(i)] == true then
         prosp = prosp + 1
      end
   end
   if prosp == 64 then
      return 9
   elseif prosp > 49 then
      return 8
   elseif prosp > 38 then
      return 7
   elseif prosp > 29 then
      return 6
   elseif prosp > 21 then
      return 5
   elseif prosp > 14 then
      return 4
   elseif prosp > 8 then
      return 3
   elseif prosp > 3 then
      return 2
   else
      return 1
   end
end

function createProsperity(num, x, z)
   self.setVar("ProsClick_" .. num, function () clickedPros(num) end)
   local button_parameters = {}
   button_parameters.function_owner = self
   button_parameters.label = ""
   button_parameters.height = 600
   button_parameters.width = 400
   button_parameters.font_size = 1000
   button_parameters.scale = {0.18, 0.1, 0.16}
   button_parameters.color = {0, 0, 0, 0}
   button_parameters.font_color = prosColor
   button_parameters.index = Buttons.count
   button_parameters.click_function = "ProsClick_" .. num
   button_parameters.position = {x, 0.59, z}
   self.createButton(button_parameters)
   Buttons["p_" .. num] = button_parameters
end


function createML(label, x, z, tx, tz)
   self.setVar(label .. "_ButtonClick", function (obj, color, alt_click) clickedML(label, alt_click) end)
   local button_parameters = {}
   button_parameters.index = Buttons.count
   button_parameters.click_function = label .. "_ButtonClick"
   button_parameters.function_owner = self
   button_parameters.label = label
   button_parameters.position = {x, 0.55, z}
   button_parameters.scale = {0.6, 1, 0.7}
   if label == "800847" then
      button_parameters.height = 500
      button_parameters.width = 900
   else
      button_parameters.height = 100
      button_parameters.width = 190
   end
   button_parameters.font_size = 50
   self.createButton(button_parameters)
   Buttons[label] = button_parameters

   if tx ~= nil then
      button_parameters.index = Buttons.count + 1
      button_parameters.click_function = "dud"
      button_parameters.function_owner = self
      button_parameters.label = ""
      button_parameters.font_color = {0, 0, 0, 255}
      if locations ~= nil then
         if locations[label] ~= nil and locations[label] ~= false then
            button_parameters.label = "x"
            if locations[label] ~= true then
               button_parameters.font_color = locations[label]
            end
         end
      end
      button_parameters.position = {tx, 0.59, tz}
      button_parameters.height = 0
      button_parameters.width = 0
      button_parameters.font_size = 100
      button_parameters.color = {0, 0, 0, 0}
      self.createButton(button_parameters)
      Buttons["t_" .. label] = button_parameters

      Buttons.count = Buttons.count + 2
   else
      Buttons.count = Buttons.count + 1
   end
end

function clickedPros(index)
   if Buttons["p_" .. index].label == "" then
      Buttons["p_" .. index].label = "\u{2717}"
      Pros[tostring(tonumber(index) - 1)] = true
   else
      Buttons["p_" .. index].label = ""
      Pros[tostring(tonumber(index) - 1)] = false
   end
   self.editButton(Buttons["p_" .. index])
end

function clickedML(guid, alt_click)
   local item
   local bag = getObjectFromGUID("3458a9")
   local bagObjects = bag.getObjects()
   for _, obj in pairs(bagObjects) do
      if obj.guid == guid then
         if guid == "800847" then
            createEnvelopeB()
         else
            local params = {}
            local x = tableML[guid].position[1] * self.getScale().x / 2.08
            local sx = (self.getScale().x - 1) * tableML[guid].scale[1]
            local z = tableML[guid].position[3] * self.getScale().z / 2.08
            local sz = (self.getScale().z - 1) * tableML[guid].scale[3]
            local sin = math.sin(math.rad(270 - self.getRotation().y))
            local cos = math.cos(math.rad(270 - self.getRotation().y))
            params.position = {(x * cos - z * sin) + self.getPosition().x, self.getPosition().y + 1.54, (x * sin + z * cos) + self.getPosition().z}
            if tableML[guid].number ~= nil and tableML[guid].number > 95 then
               params.position = tableML[guid].position
               sx = tableML[guid].scale[1]
               sz = tableML[guid].scale[3]
            end
            params.rotation = self.getRotation()
            params.guid = guid
            item = bag.takeObject(params)
            item.setLock(true)
            item.setScale({sx, 1, sz})
         end
         return
      end
   end
   if guid == "800847" then
      bag.putObject(getObjectFromGUID(guid))
      return
   end
   if Buttons["t_" .. guid] ~= nil and Buttons["t_" .. guid].label == "" then
      if alt_click == true then
         bag.putObject(getObjectFromGUID(guid))
      else
         local firstClick = Timer.destroy("firstClick")
         local secondClick = Timer.destroy("secondClick")
         if firstClick == false and secondClick == false then
            Timer.create({
               identifier = "firstClick",
               function_name = "oneClick",
               function_owner = self,
               parameters = {guid},
               delay = 1
            })
         elseif firstClick == true and secondClick == false then
            Timer.create({
               identifier = "secondClick",
               function_name = "doubleClick",
               function_owner = self,
               parameters = {guid},
               delay = 1
            })
         elseif secondClick == true then
            triClick({guid})
         end
      end
   else
      if alt_click == true then
         if Buttons["t_" .. guid].label ~= "" then
            Buttons["t_" .. guid].label = ""
            self.editButton(Buttons["t_" .. guid])
            locations[guid] = false
         end
         bag.putObject(getObjectFromGUID(guid))
      else
         local firstClick = Timer.destroy("firstClick")
         local secondClick = Timer.destroy("secondClick")
         if firstClick == false and secondClick == false then
            Timer.create({
               identifier = "firstClick",
               function_name = "oneClick",
               function_owner = self,
               parameters = {guid},
               delay = 1
            })
         elseif firstClick == true and secondClick == false then
            Timer.create({
               identifier = "secondClick",
               function_name = "doubleClick",
               function_owner = self,
               parameters = {guid},
               delay = 1
            })
         elseif secondClick == true then
            triClick({guid})
         end
      end
   end
end

function triClick(params)
   if Buttons["t_" .. params[1]].label == "" then
      Buttons["t_" .. params[1]].font_color = {1, 0, 0, 255}
      Buttons["t_" .. params[1]].label = "x"
      self.editButton(Buttons["t_" .. params[1]])
      locations[params[1]] = {1, 0, 0, 255}
   else
      Buttons["t_" .. params[1]].font_color = {1, 0, 0, 255}
      self.editButton(Buttons["t_" .. params[1]])
      locations[params[1]] = {1, 0, 0, 255}
   end
end

function doubleClick(params)
   Global.call("createMap", {tableML[params[1]].number})
end

function oneClick(params)
   Buttons["t_" .. params[1]].font_color = {0, 0, 0, 255}
   if Buttons["t_" .. params[1]].label == "" then
      Buttons["t_" .. params[1]].label = "x"
      self.editButton(Buttons["t_" .. params[1]])
      locations[params[1]] = {0, 0, 0, 255}
   else
      Buttons["t_" .. params[1]].label = ""
      self.editButton(Buttons["t_" .. params[1]])
      locations[params[1]] = false
   end
end

function dud() end

function createEnvelopeB()
   local button_parameters = {}
   button_parameters.function_owner = self
   button_parameters.label = "Do you really want to reveal this?"
   button_parameters.height = 0
   button_parameters.width = 0
   button_parameters.font_size = 200
   button_parameters.scale = {0.5, 0.1, 0.5}
   button_parameters.click_function = "dud"
   button_parameters.position = { - 6.45, 0.6, 7.4}
   self.createButton(button_parameters)

   button_parameters.label = "yes"
   button_parameters.height = 300
   button_parameters.width = 500
   button_parameters.click_function = "yesClicked"
   button_parameters.position = { - 7.1, 0.6, 7.9}
   self.createButton(button_parameters)

   button_parameters.label = "no"
   button_parameters.click_function = "noClicked"
   button_parameters.position = { - 5.8, 0.6, 7.9}
   self.createButton(button_parameters)
   Buttons.count = Buttons.count + 3
end

function yesClicked()
   noClicked()
   unseal()
end

function unseal ()
   local params = {}
   local bag = getObjectFromGUID("3458a9")
   params.guid = "800847"
   local guid = params.guid
   local x = tableML[guid].position[1] * self.getScale().x / 2.08
   local sx = (self.getScale().x - 1) * tableML[guid].scale[1]
   local z = tableML[guid].position[3] * self.getScale().z / 2.08
   local sz = (self.getScale().z - 1) * tableML[guid].scale[3]
   local sin = math.sin(math.rad(270 - self.getRotation().y))
   local cos = math.cos(math.rad(270 - self.getRotation().y))
   params.position = {(x * cos - z * sin) + self.getPosition().x, self.getPosition().y + 1.54, (x * sin + z * cos) + self.getPosition().z}
   params.rotation = self.getRotation()
   item = bag.takeObject(params)
   item.setLock(true)
   item.setScale({sx, 1, sz})
end

function noClicked()
   self.removeButton(Buttons.count)
   Buttons.count = Buttons.count - 1
   self.removeButton(Buttons.count)
   Buttons.count = Buttons.count - 1
   self.removeButton(Buttons.count)
   Buttons.count = Buttons.count - 1
end

function setML()
   tableML["6d2b6e"] = {number = 1, position = {(82.38 - 80), 1.17, 0.79}, scale = {0.31 / 1.3, 1, 0.31 / 1.3}}
   tableML["7272f8"] = {number = 2, position = {(82.59 - 80), 1.17, - 0.68}, scale = {0.30 / 1.3, 1, 0.30 / 1.3}}
   tableML["65605e"] = {number = 3, position = {(81.74 - 80), 1.17, 11.405}, scale = {0.37 / 1.3, 1, 0.37 / 1.3}}
   tableML["3ea6c9"] = {number = 4, position = {(85.235 - 80), 1.17, 0.41}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["07748f"] = {number = 5, position = {(86.50 - 80), 1.17, 7.16}, scale = {0.35 / 1.3, 1, 0.35 / 1.3}}
   tableML["42c70f"] = {number = 6, position = {(83.34 - 80), 1.17, 1.84}, scale = {0.32 / 1.3, 1, 0.32 / 1.3}}
   tableML["0442cc"] = {number = 7, position = {(88.51 - 80), 1.17, - 2.66}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["6b43df"] = {number = 8, position = {(89.11 - 80), 1.17, - 11.18}, scale = {0.28 / 1.3, 1, 0.28 / 1.3}}
   tableML["097dc7"] = {number = 9, position = {(73.78 - 80), 1.17, 12.88}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["2f4a1a"] = {number = 10, position = {(87.39 - 80), 1.17, 6.09}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["422d5a"] = {number = 11, position = {(90.00 - 80), 1.17, - 8.82}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["69187d"] = {number = 12, position = {(90.00 - 80), 1.17, - 8.82}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["23b98f"] = {number = 13, position = {(69.82 - 80), 1.17, 10.30}, scale = {0.4 / 1.3, 1, 0.4 / 1.3}}
   tableML["5895d3"] = {number = 14, position = {(88.65 - 80), 1.17, 0.80}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["3053cd"] = {number = 15, position = {(89.28 - 80), 1.17, - 0.55}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["e406bc"] = {number = 16, position = {(88.80 - 80), 1.17, 7.16}, scale = {0.32 / 1.3, 1, 0.32 / 1.3}}
   tableML["de9163"] = {number = 17, position = {(76.675 - 80), 1.17, - 11.84}, scale = {0.52 / 1.3, 1, 0.52 / 1.3}}
   tableML["52c826"] = {number = 18, position = {(88.45 - 80), 1.17, - 6.20}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["a722e7"] = {number = 19, position = {(72.63 - 80), 1.17, 4.99}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["dd9869"] = {number = 20, position = {(81.26 - 80), 1.17, - 3.25}, scale = {0.385 / 1.3, 1, 0.385 / 1.3}}
   tableML["2e2c4d"] = {number = 21, position = {(87.74 - 80), 1.17, 5.095}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["c58620"] = {number = 22, position = {(75.72 - 80), 1.17, 3.11}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["e897ec"] = {number = 23, position = {(88.59 - 80), 1.17, - 7.72}, scale = {0.28 / 1.3, 1, 0.28 / 1.3}}
   tableML["841503"] = {number = 24, position = {(88.46 - 80), 1.17, 8.33}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["78a7a2"] = {number = 25, position = {(90.28 - 80), 1.17, 9.51}, scale = {0.395 / 1.3, 1, 0.395 / 1.3}}
   tableML["c9fb9a"] = {number = 26, position = {(87.70 - 80), 1.17, - 7.77}, scale = {0.27 / 1.3, 1, 0.27 / 1.3}}
   tableML["acb055"] = {number = 27, position = {(85.72 - 80), 1.17, 6.87}, scale = {0.25 / 1.3, 1, 0.25 / 1.3}}
   tableML["058608"] = {number = 28, position = {(85.04 - 80), 1.17, 10.31}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["1b7c37"] = {number = 29, position = {(84.85 - 80), 1.17, 11.745}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["070197"] = {number = 30, position = {(71.59 - 80), 1.17, - 7.91}, scale = {0.35 / 1.3, 1, 0.35 / 1.3}}
   tableML["d7b79e"] = {number = 31, position = {(91.72 - 80), 1.17, - 8.75}, scale = {0.30 / 1.3, 1, 0.30 / 1.3}}
   tableML["ece6c2"] = {number = 32, position = {(74.75 - 80), 1.17, - 1.54}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["05a080"] = {number = 33, position = {(91.275 - 80), 1.17, 6.425}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["669c41"] = {number = 34, position = {(91.51 - 80), 1.17, 10.79}, scale = {0.355 / 1.3, 1, 0.355 / 1.3}}
   tableML["1722af"] = {number = 35, position = {(91.30 - 80), 1.17, - 5.94}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["0b5a03"] = {number = 36, position = {(91.30 - 80), 1.17, - 5.94}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["86cefe"] = {number = 37, position = {(82.79 - 80), 1.17, - 12.18}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["9a00ab"] = {number = 38, position = {(81.72 - 80), 1.17, 12.91}, scale = {0.35 / 1.3, 1, 0.35 / 1.3}}
   tableML["ce4ce9"] = {number = 39, position = {(90.63 - 80), 1.17, - 0.19}, scale = {0.345 / 1.3, 1, 0.345 / 1.3}}
   tableML["52feed"] = {number = 40, position = {(84.18 - 80), 1.17, - 2.48}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["269876"] = {number = 41, position = {(84.28 - 80), 1.17, - 3.81}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["00fdce"] = {number = 42, position = {(88.54 - 80), 1.17, 9.82}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["6b966e"] = {number = 43, position = {(85.92 - 80), 1.17, 11.51}, scale = {0.305 / 1.3, 1, 0.305 / 1.3}}
   tableML["8f6ab2"] = {number = 44, position = {(83.23 - 80), 1.17, 11.04}, scale = {0.40 / 1.3, 1, 0.40 / 1.3}}
   tableML["987d10"] = {number = 45, position = {(73.29 - 80), 1.17, 2.72}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["c9d275"] = {number = 46, position = {(91.90 - 80), 1.17, - 0.07}, scale = {0.40 / 1.3, 1, 0.40 / 1.3}}
   tableML["34c5f0"] = {number = 47, position = {(81.575 - 80), 1.17, - 12.35}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["5ae4c0"] = {number = 48, position = {(84.695 - 80), 1.17, 14.42}, scale = {0.385 / 1.3, 1, 0.385 / 1.3}}
   tableML["b0582e"] = {number = 49, position = {(71.09 - 80), 1.17, 4.90}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["ef68c0"] = {number = 50, position = {(89.91 - 80), 1.17, - 9.77}, scale = {0.35 / 1.3, 1, 0.35 / 1.3}}
   tableML["986935"] = {number = 51, position = {(91.605 - 80), 1.17, - 7.26}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["2f064a"] = {number = 52, position = {(88.16 - 80), 1.17, - 5.15}, scale = {0.28 / 1.3, 1, 0.28 / 1.3}}
   tableML["8b1313"] = {number = 53, position = {(84.50 - 80), 1.17, - 0.695}, scale = {0.31 / 1.3, 1, 0.31 / 1.3}}
   tableML["3d16da"] = {number = 54, position = {(87.34 - 80), 1.17, 3.12}, scale = {0.37 / 1.3, 1, 0.37 / 1.3}}
   tableML["a41416"] = {number = 55, position = {(81.81 - 80), 1.17, 8.98}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["71c6bf"] = {number = 56, position = {(81.31 - 80), 1.17, 10.23}, scale = {0.35 / 1.3, 1, 0.35 / 1.3}}
   tableML["ed2477"] = {number = 57, position = {(87.21 - 80), 1.17, - 5.61}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["bd8a35"] = {number = 58, position = {(85.79 - 80), 1.17, - 7.43}, scale = {0.27 / 1.3, 1, 0.27 / 1.3}}
   tableML["83f839"] = {number = 59, position = {(82.90 - 80), 1.17, 14.755}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["6686a7"] = {number = 60, position = {(90.44 - 80), 1.17, - 7.28}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["f97b01"] = {number = 61, position = {(71.30 - 80), 1.17, - 2.14}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["fc7088"] = {number = 62, position = {(70.17 - 80), 1.17, - 2.34}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["5240e1"] = {number = 63, position = {(71.50 - 80), 1.17, 14.18}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["9211fb"] = {number = 64, position = {(76.58 - 80), 1.17, - 9.97}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["b20d62"] = {number = 65, position = {(73.37 - 80), 1.17, 8.30}, scale = {0.43 / 1.3, 1, 0.43 / 1.3}}
   tableML["a239ce"] = {number = 66, position = {(82.33 - 80), 1.17, - 6.16}, scale = {0.375 / 1.3, 1, 0.375 / 1.3}}
   tableML["a9d09c"] = {number = 67, position = {(75.895 - 80), 1.17, 13.085}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["da8a92"] = {number = 68, position = {(71.01 - 80), 1.17, 2.85}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["f5035d"] = {number = 69, position = {(84.10 - 80), 1.17, 3.55}, scale = {0.40 / 1.3, 1, 0.40 / 1.3}}
   tableML["85a8ef"] = {number = 70, position = {(78.08 - 80), 1.17, - 10.58}, scale = {0.66 / 1.3, 1, 0.66 / 1.3}}
   tableML["740f1c"] = {number = 71, position = {(74.86 - 80), 1.17, 6.99}, scale = {0.41 / 1.3, 1, 0.41 / 1.3}}
   tableML["8ebcdb"] = {number = 72, position = {(81.22 - 80), 1.17, - 1.42}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["562ab5"] = {number = 73, position = {(71.05 - 80), 1.17, 7.35}, scale = {0.43 / 1.3, 1, 0.43 / 1.3}}
   tableML["beedec"] = {number = 74, position = {(79.03 - 80), 1.17, - 6.17}, scale = {0.40 / 1.3, 1, 0.40 / 1.3}}
   tableML["f97648"] = {number = 75, position = {(82.40 - 80), 1.17, - 3.705}, scale = {0.31 / 1.3, 1, 0.31 / 1.3}}
   tableML["eb5c41"] = {number = 76, position = {(73.65 - 80), 1.17, 10.42}, scale = {0.37 / 1.3, 1, 0.37 / 1.3}}
   tableML["904253"] = {number = 77, position = {(91.19 - 80), 1.17, - 9.76}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["cde966"] = {number = 78, position = {(90.45 - 80), 1.17, - 5.09}, scale = {0.27 / 1.3, 1, 0.27 / 1.3}}
   tableML["29c11d"] = {number = 79, position = {(76.69 - 80), 1.17, - 3.355}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["e9a6de"] = {number = 80, position = {(74.98 - 80), 1.17, 14.68}, scale = {0.34 / 1.3, 1, 0.34 / 1.3}}
   tableML["803c66"] = {number = 81, position = {(86.34 - 80), 1.17, 13.33}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["9a84f3"] = {number = 82, position = {(72.10 - 80), 1.17, 6.38}, scale = {0.39 / 1.3, 1, 0.39 / 1.3}}
   tableML["7b3fc2"] = {number = 83, position = {(89.15 - 80), 1.17, - 6.51}, scale = {0.27 / 1.3, 1, 0.27 / 1.3}}
   tableML["9fa7ed"] = {number = 84, position = {(86.76 - 80), 1.17, - 2.95}, scale = {0.30 / 1.3, 1, 0.30 / 1.3}}
   tableML["7e28d2"] = {number = 85, position = {(72.14 - 80), 1.17, 10.29}, scale = {0.38 / 1.3, 1, 0.38 / 1.3}}
   tableML["fbd87e"] = {number = 86, position = {(86.67 - 80), 1.17, - 6.86}, scale = {0.28 / 1.3, 1, 0.28 / 1.3}}
   tableML["7e5761"] = {number = 87, position = {(78.27 - 80), 1.17, 1.27}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["70735c"] = {number = 88, position = {(87.68 - 80), 1.17, - 9.30}, scale = {0.29 / 1.3, 1, 0.29 / 1.3}}
   tableML["bd5267"] = {number = 89, position = {(88.95 - 80), 1.17, - 9.93}, scale = {0.26 / 1.3, 1, 0.26 / 1.3}}
   tableML["6aea5b"] = {number = 90, position = {(77.16 - 80), 1.17, 5.19}, scale = {0.36 / 1.3, 1, 0.36 / 1.3}}
   tableML["eb6c4a"] = {number = 91, position = {(85.16 - 80), 1.17, 13.09}, scale = {0.33 / 1.3, 1, 0.33 / 1.3}}
   tableML["89427b"] = {number = 92, position = {(89.435 - 80), 1.17, - 5.605}, scale = {0.27 / 1.3, 1, 0.27 / 1.3}}
   tableML["ee2e3d"] = {number = 93, position = {(71.20 - 80), 1.17, - 10.55}, scale = {0.52 / 1.3, 1, 0.52 / 1.3}}
   tableML["e758c1"] = {number = 94, position = {(83.20 - 80), 1.17, - 1.93}, scale = {0.28 / 1.3, 1, 0.28 / 1.3}}
   tableML["0c8643"] = {number = 95, position = {(83.15 - 80), 1.17, - 2.95}, scale = {0.30 / 1.3, 1, 0.30 / 1.3}}
   tableML["1cb78d"] = {number = 96, position = {110.86 - 24.78, 1.83, 12.45}, scale = {0.55, 1.00, 0.55}}
   tableML["157394"] = {number = 97, position = {118.51 - 24.78, 1.83, 16.33}, scale = {0.52, 1.00, 0.525}}
   tableML["b13714"] = {number = 98, position = {120.93 - 24.78, 1.83, 9.65}, scale = {0.49, 1.00, 0.49}}
   tableML["fa4186"] = {number = 99, position = {116.43 - 24.78, 1.83, 14.17}, scale = {0.33, 1.00, 0.33}}
   tableML["1bffe1"] = {number = 100, position = {102.74 - 24.78, 1.83, 7.59}, scale = {0.49, 1.00, 0.49}}
   tableML["e88d44"] = {number = 101, position = {103.808 - 24.78, 1.83, - 5.23}, scale = {0.46, 1.00, 0.46}}
   tableML["eec42d"] = {number = 102, position = {124.17 - 24.78, 1.83, - 8.55}, scale = {0.57, 1.00, 0.57}}
   tableML["f01234"] = {number = 103, position = {100.71 - 24.78, 1.83, 0.87}, scale = {0.56, 1.00, 0.56}}
   tableML["97ae22"] = {number = 104, position = {90.79 - 24.78, 1.83, - 4.23}, scale = {0.62, 1.00, 0.62}}
   tableML["01ada1"] = {number = 105, position = {103.37 - 24.78, 1.83, 14.09}, scale = {0.62, 1.00, 0.62}}
   tableML["dacca6"] = {number = 106, position = {108.92 - 24.78, 1.83, - 1.45}, scale = {0.53, 1.00, 0.53}}
   tableML["12de1f"] = {number = 107, position = {113.10 - 24.78, 1.83, 4.82}, scale = {0.55, 1.00, 0.55}}
   tableML["8587e6"] = {number = 108, position = {87.37 - 24.78, 1.83, - 15.04}, scale = {0.665, 1.00, 0.67}}
   tableML["bc2bb6"] = {number = 109, position = {93.83 - 24.78, 1.83, - 11.82}, scale = {0.48, 1.00, 0.48}}
   tableML["801af3"] = {number = 110, position = {123.78 - 24.78, 1.83, - 6.295}, scale = {0.69, 1.00, 0.69}}
   tableML["f542d9"] = {number = 111, position = {120.34 - 24.78, 1.83, 14.77}, scale = {0.525, 1.00, 0.525}}
   tableML["48232d"] = {number = 112, position = {116.79 - 24.78, 1.83, 7.95}, scale = {0.44, 1.00, 0.44}}
   tableML["9ab74e"] = {number = 113, position = {117.62 - 24.78, 1.83, 2.49}, scale = {0.53, 1.00, 0.53}}
   tableML["cbdee1"] = {number = 114, position = {112.355 - 24.78, 1.83, 7.55}, scale = {0.55, 1.00, 0.55}}
   tableML["108cd7"] = {number = 115, position = {116.41 - 24.78, 1.83, 0.94}, scale = {0.55, 1.00, 0.55}}
   tableML["800847"] = {position = {(64.95 - 80), 1.17, 13.38}, scale = {1.80 / 1.3, 1, 1.80 / 1.3}}
end

function setupButtons()
   createML("6d2b6e", - 0.39, - 1.2, - 0.55, - 1.05)
   createML("7272f8", 0.07, - 1.15, 0.2, - 1.34)
   createML("65605e", - 5.83, - 0.81, - 5.65, - 0.95)
   createML("3ea6c9", 0.1, - 2.48, - 0.47, - 2.36)
   createML("07748f", - 3.37, - 3.32, - 3.6, - 2.94)
   createML("42c70f", - 0.63, - 1.63, - 1.1, - 1.5)
   createML("0442cc", 1.24, - 4.23, 1.09, - 3.94)
   createML("6b43df", 5.34, - 4.27, 5.23, - 4.52)
   createML("097dc7", - 6.42, 2.95, - 6.34, 3.14)
   createML("2f4a1a", - 2.95, - 3.75, - 3.19, - 3.38)
   createML("422d5a", 4.15, - 4.83, 4.23, - 5.02)
   createML("69187d", 4.35, - 4.88, 4.37, - 5.02)
   createML("23b98f", - 5.13, 4.69, - 5.17, 5.05)
   createML("5895d3", - 0.44, - 4.3, - 0.56, - 4.02)
   createML("3053cd", 0.32, - 4.69, 0.03, - 4.27)
   createML("e406bc", - 3.37, - 4.38, - 3.63, - 4.11)
   createML("de9163", 5.33, 1.6, 5.61, 1.93)
   createML("52c826", 2.89, - 3.98, 2.76, - 4.17)
   createML("a722e7", - 2.52, 3.37, - 2.59, 3.75)
   createML("dd9869", 1.73, - 0.77, 1.33, - 0.46)
   createML("2e2c4d", - 2.71, - 3.88, - 2.597, - 3.57)
   createML("c58620", - 1.72, 1.89, - 1.72, 2.2)
   createML("e897ec", 3.51, - 4.28, 3.57, - 3.99)
   createML("841503", - 3.85, - 4.26, - 4.17, - 3.91)
   createML("78a7a2", - 4.61, - 5.08, - 4.74, - 4.75)
   createML("c9fb9a", 3.53, - 3.8, 3.58, - 3.59)
   createML("acb055", - 3.51, - 2.77, - 3.45, - 2.71)
   createML("058608", - 5.26, - 2.55, - 5.2, - 2.28)
   createML("1b7c37", - 5.48, - 2.51, - 5.88, - 2.16)
   createML("070197", 3.51, 4.03, 3.59, 4.17)
   createML("d7b79e", 4.17, - 5.78, 4.04, - 5.49)
   createML("ece6c2", 0.52, 2.42, 0.6, 2.65)
   createML("05a080", - 2.93, - 5.27, - 3.28, - 5.55)
   createML("669c41", - 5.43, - 5.5, - 5.37, - 5.37)
   createML("1722af", 2.78, - 5.59, 2.93, - 5.23)
   createML("0b5a03", 2.87, - 5.32, 3.06, - 5.23)
   createML("86cefe", 5.5, - 1.45, 5.6, - 1.22)
   createML("9a00ab", - 6.35, - 0.95, - 6.35, - 0.65)
   createML("ce4ce9", - 0.07, - 5.09, - 0.15, - 4.98)
   createML("52feed", 1, - 1.97, 0.94, - 1.84)
   createML("269876", 1.58, - 2.12, 1.67, - 1.95)
   createML("00fdce", - 4.45, - 4.1, - 4.9, - 3.92)
   createML("6b966e", - 5.3, - 2.88, - 5.7, - 2.95)
   createML("8f6ab2", - 5.63, - 1.59, - 5.48, - 1.71)
   createML("987d10", - 1.13, 3.21, - 1.46, 3.37)
   createML("c9d275", 0.26, - 5.62, - 0.19, - 5.47)
   createML("34c5f0", 5.99, - 0.93, 5.7, - 0.57)
   createML("5ae4c0", - 7.09, - 2.43, - 7.11, - 2.07)
   createML("b0582e", - 2.41, 4.08, - 2.51, 4.45)
   createML("ef68c0", 4.68, - 4.7, 4.51, - 4.54)
   createML("986935", 3.47, - 5.64, 3.35, - 5.44)
   createML("2f064a", 2.66, - 3.79, 2.3, - 4)
   createML("8b1313", 0.1, - 2.16, 0.14, - 2.06)
   createML("3d16da", - 1.72, - 3.49, - 1.63, - 3.29)
   createML("a41416", - 4.49, - 1.01, - 4.48, - 0.73)
   createML("71c6bf", - 4.82, - 0.79, - 5.08, - 0.46)
   createML("ed2477", 2.89, - 3.4, 2.69, - 3.3)
   createML("bd8a35", 3.42, - 2.87, 3.41, - 2.7)
   createML("83f839", - 7.36, - 1.48, - 7.25, - 1.2)
   createML("6686a7", 3.46, - 5.09, 3.34, - 4.92)
   createML("f97b01", 0.89, 4.02, 0.8, 4.36)
   createML("fc7088", 0.95, 4.53, 1, 4.86)
   createML("5240e1", - 7.07, 3.98, - 6.935, 4.32)
   createML("9211fb", 4.62, 1.39, 4.55, 1.84)
   createML("b20d62", - 3.88, 2.98, - 4.1, 3.4)
   createML("a239ce", 2.67, - 1.1, 2.81, - 1)
   createML("a9d09c", - 6.48, 1.87, - 6.47, 2.11)
   createML("da8a92", - 1.59, 4.41, - 1.52, 4.58)
   createML("f5035d", - 2.01, - 1.92, - 1.98, - 1.79)
   createML("85a8ef", 4.96, 0.72, 5.104, 0.57)
   createML("740f1c", - 3.61, 2.36, - 3.59, 2.64)
   createML("8ebcdb", 0.87, - 0.6, 0.52, - 0.45)
   createML("562ab5", - 3.61, 4.1, - 3.75, 4.52)
   createML("beedec", 2.59, 0.41, 2.79, 0.64)
   createML("f97648", 1.5, - 1.19, 1.54, - 1.06)
   createML("eb5c41", - 5.32, 3.02, - 5.22, 3.2)
   createML("904253", 4.71, - 5.36, 4.5, - 5.21)
   createML("cde966", 2.25, - 5.02, 2.3, - 4.93)
   createML("29c11d", 1.42, 1.53, 1.49, 1.69)
   createML("e9a6de", - 7.25, 2.29, - 7.2, 2.57)
   createML("803c66", - 6.64, - 3.16, - 6.64, - 2.85)
   createML("9a84f3", - 3.35, 3.89, - 3.25, 4)
   createML("7b3fc2", 3.21, - 4.44, 2.87, - 4.33)
   createML("9fa7ed", 1.19, - 3.29, 1.23, - 3.16)
   createML("7e28d2", - 5.2, 3.67, - 5.07, 3.91)
   createML("fbd87e", 3.52, - 3.3, 3.1, - 3.11)
   createML("7e5761", - 0.83, 0.67, - 0.79, 0.97)
   createML("70735c", 4.29, - 3.76, 4.34, - 3.58)
   createML("bd5267", 4.66, - 4.28, 4.56, - 4.4)
   createML("6aea5b", - 2.66, 1.46, - 2.63, 1.54)
   createML("eb6c4a", - 6.5, - 2.61, - 6.39, - 2.36)
   createML("89427b", 2.61, - 4.56, 2.49, - 4.46)
   createML("ee2e3d", 4.99, 3.91, 5.08, 4.32)
   createML("e758c1", 0.76, - 1.56, 0.75, - 1.67)
   createML("0c8643", 1.39, - 1.61, 1.26, - 1.35)
   createML("1cb78d", 1.72, - 4.85, 1.72, - 4.35 )
   createML("157394", 4.54, - 6.24, 4.63, - 5.84 )
   createML("b13714", 5.4, - 3.68, 5.48, - 3.39 )
   createML("fa4186", 3.96, - 5.2, 3.79, - 5.31 )
   createML("1bffe1", - 1.23, - 2.9, - 1.24, - 2.65 )
   createML("e88d44", - 0.9, 1.78, - 0.85, 2.12 )
   createML("eec42d", 6.6, 2.9, 6.62, 3.4 )
   createML("f01234", - 2.2, - 0.34, - 2.04, - 0.14 )
   createML("97ae22", - 5.8, 1.58, - 5.64, 1.79 )
   createML("01ada1", - 0.8, - 5.34, - 1.06, - 4.91 )
   createML("dacca6", 1.3, 0.34, 1.03, 0.81 )
   createML("12de1f", 2.4, - 1.84, 2.56, - 1.6 )
   createML("8587e6", - 7.1, 5.34, - 7.1, 5.83)
   createML("bc2bb6", - 4.6, 4.24, - 4.56, 4.55 )
   createML("801af3", 6.4, 2.06, 6.41, 2.47 )
   createML("f542d9", 5.72, - 5.5, 5.22, - 5.2 )
   createML("48232d", 3.95, - 3.03, 3.94, - 2.78 )
   createML("9ab74e", 4.12, - 0.84, 4.28, - 0.74 )
   createML("cbdee1", 2.26, - 2.98, 2.32, - 2.54 )
   createML("108cd7", 4.3, - 0.44, 3.78, - 0.14 )
   createML("800847", - 7.8, 6.7)



end