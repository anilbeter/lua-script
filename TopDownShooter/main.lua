function love.load()
  math.randomseed(os.time())

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

  gameState = 1
  score = 0
  maxTime = 2
  timer = maxTime

  myFont = love.graphics.newFont(30)
end

function love.update(dt)
  if gameState == 2 then
    if love.keyboard.isDown("a") and player.x > player.width/2 then
      player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("d") and player.x < love.graphics.getWidth()-player.width/2 then
      player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown("w") and player.y > player.height/2 then
      player.y = player.y - player.speed * dt
    end
    if love.keyboard.isDown("s") and player.y < love.graphics.getHeight()-player.height/2 then
      player.y = player.y + player.speed * dt
    end
  end

  for i,z in ipairs(zombies) do
    z.x = z.x + math.cos(zombiePlayerAngle(z)) * z.speed * dt
    z.y = z.y + math.sin(zombiePlayerAngle(z)) * z.speed * dt

  if distanceBetween(z.x, z.y, player.x, player.y) < player.width then
    for i,z in ipairs(zombies) do
      zombies[i] = nil
      gameState = 1
      player.x = love.graphics.getWidth()/2 - player.width/2
      player.y = love.graphics.getHeight()/2 - player.height/2
    end
  end
end

  for i,b in ipairs(bullets) do
    b.x = b.x + math.cos(b.direction) * b.speed * dt
    b.y = b.y + math.sin(b.direction) * b.speed * dt
  end

  -- #bullets -> length/size of bullets table
  for i=#bullets, 1, -1 do
    local b = bullets[i]
    if b.x < 0 or b.y < 0 or b.x > love.graphics.getWidth() or b.y > love.graphics.getHeight() then
      table.remove(bullets, i)
    end
  end

  for i,z in ipairs(zombies) do
    for j,b in ipairs(bullets) do
      if distanceBetween(z.x, z.y, b.x, b.y) < z.width then
        z.dead = true
        b.dead = true
        score = score + 1
      end
    end
  end

  for i=#zombies, 1, -1 do
    local z = zombies[i]
    if z.dead == true then
      table.remove(zombies, i)
    end
  end

  for i=#bullets, 1, -1 do
    local b = bullets[i]
    if b.dead == true then
      table.remove(bullets, i)
    end
  end

  if gameState == 2 then
    timer = timer - dt
    if timer <= 0 then
      spawnZombie()
      maxTime = 0.95 * maxTime
      timer = maxTime
    end
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)

  if gameState == 1 then
    love.graphics.setFont(myFont)
    love.graphics.printf("Click anywhere to begin!", 0, 50, love.graphics.getWidth(), "center")
  end

  love.graphics.printf("Score: " .. score, 0, love.graphics.getHeight()-100, love.graphics.getWidth(), "center")

  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, player.width/2, player.height/2)
  -- player offset origini tam merkeze aldım, artık player kendi etrafında dönüyor

  for i,z in ipairs(zombies) do
    love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, z.width/2, z.height/2)
  end

  for i,b in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, b.x, b.y, nil, 1/2, 1/2, b.width/2, b.height/2)
  end
end

-- function love.keypressed(key)
--   if key == "space" then
--     spawnZombie()
--   end
-- end

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 and gameState == 2 then
    spawnBullet()
  elseif button == 1 and gameState == 1 then
    gameState = 2
    maxTime = 2
    timer = maxTime
    score = 0
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
  zombie.x = 0
  zombie.y = 0
  zombie.speed = 140
  zombie.dead = false
  
  local side = math.random(1, 4)
  if side == 1 then
    zombie.x = -30
    zombie.y = math.random(0, love.graphics.getHeight())
  elseif side == 2 then
    zombie.x = love.graphics.getWidth() + 30
    zombie.y = math.random(0, love.graphics.getHeight())
  elseif side == 3 then
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = -30
  elseif side == 4 then
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = love.graphics.getHeight() + 30
  end

  table.insert(zombies, zombie)
end

function spawnBullet()
  local bullet = {}
  bullet.width = sprites.bullet:getWidth()
  bullet.height = sprites.bullet:getHeight()
  bullet.x = player.x
  bullet.y = player.y
  bullet.speed = 460
  bullet.dead = false
  bullet.direction = playerMouseAngle()
  table.insert(bullets, bullet)
end

function zombiePlayerAngle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt( (x2-x1)^2 + (y2-y1)^2 ) 
end