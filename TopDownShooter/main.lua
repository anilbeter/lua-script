function love.load()
  sprites = {}
  sprites.background = love.graphics.newImage("Sprites/background.png")
  sprites.player = love.graphics.newImage("Sprites/player.png")
  sprites.bullet = love.graphics.newImage("Sprites/bullet.png")
  sprites.zombie = love.graphics.newImage("Sprites/zombie.png")

  player = {}
  player.width = sprites.player:getWidth()
  player.height = sprites.player:getHeight()
  player.x = love.graphics.getWidth() / 2 - player.width/2
  player.y = love.graphics.getHeight() / 2 - player.height/2
  player.speed = 2
end

function love.update(dt)
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
  love.graphics.draw(sprites.player, player.x, player.y)
end