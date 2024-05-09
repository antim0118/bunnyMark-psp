#include <LTexture.h>

LTexture::LTexture()
{
    mTexture = NULL;
    mWidth = 0;
    mHeight = 0;
}

LTexture::~LTexture()
{
    free();
}

bool LTexture::loadFromFile(SDL_Renderer *renderer, const char* filename)
{
    free();
    SDL_Surface *surface = IMG_Load(filename);
	if (surface == NULL) {
		printf("Creating surface failed: %s\n", SDL_GetError());
		return false;
	}
    
	mTexture = SDL_CreateTextureFromSurface(renderer, surface);
	SDL_FreeSurface(surface);
	return true;
}

bool LTexture::loadFromRenderedText(SDL_Renderer *renderer, const char* textureText, TTF_Font* font, SDL_Color textColor){
    free();
    
    //TTF_RenderUTF8_Solid -- КРАШИТ ИГРУ НА ПИХЕ!
    SDL_Surface* textSurface = TTF_RenderUTF8_Blended(font, textureText, textColor);
    if(textSurface == NULL)
    {
        printf("Unable to render text surface! SDL_ttf Error: %s\n", TTF_GetError());
        return false;
    }
    
    mTexture = SDL_CreateTextureFromSurface(renderer, textSurface);
    if(mTexture == NULL)
    {
        printf("Unable to create texture from rendered text! SDL Error: %s\n", SDL_GetError());
        return false;
    }
     
    mWidth = textSurface->w;
    mHeight = textSurface->h;
    
    SDL_FreeSurface(textSurface);
    
    
    return true;
}

void LTexture::free()
{
    if( mTexture != NULL )
    {
        SDL_DestroyTexture( mTexture );
        mTexture = NULL;
        mWidth = 0;
        mHeight = 0;
    }
}

void LTexture::setColor( Uint8 red, Uint8 green, Uint8 blue )
{
    SDL_SetTextureColorMod( mTexture, red, green, blue );
}

void LTexture::setColor(unsigned int color){
    unsigned char r = (color & 0x000000FF);
    unsigned char g = (color & 0x0000FF00) >> 8;
    unsigned char b = (color & 0x00FF0000) >> 16;
    setColor((Uint8)r, (Uint8)g, (Uint8)b);
}

void LTexture::setBlendMode(SDL_BlendMode blending)
{
    SDL_SetTextureBlendMode( mTexture, blending );
}
        
void LTexture::setAlpha(Uint8 alpha)
{
    SDL_SetTextureAlphaMod(mTexture, alpha);
}

void LTexture::render(SDL_Renderer *renderer, int x, int y, SDL_Rect* clip, 
    double angle, SDL_Point* center, SDL_RendererFlip flip)
{
    SDL_Rect renderQuad = { x, y, mWidth, mHeight };
    if(clip != NULL){
        renderQuad.w = clip->w;
        renderQuad.h = clip->h;
    }

    if(angle == 0.0 && flip == SDL_FLIP_NONE)
        SDL_RenderCopy(renderer, mTexture, clip, &renderQuad);
    else
        SDL_RenderCopyEx(renderer, mTexture, clip, &renderQuad, angle, center, flip);
}

void LTexture::renderBunny(SDL_Renderer *renderer, Bunny *bunny)
{
    SDL_FRect renderQuad = { bunny->x, bunny->y, 26.0f * bunny->scale, 37.0f * bunny->scale };
    SDL_RenderCopyF(renderer, mTexture, bunny->tex_rect, &renderQuad);
}

int LTexture::getWidth()
{
    return mWidth;
}

int LTexture::getHeight()
{
    return mHeight;
}