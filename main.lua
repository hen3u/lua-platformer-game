function love.load()
  bg = love.graphics.newImage("graphics/background.jpg")
  music = love.audio.newSource("sounds/seashore.mp3", "stream")
  music:setLooping(true)
  music:play()

  jump = love.audio.newSource("sounds/jump.wav", "static")


  player = {}
  player.x = 0
  player.y = 0
  player.width = 32
  player.height = 64
  player.jump_height = 20

  -- init
  player.y = love.graphics.getHeight() - player.height

  counter = 0
end

function love.update(dt)
  -- if love.keyboard.isDown("up") then
  --   if player.y - 10 >= 0 then
  --     player.y = player.y - 10
  --   else
  --     player.y = 0
  --   end
  if love.keyboard.isDown("left") then
    if player.x - 10 >= 0 then
      player.x = player.x - 10
    else
      player.x = 0
    end
  end
  if love.keyboard.isDown("right") then
    if player.x + 10 <= love.graphics.getWidth() - player.width then
      player.x = player.x + 10
    else
      player.x = love.graphics.getWidth() - player.width
    end
  end
  if love.keyboard.isDown("space") then
    jump:play()
    player.y = player.y - player.jump_height
  -- elseif love.keyboard.isDown("down") then
  --   if player.y +10 <= love.graphics.getHeight() - player.height then
  --     player.y = player.y + 10
  --   else
  --     player.y = love.graphics.getHeight() - player.height
  --   end
  end

  if player.y <= love.graphics.getHeight() - player.height then
    player.y = player.y + 5
  end

end

function love.draw()
    love.graphics.draw(bg,0,0,0,love.graphics.getWidth()/bg:getWidth(),love.graphics.getHeight()/bg:getHeight())
    --love.graphics.print("Hello World" .. counter, 400, 300)

    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit(0)
  end
end
