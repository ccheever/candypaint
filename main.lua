function love.load()
  love.mouse.setVisible(true)
  love.mouse.setVisible(false) -- make default mouse invisible
  img = love.graphics.newImage("cross-black.png") -- load in a custom mouse image

end

function love.draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
  love.graphics.rectangle("fill", 0, 0, 800, 600, 0, 0)
  -- love.graphics.print("Hello World", 400, 300)
  local x, y = love.mouse.getPosition() -- get the position of the mouse
  -- print("x,y = ",x,y)
  love.graphics.draw(img, x, y) -- draw the custom mouse image

end

