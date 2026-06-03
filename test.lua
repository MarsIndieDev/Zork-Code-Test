function love.load()
    -- Track where you are standing: "none", "door1", or "door2"
    currentDoor = "none" 
    -- Track game screen: "playing", "dead", or "safe"
    gameScreen = "playing" 
end

function love.draw()
    if gameScreen == "playing" then
        love.graphics.print("Press 1 to go to Door 1", 50, 50)
        love.graphics.print("Press 2 to go to Door 2", 50, 80)
        love.graphics.print("You are currently standing at: " .. currentDoor, 50, 120)
        love.graphics.print("Press U to go inside the door!", 50, 150)
        
    elseif gameScreen == "dead" then
        love.graphics.print("You went inside Door 1 and DIED!", 50, 50)
        love.graphics.print("Press R to try again", 50, 80)
        
    elseif gameScreen == "safe" then
        love.graphics.print("You went inside Door 2 and you are SAFE!", 50, 50)
        love.graphics.print("Press R to play again", 50, 80)
    end
end

function love.keypressed(key)
    if gameScreen == "playing" then
        -- 1. Choose which door to stand at
        if key == "1" then
            currentDoor = "door1"
        elseif key == "2" then
            currentDoor = "door2"
            
        -- 2. Press U to enter the door you are currently standing at
        elseif key == "u" then
            if currentDoor == "door1" then
                gameScreen = "dead"
            elseif currentDoor == "door2" then
                gameScreen = "safe"
            end
        end
        
    -- Reset the game if you press R on the win/lose screens
    elseif key == "r" then
        gameScreen = "playing"
        currentDoor = "none"
    end
end
