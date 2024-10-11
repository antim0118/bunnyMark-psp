require("Assets/Scripts/Rect")
require("Assets/Scripts/Bunny")
require('Assets/Scripts/buttonsCommon')

width = 480
height = 272

wabbitTexture = nil

bunnys = {}
gravity = 0.5 --1.5

maxX = width
minX = 0
maxY = height
minY = 0

startBunnyCount = 3000
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
local lastSecond = 0
local countedFrames = 0
local FPS = 60
local buttons_pad = nil
function update()
    screen.clear(bgColor)

    buttons.read()
    if press('cross') then
        onTouchStart()
    end
    if release('cross') then
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
        Image.draw(wabbitTexture, 
            bunny.x, bunny.y, bunny.w, bunny.h,
            nil,
            tex.x, tex.y, tex.w, tex.h)
    end

    if lastSecond ~= System.getTime().seconds then
        lastSecond = System.getTime().seconds
        FPS = countedFrames
        countedFrames = 0
    end
    countedFrames = countedFrames + 1

    intraFont.printBackground(font, 2, 15, tostring(FPS) .. " FPS", fontFGColor, fontBGColor)
    intraFont.printBackground(font, 2, 32, count .. " BUNNIES", fontFGColor, fontBGColor)

    screen.flip()
end

onReady()
while true do
    update()
end