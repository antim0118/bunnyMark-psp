#ifndef BUNNY_H
#define BUNNY_H

#include <headers.h>
#include <string.h>

class Bunny
{
public:
    Bunny();
    ~Bunny();

    void Spawn(int frame);
    bool isSpawned();

    void process();

    float x, y;
    float scale = 1.0f;
    int frame;

private:
    double speedX = 0;
    double speedY = 0;
    bool spawned = false;

};

#endif