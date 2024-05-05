#ifndef BUNNY_H
#define BUNNY_H

#include <headers.h>
#include <string.h>

class Bunny
{
    public:
        Bunny();
        ~Bunny();
        
        void Spawn(SDL_Rect* texture_rect);
        bool isSpawned();
        
        void process();
        
        float x, y;
        float scale = 1.0f;
        SDL_Rect* tex_rect;
        
    private:
        double speedX = 0;
        double speedY = 0;
        bool spawned = false;
        
};

#endif