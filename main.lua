myNumber = 23
condition = 25

if condition > 0 then
  myNumber = 0
end

if condition <= 0 then
  myNumber = -1
end

function love.draw()
  -- set font size to 50
  love.graphics.setFont(love.graphics.newFont(50))
  love.graphics.print(myNumber)
end
