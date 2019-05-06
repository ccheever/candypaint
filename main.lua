local lastX = nil
local lastY = nil
local canvas = nil

local HEIGHT = 600
local WIDTH = 800
local TOP = 0
local LEFT = 0

local color = {0.0, 0.0, 0.0, 1.0}

local cui = castle.ui

local log =
  require("https://raw.githubusercontent.com/ccheever/castle-utils/c5a150bf783bfcaf24bbcf8cbe0824fae34a8198/log.lua")
local cursorWidth
local cursorHeight

function love.load()
  -- love.mouse.setVisible(true)
  love.mouse.setVisible(false) -- make default mouse invisible
  img = love.graphics.newImage("cross-black.png") -- load in a custom mouse image
  cursorWidth = img:getWidth()
  cursorHeight = img:getHeight()
  canvas = love.graphics.newCanvas(WIDTH, HEIGHT)
  lastX, lastY = love.mouse.getPosition()
end

function love.draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
  love.graphics.rectangle("fill", LEFT, TOP, WIDTH, HEIGHT, 0, 0)
  -- love.graphics.print("Hello World", 400, 300)
  local x, y = love.mouse.getPosition() -- get the position of the mouse
  -- print("x,y = ",x,y)
  love.graphics.draw(img, x - ((cursorWidth - 1) / 2), y - ((cursorHeight - 1) / 2)) -- draw the custom mouse image
  love.graphics.draw(canvas, LEFT, TOP)
end

function love.update()
  local x, y = love.mouse.getPosition()
  if love.mouse.isDown(1) then
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(color[1], color[2], color[3], color[4])
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

function castle.uiupdate()
  if cui.button("red") then
    color = {1.0, 0.0, 0.0, 1.0}
  end
  if cui.button("green") then
    color = {0.0, 1.0, 0.0, 1.0}
  end
  if cui.button("blue") then
    color = {0.0, 0.0, 1.0, 1.0}
  end
  if cui.button("gold") then
    color = {1.0, 0.8, 0.0, 1.0}
  end
  if cui.button("light gray") then
    color = {0.8, 0.8, 0.8, 1.0}
  end
  if cui.button("dark gray") then
    color = {0.3, 0.3, 0.3, 1.0}
  end
  if cui.button("purple") then
    color = {0.7, 0.0, 0.7, 1.0}
  end
  if cui.button("black") then
    color = {0.0, 0.0, 0.0, 1.0}
  end
  if cui.button("white") then
    color = {1.0, 1.0, 1.0, 1.0}
  end
end
