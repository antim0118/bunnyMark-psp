Rect = {}
Rect.__index = Rect

function Rect:create(x,y,w,h)
    local r = {}
    setmetatable(r, Rect)
    r.x = x
    r.y = y
    r.w = w
    r.h = h
    return r
 end