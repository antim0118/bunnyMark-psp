Bunny = {}
Bunny.__index = Bunny

local random = math.random

function Bunny:create(texture)
    local r = {}
    setmetatable(r, Bunny)
    r.x = 0
    r.y = 0

    r.texture = texture
    r.speedX = random() * 10
    r.speedY = random() * 10 - 5

    r.scale = 0.5 + random() * 0.5
    r.w = r.scale * texture.w
    r.h = r.scale * texture.h

    return r
end

function Bunny:processPhysics(bunny)
    local x = bunny.x + bunny.speedX
    local y = bunny.y + bunny.speedY
    local speedX = bunny.speedX
    local speedY = bunny.speedY + gravity
    local w = bunny.w
    local h = bunny.h

    if x > maxX - w then
        speedX = speedX * -1
        x = maxX - w
    elseif x < minX then
        speedX = speedX * -1
        x = minX
    end

    if y > maxY - h then
        speedY = speedY * -0.85
        y = maxY - h
        if random() > 0.5 then
            speedY = speedY - random() * 6
        end
    elseif y < minY then
        speedY = 0
        y = minY
    end
    
    bunny.x = x
    bunny.y = y
    bunny.speedX = speedX
    bunny.speedY = speedY
end
