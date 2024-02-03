myNumber = 23
condition = -55

if condition > 0 then
  myNumber = 0
elseif condition < -50 then
  myNumber = 73
else
  myNumber = 100
end

function love.draw()
  -- set font size to 50
  love.graphics.setFont(love.graphics.newFont(50))
  love.graphics.print(myNumber) -- 73
end
