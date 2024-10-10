Bunny = {}
Bunny.__index = Bunny

function Bunny:create(texture)
    local r = {}
    setmetatable(r, Bunny)
    r.x = 0
    r.y = 0

    r.texture = texture
    r.speedX = math.random() * 10
    r.speedY = math.random() * 10 - 5
    return r
end

function Bunny:processPhysics(bunny)
    bunny.x = bunny.x + bunny.speedX
    bunny.y = bunny.y + bunny.speedY
    bunny.speedY = bunny.speedY + gravity

    if bunny.x > maxX - bunny.texture.w then
        bunny.speedX = bunny.speedX * -1
        bunny.x = maxX - bunny.texture.w
    elseif bunny.x < minX then
        bunny.speedX = bunny.speedX * -1
        bunny.x = minX
    end

    if bunny.y > maxY - bunny.texture.h then
        bunny.speedY = bunny.speedY * -0.85
        bunny.y = maxY - bunny.texture.h
        if math.random() > 0.5 then
            bunny.speedY = bunny.speedY - math.random() * 6
        end
    elseif bunny.y < minY then
        bunny.speedY = 0
        bunny.y = minY
    end
end