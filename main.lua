require("utils")
require("tilemap")
require("player")

function love.load()
  -- init background
  bg = love.graphics.newImage("graphics/background.jpg")

  -- init tilemap
  tilemap = Map:new()
  tilemap:load("map/map1")

  -- init audio
  music = love.audio.newSource("sounds/seashore.mp3", "stream")
  music:setLooping(true)
  music:play()
  jump = love.audio.newSource("sounds/jump.wav", "static")

  --[[ DEBUG ]]
  music:setVolume(0.0)
  jump:setVolume(0.0)

  -- init players
  players = {}
  args1 = {
    keys = {jump="up",left="left",right="right"},
    sprite = "graphics/hitmonlee.png"
  }
  player1 = Player:new(self,args1)
  player1.x = 0
  player1.y = love.graphics.getHeight() - player1.height

  args2 = {
    keys = {jump="z",left="q",right="d"},
    sprite = "graphics/hitmonchan.png"
  }
  player2 = Player:new(self,args2)
  player2.x = love.graphics.getWidth() - player2.width
  player2.y = love.graphics.getHeight() - player2.height


  table.insert(players, player1)
  table.insert(players, player2)

  for _,player in pairs(players) do
    player:load()
  end

  --love.window.setFullscreen(true, "desktop")

end

function love.update(dt)
  for _,player in pairs(players) do
    player:update(dt)
    if player.y <= love.graphics.getHeight() - player.height then
      player.y = player.y + 5
    end
  end
end

function love.draw()
  -- draw background
  love.graphics.draw(bg,0,0,0,love.graphics.getWidth()/bg:getWidth(),love.graphics.getHeight()/bg:getHeight())

  -- draw tilemap
  tilemap:draw()

  -- draw players
  for _,player in pairs(players) do
    player:draw()
  end

  --- draw HUD
  love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
  love.graphics.print("WIDTH: "..love.graphics.getWidth()/32, 10,0)
  love.graphics.print("HEIGHT: "..love.graphics.getWidth()/32, 10,10)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit(0)
  end
end
