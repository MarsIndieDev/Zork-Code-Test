function love.load()
    love.window.setMode(1590, 720)

    love.graphics.setFont(love.graphics.newFont(24))

    textChoice = "default"

    bg  = love.graphics.newImage("Image/BC one.png")
    bg2 = love.graphics.newImage("Image/BC one.png")
    bg3 = love.graphics.newImage("Image/TinyBunny1.jpg")
    bg34 = love.graphics.newImage("Image/TinyBunny2.png")
    bg35 = love.graphics.newImage("Image/A.png")
    bg4 = love.graphics.newImage("Image/BC TWO.png")

    bg41 = love.graphics.newImage("Image/TinyBunny4.png")
    bg42 = love.graphics.newImage("Image/TinyBunny5.png")

    bg1 = love.graphics.newImage("Image/A.png")

    CH = love.graphics.newImage("Image/CH.png")


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
            message = "Door is locked"
        end
    end
end

------------------------------------------------------------

function love.draw()
    love.graphics.setColor(1, 1, 1)

    if textChoice == "default" then
        love.graphics.draw(bg1, 40, 15, 0, 0.6, 0.6)

        love.graphics.print(
        [[ZORK 1: The Great Underground Empire
        West of House
        You are standing in an open field west of a white house.
        There is a small mailbox here.]], 50, 150)

        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "one" then
        love.graphics.draw(bg3, 0, 0, 0, 0.81, 0.81)
        love.graphics.draw(CH, 700, 330, 0, 0.4, 0.4)
        love.graphics.print("North of House\nYou see boarded windows.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "two" then
        love.graphics.draw(bg34, 0, 0, 0, 0.87, 0.87)
        love.graphics.draw(CH, 500, 500, 0, 0.2, 0.2)
        love.graphics.print("South of House\nThere is no door here.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "three" then
        love.graphics.draw(bg42, 0, 0, 0, 3.3, 3.3)
        love.graphics.draw(CH, 0, 70, 0, 0.6, 0.6)
        love.graphics.print("Behind House\nA forest path leads east.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)

    elseif textChoice == "four" then
        love.graphics.draw(bg41, 0, 0, 0, 3, 3)
        love.graphics.draw(CH, 900, 70, 0, 0.6, 0.6)
        love.graphics.print("West of House\nThere is a small mailbox here.", 50, 150)
        love.graphics.print(" Press 'n' to go north, 'w' west, 'e' east, 's' south. \n Press 'u' to go forward", 50, 600)
    end
  
    if message ~= "" then
        love.graphics.print(message, 50, 500)
    end
end