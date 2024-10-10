require("Assets/Scripts/Rect")
require("Assets/Scripts/Bunny")

width = screen:w()
height = screen:h()

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

bgColor = Color.new(255, 255, 255)
font = intraFont.load('Assets/Fonts/ltn0.pgf')
fontFGColor = Color.new(0, 255, 255)
fontBGColor = Color.new(16, 92, 182)

bunnyTextures = nil
currentTexture = nil
bunnyType = nil

function spawnBunny()
    local bunny = Bunny:create(currentTexture)
    table.insert(bunnys, bunny)
    count = count + 1
end

function onReady() 
    wabbitTexture = Image.load("Assets/Sprites/bunnys.png")

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

local crossPressed = false
function update()
    screen:clear(bgColor)

    local pad = Controls.read()
    if not crossPressed and pad:cross() then
        onTouchStart()
        crossPressed = true
    end
    if crossPressed and not pad:cross() then
        onTouchEnd()
        crossPressed = false
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
        Image:blit(bunny.x, bunny.y, wabbitTexture, 255, 0, tex.x, tex.y, tex.w, tex.h)
    end

    screen:intraFontPrint(2, 15, font, count .. " BUNNIES", fontFGColor, fontBGColor)	


    screen.flip()
    --sleep(0.016)
end

onReady()
while true do
    update()
end