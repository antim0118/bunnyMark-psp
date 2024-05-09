#include <headers.h>

PSP_MODULE_INFO("SDL2", 0, 1, 1);
PSP_MAIN_THREAD_ATTR(THREAD_ATTR_USER | THREAD_ATTR_VFPU);

enum PspControllerKeys
{
	PSP_KEY_TRIANGLE,
	PSP_KEY_CIRCLE,
	PSP_KEY_CROSS,
	PSP_KEY_SQUARE,
	PSP_KEY_L,
	PSP_KEY_R,
	PSP_KEY_DOWN,
	PSP_KEY_LEFT,
	PSP_KEY_UP,
    PSP_KEY_RIGHT,
	PSP_KEY_SELECT,
	PSP_KEY_START,
	PSP_KEY_HOME,
	PSP_KEY_HOLD,
	PSP_KEY_UNKNOWN14,
	PSP_KEY_UNKNOWN15,
	PSP_KEY_UNKNOWN16,
	PSP_KEY_UNKNOWN17
};

bool init();
bool loadAssets();
void close();

const unsigned int countLimit = 5000;
const unsigned int startBunnyCount = 2;
const unsigned int amount = 10;
unsigned int count = 0;
unsigned char bunnyType = 2;
bool isAdding = false;

SDL_Renderer *gRenderer = NULL;
SDL_Joystick *gJoystick = NULL;
SDL_Window* gWindow = NULL;
LTexture texBunny;
LTexture gFPS;
LTexture gBunnys;
Bunny bunnys[countLimit];
TTF_Font* gFont = NULL;
SDL_Rect bunny[5] = {
	{2, 47, 26, 37},
	{2, 86, 26, 37},
	{2, 125, 26, 37},
	{2, 164, 26, 37},
	{2, 2, 26, 37}
};

bool init()
{
    if(SDL_Init( SDL_INIT_VIDEO | SDL_INIT_JOYSTICK) < 0)
    {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return false;
    }
	
	if( TTF_Init() == -1 )
	{
		printf("SDL_ttf could not initialize! SDL_ttf Error: %s\n", TTF_GetError());
		return false;
	}
	
	int imgFlags = IMG_INIT_PNG;
	if(!(IMG_Init( imgFlags ) & imgFlags))
	{
		printf("SDL_image could not initialize! SDL_image Error: %s\n", IMG_GetError());
		return false;
	}
	
	if (SDL_NumJoysticks() < 1)
		printf("No joysticks connected!\n");
	else {
		SDL_JoystickEventState(SDL_ENABLE);
		gJoystick = SDL_JoystickOpen(0);
		if (gJoystick == NULL)
			printf("Unable to open game joystick! SDL Error: %s\n", SDL_GetError());
	}

	gWindow = SDL_CreateWindow("SDL", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_FULLSCREEN);
	if( gWindow == NULL )
	{
		printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
		return false;
	}
	
	gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
	SDL_SetRenderDrawBlendMode(gRenderer, SDL_BLENDMODE_BLEND);
	SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "0");

    return true;
}

bool loadAssets()
{
	printf("loading bunnys \n");
	if(!texBunny.loadFromFile(gRenderer, "img/bunnys.png")) return false;
	
	gFont = TTF_OpenFont("fonts/arialbd.ttf", 12);
	if(gFont == NULL)
    {
        printf("Failed to load font! SDL_ttf Error: %s\n", TTF_GetError());
        return false;
    }
	
    return true;
}

void close()
{
	printf("[CLOSE] Closing the game...\n");
	
	printf("[CLOSE] Free resources: texBunnys\n");
		texBunny.free();
	
	TTF_CloseFont(gFont);
	
	printf("[CLOSE] Destroying gWindow\n");
    SDL_DestroyWindow( gWindow );
    gWindow = NULL;
	
	printf("[CLOSE] Closing gJoystick\n");
	SDL_JoystickClose(gJoystick);
	gJoystick = NULL;
	
	printf("[CLOSE] Calling SDL_QUIT\n");
    SDL_Quit();
	
	printf("[CLOSE] sceKernelExitGame\n");
	sceKernelExitGame();
}

void SpawnBunny(){
	if(count < countLimit){
		bunnys[count].Spawn(&bunny[bunnyType]);
		count++;
	}
}

int main(int argc, char *argv[]) {
	SetupCallbacks();
	if(!init()){
		printf( "Failed to initialize!\n" );
		close();
		return 0;
	}
	
	if(!loadAssets()){
		printf( "Failed to load assets!\n" );
		close();
		return 0;
	}
	
	for(unsigned int i = 0; i < startBunnyCount; i++){
		SpawnBunny();
	}
	
	SDL_Color textColor = { 0, 0, 0, 255 };
	char fpsStr[16];
	char bunnysStr[16];
	
	SDL_Event e;
	bool quit = false;
	int countedFrames = 0;
	Uint32 lastTicks = 0;
	float avgFPS = 60.0;
	while(!quit && isRunning())
	{
		while(SDL_PollEvent(&e))
		{
			switch (e.type)
			{
				case SDL_QUIT:
					quit = true;
					break;
				
				case SDL_JOYBUTTONDOWN:
					if (e.jbutton.which == 0) {
						if (e.jbutton.button == PSP_KEY_START)
							quit = true;
						else if(e.jbutton.button == PSP_KEY_CROSS)
							isAdding = true;
					}
					break;
				
				case SDL_JOYBUTTONUP:
					if (e.jbutton.which == 0) {
						if(e.jbutton.button == PSP_KEY_CROSS){
							bunnyType += 1;
							bunnyType %= 5;
							isAdding = false;
						}
					}
					break;
				
				default:
					break;
			}
		}
		
		if(isAdding){
			for(unsigned int i = 0; i < amount; i++){
				SpawnBunny();
			}
		}
		
		sprintf(fpsStr, "%.0f FPS", avgFPS);
		sprintf(bunnysStr, "%i BUNNIES", count);
		
		gFPS.loadFromRenderedText(gRenderer, fpsStr, gFont, textColor);
		gBunnys.loadFromRenderedText(gRenderer, bunnysStr, gFont, textColor);
		
		SDL_SetRenderDrawColor(gRenderer, 255, 255, 255, 255);
		SDL_RenderClear(gRenderer);
		
		if(countedFrames >= 10){
			avgFPS = countedFrames / ((SDL_GetTicks() - lastTicks) / 1000.f);
			if( avgFPS > 2000000 )
				avgFPS = 0;
			lastTicks = SDL_GetTicks();
			countedFrames = 0;
		}
		
		//printf("COUNT: %li\n", count);
		for(unsigned int i = 0; i < count; i++){
			bunnys[i].process();
			texBunny.renderBunny(gRenderer, &bunnys[i]);
		}
		
		SDL_SetRenderDrawColor(gRenderer, 0, 255, 255, 255);
		SDL_Rect guiRect = { 0, 0, gBunnys.getWidth() + 2, 26 };
		SDL_RenderFillRect(gRenderer, &guiRect);
		gFPS.render(gRenderer, 0, 0);
		gBunnys.render(gRenderer, 0, 12);
		
		SDL_RenderPresent(gRenderer);
		++countedFrames;
	}
			
	close();
	return 0;
}
