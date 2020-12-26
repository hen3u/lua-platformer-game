Player = {}

function Player:load(args)
  player_graphics = love.graphics.newImage(args.sprite)
  player_sprite = love.graphics.newQuad(0,0,args.width,args.height,player_graphics:getDimensions())
  self.__index = self
  return setmetatable({
    x = args.x or 0,
    y = args.y or 0,
    width = args.width or 32,
    height = args.height or 64,
    jump_height = 20,
    direction = args.direction or "right",
    player_graphics = player_graphics,
    player_sprite = player_sprite,
    keys = args.keys or {jump="up",left="left",right="right"}
  }, self)
end

function Player:update(dt)
  if love.keyboard.isDown(self.keys.left) then
    self.direction = "left"
    if self.x - 10 >= 0 then
      self.x = self.x - 10
    else
      self.x = 0
    end
  end
  if love.keyboard.isDown(self.keys.right) then
    self.direction = "right"
    if self.x + 10 <= love.graphics.getWidth() - self.width then
      self.x = self.x + 10
    else
      self.x = love.graphics.getWidth()
    end
  end
  if love.keyboard.isDown(self.keys.jump) then
    jump:play()
    self.y = self.y - self.jump_height
  end
end

function Player:draw()
  --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  if self.direction == "right" then
    love.graphics.draw(self.player_graphics,self.player_sprite,self.x,self.y,0,-1,1)
  else
    love.graphics.draw(self.player_graphics,self.player_sprite,self.x,self.y,0,1,1)
  end

end
