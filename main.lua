local lastX = nil
local lastY = nil
local canvas = nil

local HEIGHT = 600
local WIDTH = 800
local TOP = 0
local LEFT = 0

function love.load()
  -- love.mouse.setVisible(true)
  love.mouse.setVisible(false) -- make default mouse invisible
  img = love.graphics.newImage("cross-black.png") -- load in a custom mouse image
  canvas = love.graphics.newCanvas(WIDTH, HEIGHT)
  lastX, lastY = love.mouse.getPosition()

end

function love.draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
  love.graphics.rectangle("fill", LEFT, TOP, WIDTH, HEIGHT, 0, 0)
  -- love.graphics.print("Hello World", 400, 300)
  local x, y = love.mouse.getPosition() -- get the position of the mouse
  -- print("x,y = ",x,y)
  love.graphics.draw(img, x, y) -- draw the custom mouse image
  love.graphics.draw(canvas, LEFT, TOP)

end

function love.update()
  local x, y = love.mouse.getPosition()
  if love.mouse.isDown(1) then
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(1.0, 0.0, 0.0, 1.0)
    love.graphics.line(lastX, lastY, x, y)
    love.graphics.setCanvas()
  end
  lastX, lastY = x, y
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
    love.graphics.rectangle("fill", 0, 0, WIDTH, HEIGHT)
    love.graphics.setCanvas()
  end
end
