message = "Imma go on my way!"
myNumber = 23
chickenNum = 5
output = chickenNum + 18 -- 23

myNumber = myNumber + 1 -- 24


function love.draw()
  -- set font size to 50
  love.graphics.setFont(love.graphics.newFont(50))
  love.graphics.print(myNumber)
end