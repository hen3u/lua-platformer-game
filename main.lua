dofile("utils.lua")
dofile("player.lua")

function love.load()
  -- init background
  bg = love.graphics.newImage("graphics/background.jpg")

  -- init audio
  music = love.audio.newSource("sounds/seashore.mp3", "stream")
  music:setLooping(true)
  music:play()
  jump = love.audio.newSource("sounds/jump.wav", "static")

  -- init players
  players = {}
  args1 = {
    keys = {jump="up",left="left",right="right"}
  }
  player1 = Player:new(self,args1)
  player1.x = 0
  player1.y = love.graphics.getHeight() - player1.height

  args2 = {
    keys = {jump="z",left="q",right="d"}
  }
  player2 = Player:new(self,args2)
  player2.x = love.graphics.getWidth() - player2.width
  player2.y = love.graphics.getHeight() - player2.height


  table.insert(players, player1)
  table.insert(players, player2)
end

function love.update(dt)
  for _,player in pairs(players) do
    player:update()
    if player.y <= love.graphics.getHeight() - player.height then
      player.y = player.y + 5
    end
  end

end

function love.draw()
    love.graphics.draw(bg,0,0,0,love.graphics.getWidth()/bg:getWidth(),love.graphics.getHeight()/bg:getHeight())

    for _,player in pairs(players) do
      player:draw()
    end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit(0)
  end
end
