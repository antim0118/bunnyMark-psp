#include <headers.h>

PSP_MODULE_INFO("OSLIB", 0, 1, 1);
PSP_MAIN_THREAD_ATTR(THREAD_ATTR_USER | THREAD_ATTR_VFPU);

const unsigned int countLimit = 5000;
const unsigned int startBunnyCount = 2;
const unsigned int amount = 10;
unsigned int count = 0;
unsigned char bunnyType = 2;
bool isAdding = false;

OSL_IMAGE* texBunny = NULL;
Bunny bunnys[countLimit];

void init_osl()
{
	oslInit(0);
	oslInitGfx(OSL_PF_8888, 1);

	oslSetTransparentColor(RGB(255, 0, 255));

	texBunny = oslLoadImageFilePNG("img/bunnys2.png", OSL_IN_VRAM | OSL_SWIZZLED, OSL_PF_8888);
	oslSetImageFrameSize(texBunny, 28, 37);

	oslDisableTransparentColor();
}

void SpawnBunny()
{
	if (count < countLimit)
	{
		bunnys[count].Spawn(bunnyType);
		count++;
	}
}

int main(int argc, char* argv[])
{
	init_osl();

	for (unsigned int i = 0; i < startBunnyCount; i++)
	{
		SpawnBunny();
	}

	int countedFrames = 0;
	double avgFPS = 60.0;
	int skip = 0;
	u64 lastTicks = 0, ticks = 0;
	sceRtcGetCurrentTick(&lastTicks);
	while (!osl_quit)
	{
		if (!skip)
		{
			oslStartDrawing();
			oslReadKeys();
			oslClearScreen(0xFFFFFF);

			if (osl_keys->pressed.cross)
				isAdding = true;
			else if (osl_keys->released.cross)
			{
				bunnyType += 1;
				bunnyType %= 5;
				isAdding = false;
			}

			if (isAdding)
			{
				for (unsigned int i = 0; i < amount; i++)
				{
					SpawnBunny();
				}
			}

			if (countedFrames >= 10)
			{
				sceRtcGetCurrentTick(&ticks);
				avgFPS = countedFrames / ((ticks - lastTicks) / 1000000.0);
				if (avgFPS > 2000000)
					avgFPS = 0;
				lastTicks = ticks;
				countedFrames = 0;
			}

			for (unsigned int i = 0; i < count; i++)
			{
				bunnys[i].process();
				oslSetImageFrame(texBunny, bunnys[i].frame);
				oslDrawImageXY(texBunny, bunnys[i].x, bunnys[i].y);
			}
			
			oslPrintf_xy(0, 15, "%.0f FPS", avgFPS);
			oslPrintf_xy(0, 25, "%i BUNNIES", count);

			oslEndDrawing();
			++countedFrames;
		}
		oslEndFrame();
		skip = oslSyncFrame();
		
	}
	
	oslEndGfx();
	oslQuit();
	return 0;
}
