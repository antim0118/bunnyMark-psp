#ifndef LTEXTURE_H
#define LTEXTURE_H

#include <headers.h>

class Bunny;

class LTexture
{
    public:
        LTexture();
        ~LTexture();
        
        bool loadFromFile(SDL_Renderer *renderer, const char* filename);
        bool loadFromRenderedText(SDL_Renderer *renderer, const char* textureText, TTF_Font* font, SDL_Color textColor);
        
        void free();
        
        void setColor(Uint8 red, Uint8 green, Uint8 blue);
        void setColor(unsigned int color);
        
        void setBlendMode(SDL_BlendMode blending);
        void setAlpha(Uint8 alpha);
        
        void render(SDL_Renderer *renderer, int x, int y, SDL_Rect* clip = NULL, double angle = 0.0, SDL_Point* center = NULL, SDL_RendererFlip flip = SDL_FLIP_NONE);
        
        void renderBunny(SDL_Renderer *renderer, Bunny *bunny);
        
        int getWidth();
        int getHeight();
        
    private:
        SDL_Texture* mTexture;
        
        int mWidth;
        int mHeight;
};

#endif