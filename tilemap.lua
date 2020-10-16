local tileSize = 32

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

function Map:load()
  MapTable = loadTiledMap("map/map1.txt")
end

function Map:update()

end

function Map:draw()
  for y,row in ipairs(MapTable) do
    if y ~= 1 then

      for x,idx in pairs(row) do
        if idx == "049" or idx == "021" or idx == "015" then
          love.graphics.setColor(0, 0, 0, 1) -- background color
          love.graphics.rectangle("fill", x*tileSize, y*tileSize, tileSize, tileSize)

          love.graphics.setColor(0, 1, 0, 1) -- line and text color
          love.graphics.rectangle("line", x*tileSize, y*tileSize, tileSize, tileSize)
          love.graphics.print(idx, x*tileSize, y*tileSize)

          love.graphics.setColor(1, 1, 1, 1) -- default color
        end
      end
    end
  end
end

function loadTiledMap(path)
  local rawTileMap = {}
  for row in love.filesystem.lines(path) do
    elements = {}
    for element in row:gmatch("%w+") do
      table.insert(elements, element)
    end
    table.insert(rawTileMap,elements)
  end
  return rawTileMap
end
