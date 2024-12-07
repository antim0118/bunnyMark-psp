# bunnyMark-psp
Benchmark for PSP based on [Pixijs's BunnyMark](https://www.goodboydigital.com/pixijs/bunnymark/).

## How to use
1. [Download main branch](https://github.com/antim0118/bunnyMark-psp/archive/refs/heads/main.zip).
2. Connect your PSP to PC.
3. Copy folders to *#:\PSP\GAME* (folders must contain *EBOOT.PBP*).
4. Open the apps with your PSP.

## Tests

### [OldSchool Library (OSLib) MODv2](https://github.com/dogo/oslibmodv2)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkOSLibMODv2/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 60 FPS | 60 FPS | 30 FPS | 15 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 60 FPS | 30 FPS | 20 FPS |

### SDL2 Library
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkSDL2/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 60 FPS | 37 FPS | 16 FPS | 8 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 46 FPS | 19 FPS | 10 FPS |

### [LuaPlayer Euphoria v8](https://www.brewology.com/downloads/download.php?id=11378&mcid=1)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkLuaPlayerEuphoria_V8/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 47 FPS | 23-24 FPS | 9-10 FPS | 4-5 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 50 FPS | 19-20 FPS | 9-10 FPS |

### [Phoenix Game Engine 0.02](https://archive.org/details/pgelua.7z)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkPhoenixGameEngine/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 30 FPS | 20 FPS | 9 FPS | 4-5 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 30 FPS | 12 FPS | 7 FPS |

### [LuaPlayerYT v0.4](https://vk.com/nomoreyuliateam)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkLuaPlayerYTv04/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 3700 BUNNIES* |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 20 FPS | 12 FPS | 5 FPS | 3-4 FPS |
| PPSSPP (Emulator) | 60 FPS | 60 FPS | 30 FPS | 15 FPS | 10 FPS |
`* - Crashes after 3745 bunnies`

### [ONElua v4R1](http://onelua.x10.mx/)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkONEluav4R1/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 20 FPS | 12 FPS | 6 FPS | 3 FPS |
| PPSSPP (Emulator) | 60 FPS | 30 FPS | 23-29 FPS | 12 FPS | 6 FPS |

### Gamemaker 8.1 ([Chovy-GM](https://github.com/LiEnby/chovy-gm))
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkGamemaker81/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 4000 BUNNIES* |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 60 FPS | 15 FPS | 8-9 FPS | 4 FPS | 2 FPS |
| PPSSPP (Emulator) | 60 FPS | 30 FPS | 15 FPS | 6 FPS | 4 FPS |
`* - Crashes after 4k bunnies`

### [Lua Player Plus r163](https://www.gamebrew.org/wiki/Lua_Player_Plus_PSP)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkLuaPlayerPlus_r163/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 39-40 FPS | 8-9 FPS | 4-5 FPS | 1-2 FPS | 1 FPS |
| PPSSPP (Emulator) | 60 FPS | 27 FPS | 13-14 FPS | 5-6 FPS | 2-3 FPS |

### [Godot 2.1](https://github.com/technicaljicama/godot-psp)
| ![ICON0](https://raw.githubusercontent.com/antim0118/bunnyMark-psp/master/bunnyMarkGodot21/ICON0.png "ICON0") | 100 BUNNIES | 500 BUNNIES | 1000 BUNNIES | 2500 BUNNIES | 5000 BUNNIES |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| PSP | 20 FPS | 5-6 FPS | 2-3 FPS | 1-2 FPS | 1 FPS |
| PPSSPP (Emulator) | 60 FPS | 17-19 FPS | 10 FPS | 4 FPS | 2-3 FPS |
