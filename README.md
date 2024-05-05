# bunnyMark-psp
Benchmark for PSP based on [Pixijs's BunnyMark](https://www.goodboydigital.com/pixijs/bunnymark/).

## How to use
1. [Download main branch](https://github.com/antim0118/bunnyMark-psp/archive/refs/heads/main.zip).
2. Connect your PSP to PC.
3. Copy folders to *#:\PSP\GAME* (folders must contain *EBOOT.PBP*).
4. Open the apps with your PSP.

## Tests

### SDL2 Library
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkSDL2/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 60 FPS | 37 FPS | 8 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 46 FPS | 10 FPS |


### Gamemaker 8.1 ([Chovy-GM](https://github.com/LiEnby/chovy-gm))
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkGamemaker81/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 4000 BUNNIES* |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 15 FPS | 8-9 FPS | 2 FPS |
| PPSSPP (Emulator) | 60 FPS | 30 FPS | 15 FPS | 4 FPS |


### [Godot 2.1](https://github.com/technicaljicama/godot-psp)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkGodot21/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 20 FPS | 5-6 FPS | 2-3 FPS | 1 FPS |
| PPSSPP (Emulator) | 60 FPS | 17-19 FPS | 10 FPS | 2-3 FPS |

`* - Crashes after this amount`