require("Assets/Scripts/Rect")
require("Assets/Scripts/Bunny")
width = 480
height = 272

wabbitTexture = nil

bunnys = {}
gravity = 0.5 --1.5

maxX = width
minX = 0
maxY = height
minY = 0

startBunnyCount = 2
isAdding = false
count = 0

amount = 10

bgColor = color.new(255, 255, 255)
font = font.load('Assets/Fonts/ltn0.pgf')
fontFGColor = color.new(0, 255, 255)
fontBGColor = color.new(16, 92, 182)

bunnyTextures = nil
currentTexture = nil
bunnyType = nil

function spawnBunny()
    local bunny = Bunny:create(currentTexture)
    table.insert(bunnys, bunny)
    count = count + 1
end

function onReady()
    wabbitTexture = image.loadv("Assets/Sprites/bunnys.png")

    bunnyTextures = {
        Rect:create(2, 47, 26, 37),
        Rect:create(2, 86, 26, 37),
        Rect:create(2, 125, 26, 37),
        Rect:create(2, 164, 26, 37),
        Rect:create(2, 2, 26, 37)
    }

    bunnyType = 2
    currentTexture = bunnyTextures[bunnyType]

    for i = 1, startBunnyCount do
        spawnBunny()
    end
end

function onTouchStart()
    isAdding = true;
end

function onTouchEnd()
    bunnyType = bunnyType + 1
    bunnyType = (bunnyType % 5) + 1;
    currentTexture = bunnyTextures[bunnyType];

    isAdding = false;
end

function update()
    screen.clear(bgColor)

    buttons.read()
    if buttons.cross then
        onTouchStart()
    end
    if buttons.released.cross then
        onTouchEnd()
    end

    if isAdding then
        -- add 10 at a time :)
        if count < 200000 then
            for i = 0, amount do
                spawnBunny()
            end
        end
    end

    for i = 1, count do
        local bunny = bunnys[i]
        Bunny:processPhysics(bunny)
        local tex = bunny.texture
        image.blit(wabbitTexture,
            bunny.x, bunny.y,
            tex.x, tex.y, tex.w, tex.h)
    end
    
    screen.print(font, 2, 6, screen.fps() .. " FPS", 0.75, fontFGColor, fontBGColor)
    screen.print(font, 2, 20, count .. " BUNNIES", 0.75, fontFGColor, fontBGColor)

    screen.flip()
end

onReady()
while true do
    update()
end
