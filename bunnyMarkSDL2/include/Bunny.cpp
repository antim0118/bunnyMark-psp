#include <Bunny.h>

const double gravity = 0.5;//1.5
const int maxX = SCREEN_WIDTH - 26/2;
const int minX = -26/2;
const int maxY = SCREEN_HEIGHT - 37/2;
const int minY = -37/2;

Bunny::Bunny(){
}

Bunny::~Bunny(){
}

int rand_range(int from, int to){
	return (rand() % (SDL_GetTicks()+500) % (to-from)) + from;
}

void Bunny::Spawn(SDL_Rect* texture_rect){
    tex_rect = texture_rect;
    speedX = (double)rand_range(0, 1000) / 100.0;
	speedY = (double)rand_range(0, 1000) / 100.0 - 5;
    scale = 0.5f + (float)rand_range(0, 50) / 100.0f;
    spawned = true;
}

bool Bunny::isSpawned(){
    return spawned;
}

void Bunny::process(){
    x += speedX;
    y += speedY;
    speedY += gravity;
    
    if(x > maxX){
        speedX *= -1.0;
        x = maxX;
    }
    else if(x < minX){
        speedX *= -1.0;
        x = minX;
    }
    
    if(y > maxY){
        speedY *= -0.85;
        y = maxY;
        if(rand_range(0, 100) > 50)
            speedY -= rand_range(0,60)/10.0;
    }
    else if(y < minY){
        speedY = 0.0;
        y = minY;
    }
}
