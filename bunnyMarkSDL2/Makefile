TARGET = template
OBJS = main.o callback.o include/Bunny.o include/LTexture.o

PSP_LARGE_MEMORY = 1

INCDIR = include
CFLAGS = -O3 -G0 -Wall
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR = libs
LDFLAGS =
LIBS = -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf \
		-lfreetype -lbz2 -lpng16 -ljpeg \
		-lGL -lGLU -lglut -lz -lpspvfpu -lpsphprm -lpspsdk -lpspctrl -lpspumd -lpsprtc \
       	-lpsppower -lpspgum -lpspgu -lpspaudiolib -lpspaudio -lm -lpspvram

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = bunnyMark on SDL2
PSP_EBOOT_ICON = ICON0.png

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak

%.o: %.bmp
	bin2o -i $< $@ $(addsuffix _bmp, $(basename $(notdir $<) ))

%.o: %.jpg
	bin2o -i $< $@ $(addsuffix _jpg, $(basename $(notdir $<) ))

%.o: %.png
	bin2o -i $< $@ $(addsuffix _png, $(basename $(notdir $<) ))
