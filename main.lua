message = 0
test = 0
pickle = 0
hehe = 5

while message < 100 do
    message = message + 1
    test = test - 5
end

-- i-> iterator. 3-> when i reached to this value(3), loop will be stopped. 1-> i increases by 1 at every iteration 
for i = 1, 3, 1 do
    pickle = pickle + 10
end
-- i=1 ile başladı ve i=3'e kadar loop devam edecek ve her iteration da 1 artıyor çünkü 1 belirledim. her iteration da pickle 10 artıyor, 0 ile başladı loop sonunda 30 olucak

for i = 10, 5, -1 do
    hehe = hehe + 2
end
-- end of the loop hehe will be 17
-- loop iterates 6 times; 10, 9, 8, 7, 6, and 5 then will be over

function love.draw()
    -- set font size to 50
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.print(pickle) -- 30
end
