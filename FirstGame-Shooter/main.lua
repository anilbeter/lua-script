function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 10

    -- new font size
    gameFont = love.graphics.newFont(40)

    sprites = {}
    sprites.sky = love.graphics.newImage("Sprites/sky.png")
    sprites.target = love.graphics.newImage("Sprites/target.png")
    sprites.crosshair = love.graphics.newImage("Sprites/crosshairs.png")

    crosshairWidth = sprites.crosshair:getWidth()
    crosshairHeight = sprites.crosshair:getHeight()

    love.mouse.setVisible(false)
end

function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    end

        if timer < 0 then
        timer = 0
    end
end

function love.draw()
    love.graphics.draw(sprites.sky, 0, 0)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)

    -- ceil = rounding up to the next higher integer, floor = rounding down
    love.graphics.print(math.ceil(timer), 300, 0)

    love.graphics.draw(sprites.target, target.x - target.radius, target.y- target.radius)
    love.graphics.draw(sprites.crosshair, love.mouse.getX() - crosshairWidth/2 , love.mouse.getY() - crosshairHeight/2)
end

function love.mousepressed(x, y, button, istouch, presses)
    -- button == 1 -> left click, 2 -> right click
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
end

-- distance formula
function distanceBetween(x1, y1, x2, y2)
   return math.sqrt((x2 - x1)^2 + (y2-y1)^2)
end