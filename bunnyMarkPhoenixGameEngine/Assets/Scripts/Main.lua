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

startBunnyCount = 2
isAdding = false
count = 0

amount = 10

bgColor = pge.gfx.createcolor(255, 255, 255)
font = pge.font.load("Assets/Fonts/arialbd.ttf", 12, PGE_VRAM)

fontFGColor = pge.gfx.createcolor(0, 255, 255)
fontBGColor = pge.gfx.createcolor(16, 92, 182)

bunnyTextures = nil
currentTexture = nil
bunnyType = nil

function spawnBunny()
    local bunny = Bunny:create(currentTexture)
    table.insert(bunnys, bunny)
    count = count + 1
end

function onReady() 
    wabbitTexture = pge.texture.load("Assets/Sprites/bunnys.png", PGE_VRAM)

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



local fpsTimer = pge.timer.create()
local FPS = 60

onReady()
while true do
    pge.controls.update()
	pge.gfx.startdrawing()
    pge.gfx.clearscreen(bgColor)
    
    if pge.controls.pressed(PGE_CTRL_CROSS) then
        onTouchStart()
    end
    if pge.controls.released(PGE_CTRL_CROSS) then
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

    wabbitTexture:activate()
    for i = 1, count do
        local bunny = bunnys[i]
        Bunny:processPhysics(bunny)
        local tex = bunny.texture
        wabbitTexture:draw( 
            bunny.x, bunny.y, bunny.w, bunny.h,
            tex.x, tex.y, tex.w, tex.h)
    end

    pge.timer.update(fpsTimer)
    FPS = math.floor(1 / pge.timer.getdelta(fpsTimer))

    pge.gfx.drawrect(0, 0, 90, 30, fontBGColor)
    font:activate()
    font:print(2, 2, fontFGColor, FPS .. " FPS")--, fontFGColor, fontBGColor)
    font:print(2, 16, fontFGColor, count .. " BUNNIES")--, fontFGColor, fontBGColor)

    pge.gfx.enddrawing()
	pge.gfx.swapbuffers()
end