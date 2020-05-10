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


function addPlayer()
   local pos = self.getPosition()
   getObjectFromGUID("6a8ca6").takeObject({
      position = {pos.x, pos.y - 0.05, pos.z - 8.17},
      rotation = {0.00, 180.00, 0.00},
      smooth = false
   }).lock()
   self.setState(2)
end