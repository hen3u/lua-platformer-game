Map = {}

function Map:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  -- self.x = args.x or 25
  -- self.y = args.y or 25
  -- self.width = args.width or 32
  -- self.height = args.height or 64
  -- o.grid = args.grid
  return o
end

function Map:load(path)
  local map = require(path)

  self.quads = {}
  self.tileset = map.tilesets[1]
  self.layers = map.layers
  self.image = love.graphics.newImage(self.tileset.image)

  for y = 0, (self.tileset.imageheight / self.tileset.tileheight) - 1 do
    for x = 0, (self.tileset.imagewidth / self.tileset.tilewidth) - 1 do
        local quad = love.graphics.newQuad(
            x * self.tileset.tilewidth,
            y * self.tileset.tileheight,
            self.tileset.tilewidth,
            self.tileset.tileheight,
            self.tileset.imagewidth,
            self.tileset.imageheight
        )
        table.insert(self.quads,quad)
    end
  end
end

function Map:update()

end

function Map:draw()
  for i, layer in ipairs(self.layers) do
    for y = 0, layer.height - 1 do
      for x = 0, layer.width - 1 do
        local index = (x + y * layer.width) + 1
        local tid = layer.data[index]
        if tid ~= 0 then
          local quad = self.quads[tid]
          love.graphics.draw(
              self.image,
              quad,
              x * self.tileset.tilewidth,
              y * self.tileset.tileheight
          )
        end
      end
    end
  end
end