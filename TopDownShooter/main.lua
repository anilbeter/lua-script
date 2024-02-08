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
  player.speed = 180
  -- in love.update, player.speed will be 3 (180 / 60 = player.speed * 1/60(dt))

  zombies = {}
  bullets= {}
end

function love.update(dt)
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed * dt
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed * dt
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed * dt
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed * dt
  end

  for i,z in ipairs(zombies) do
    z.x = z.x + math.cos(zombiePlayerAngle(z)) * z.speed * dt
    z.y = z.y + math.sin(zombiePlayerAngle(z)) * z.speed * dt

    if distanceBetween(z.x, z.y, player.x, player.y) < player.width then
      for i,z in ipairs(zombies) do
          zombies[i] = nil
      end
    end
  end

  for i,b in ipairs(bullets) do
    b.x = b.x + math.cos(b.direction) * b.speed * dt
    b.y = b.y + math.sin(b.direction) * b.speed * dt
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, player.width/2, player.height/2)
  -- player offset origini tam merkeze aldım, artık player kendi etrafında dönüyor

  for i,z in ipairs(zombies) do
    love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, z.width/2, z.height/2)
  end

  for i,b in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, b.x, b.y, nil, 1/2, 1/2, b.width/2, b.height/2)
  end
end

function love.keypressed(key)
  if key == "space" then
    spawnZombie()
  end
end

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 then
    spawnBullet()
  end
end

function playerMouseAngle()
  -- formula -> atan2(y1-y2, x1-x2)
  return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

function spawnZombie()
  local zombie = {}
  zombie.width = sprites.zombie:getWidth()
  zombie.height = sprites.zombie:getHeight()
  zombie.x = math.random(0, love.graphics.getWidth() - zombie.width)
  zombie.y = math.random(0, love.graphics.getHeight() - zombie.height)
  zombie.speed = 140
  
  table.insert(zombies, zombie)
end

function spawnBullet()
  local bullet = {}
  bullet.width = sprites.bullet:getWidth()
  bullet.height = sprites.bullet:getHeight()
  bullet.x = player.x
  bullet.y = player.y
  bullet.speed = 460
  bullet.direction = playerMouseAngle()
  table.insert(bullets, bullet)
end

function zombiePlayerAngle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt( (x2-x1)^2 + (y2-y1)^2 ) 
end