function love.load()
    love.window.setMode(1590, 720)

    love.graphics.setFont(love.graphics.newFont(24))

    textChoice = "default"

    bg  = love.graphics.newImage("Image/BC one.png")
    bg2 = love.graphics.newImage("Image/BC one.png")
    bg3 = love.graphics.newImage("Image/BC one.png")
    bg4 = love.graphics.newImage("Image/BC TWO.png")

    sounds = {}
        sounds.music = love.audio.newSource("sounds/atlasaudio-horror-ambience-512255.mp3", "stream")
        sounds.music:play()

    message = ""
end

------------------------------------------------------------

function love.keypressed(key)

    if key == "n" then 
        textChoice = "one" 
    end
    if key == "s" then 
        textChoice = "two"
     end
    if key == "e" then 
        textChoice = "three" 
    end
    if key == "w" then 
        textChoice = "four" 
    end

    if key == "u" then

        if textChoice == "two" then
            message = "The windows are shut"

        elseif textChoice == "four" then
            message = "You can't go that way"
         elseif textChoice == "three" then
            message = "Do you want to go in? Press u again"
        else
            message = "Nothing happens"
        end
    end
end

------------------------------------------------------------

function love.draw()
    love.graphics.setColor(1, 1, 1)

    if textChoice == "default" then
        love.graphics.draw(bg, 0, 0)

        love.graphics.print(
        [[ZORK 1: The Great Underground Empire
        West of House
        You are standing in an open field west of a white house.
        There is a small mailbox here.]], 50, 150)

        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "one" then
        love.graphics.draw(bg3, 0, 0)
        love.graphics.print("North of House\nYou see boarded windows.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "two" then
        love.graphics.draw(bg2 or bg, 0, 0)
        love.graphics.print("South of House\nThere is no door here.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "three" then
        love.graphics.draw(bg4, 0, 0)
        love.graphics.print("Behind House\nA forest path leads east.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "four" then
        love.graphics.draw(bg, 0, 0)
        love.graphics.print("West of House\nThere is a small mailbox here.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)
    end

  
    if message ~= "" then
        love.graphics.print(message, 50, 500)
    end
end