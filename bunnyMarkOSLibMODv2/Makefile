TARGET = template
OBJS = main.o callback.o include/Bunny.o

PSP_LARGE_MEMORY = 1

INCDIR = include
CFLAGS = -O3 -G0 -Wall
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR = libs
LDFLAGS =
LIBS = -losl -lpng -lz \
		-lpsphprm -ljpeg \
		-lpspsdk -lpspctrl -lpspumd -lpsprtc -lpsppower -lpspgu -lpspaudiolib -lpspaudio -lm

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = bunnyMark on OSLib MODv2
PSP_EBOOT_ICON = ICON0.png

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
