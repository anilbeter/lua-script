message = 0

-- variables store 1 piece of data
-- tables, store multiple pieces of data

-- creating table (empty table atm)
anilFavs = {}
anilFavs[1] = 23
anilFavs[2] = "Maybe l.a. dream?"
anilFavs[3] = "dreams come through"
-- diğer proglama dilleri gibi index 0 dan başlamıyor, index 1den başlıyor

-- another way of creating table
testScores = {23, 99, 105}
print(testScores[1]) -- 23
testScores["math"] = 91
print(testScores["math"]) -- 91

-- add new elements into a table w/ insert function
table.insert(anilFavs, "Still thinking about.")

message = anilFavs[4]

function love.draw()
    -- set font size to 50
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.print(message)
end
