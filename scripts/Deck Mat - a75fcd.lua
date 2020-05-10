backup = "29c2ce"

decks = {}
decks["Player Curse"] = {pos = {51.60, 1.86, 23.65}, rot = {0.00, 180.00, 0.00}}
decks["Bless"] = {pos = {51.60, 1.86, 19.98}, rot = {0.00, 180.00, 0.00}}
decks["Player -1"] = {pos = {51.60, 1.88, 16.38}, rot = {0.00, 180.00, 0.00}}
decks["Road Events 01-30"] = {pos = {51.60, 1.95, 12.72}, rot = {0.00, 270.00, 0.00}}
decks["Road Events 31-69"] = {pos = {51.60, 1.98, 9.13}, rot = {0.00, 270.00, 0.00}}
decks["City Events 01-30"] = {pos = {51.60, 1.95, 5.49}, rot = {0.00, 270.00, 0.00}}
decks["City Events 31-81"] = {pos = {51.60, 2.04, 1.86}, rot = {0.00, 270.00, 0.00}}
decks["Random Dungeons"] = {pos = {51.60, 1.87, -1.77}, rot = {0.00, 270.00, 180.00}}
decks["Random Locations"] = {pos = {51.61, 1.93, -5.43}, rot = {0.00, 270.00, 180.00}}
decks["Random Monsters"] = {pos = {51.61, 1.93, -9.04}, rot = {0.00, 270.00, 180.00}}
decks["Personal Quests"] = {pos = {51.59, 1.95, -12.66}, rot = {0.00, 270.00, 180.00}}
decks["Battle Goals"] = {pos = {51.60, 1.95, -16.31}, rot = {0.00, 270.00, 180.00}}
decks["Player Reference"] = {pos = {51.60, 2.06, -19.93}, rot = {0.00, 270.00, 0.00}}
decks["Monster Curse"] = {pos = {51.60, 1.86, -23.66}, rot = {0.00, 180.00, 0.00}}

function onLoad(save_state)

  buttonParameter = {
    function_owner = self,
    label          = "",
    width          = 400,
    height         = 400,
    color          = {0,0,0,0},
    tooltip        = "Get a new Deck"
  }

  local count = 0
  for i, j in pairs(decks) do
    buttonParameter.position = {-9.315 + 1.43 * count, 0.1, 0}
    self.setVar("button" .. i, function () getDeck(i) end)
    buttonParameter.click_function = "button" .. i
    self.createButton(buttonParameter)
    count = count + 1
  end
end

function getDeck(deck)
  backupChest = getObjectFromGUID(backup)
  for i,j in pairs(backupChest.getObjects()) do
    if j.name == deck then
      local infiDeck = backupChest.takeObject({
        position       = {-95, 2, 0},
        smooth         = false,
        guid           = j.guid
      })
      if deck == "Player Reference" then
        local modDeck = infiDeck.clone({
          position     = decks[deck].pos
        })
        Timer.create({
          identifier     = "modDeck",
          function_name  = "rotateDeck",
          function_owner = self,
          parameters     = {modDeck},
          delay          = 0.1
        })
      else
        infiDeck.takeObject({position = decks[deck].pos, rotation = decks[deck].rot})
      end
      backupChest.putObject(infiDeck)
    end
  end
end

function rotateDeck(param)
  param[1].setRotation(decks["Player Reference"].rot)
end