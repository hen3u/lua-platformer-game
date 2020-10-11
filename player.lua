Player = {}

function Player:new(o,args)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.x = args.x or 0
  self.y = args.y or 0
  self.width = args.width or 32
  self.height = args.height or 64
  self.jump_height = args.jump_height or 20
  o.keys = args.keys or {jump="up",left="left",right="right"}
  return o
end

function Player:update()
  if love.keyboard.isDown(self.keys.left) then
    if self.x - 10 >= 0 then
      self.x = self.x - 10
    else
      self.x = 0
    end
  end
  if love.keyboard.isDown(self.keys.right) then
    if self.x + 10 <= love.graphics.getWidth() - self.width then
      self.x = self.x + 10
    else
      self.x = love.graphics.getWidth() - self.width
    end
  end
  if love.keyboard.isDown(self.keys.jump) then
    jump:play()
    self.y = self.y - self.jump_height
  end
end

function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
