// helpers
#define true 1
#define false 0

//movement
#define MOVE_SLIDE 1
#define MOVE_JUMP 2
#define MOVE_TELEPORT 4

#define TILE_WIDTH  32
#define TILE_HEIGHT 32
#define TICK_LAG    0.4

//probabilities
#define ASBYLITE_PROB 40
#define PETRITE_PROB 30
#define GREZLORITE_PROB 25
#define HEZERITE_PROB 11
#define DRAXILITE_PROB 7
#define NECITE_PROB 4
#define KABURITE_PROB 1
#define EMPTY_PROB 2500

// additive probabilities
#define POOR_PROB 70
#define MEDIUM_PROB 40
#define RICH_PROB 20

// ore amounts
#define POOR_AMOUNT 1
#define MEDIUM_AMOUNT 5
#define RICH_AMOUNT 10

//layers
#define FULLSCREEN_LAYER 2
#define EFFECTS_LAYER 99
#define LIGHTING_LAYER 98
#define LIGHTING_DIMMER_LAYER 97

// planes
#define FLOOR_PLANE -6
#define SHADOWS_PLANE -5
#define WALL_PLANE -4
#define MOVABLE_PLANE -3

#define EFFECTS_PLANE 13

#define LIGHTING_PLANE 110
#define BLOCKER_PLANE 100

#define FULLSCREEN_PLANE 200

#define UI_BACKDROP_PLANE 300
#define UI_FOREGROUND_PLANE 310

//lighting colors
#define LIGHTING_BLUE           rgb(0,0,155)
#define LIGHTING_RED            rgb(155,0,0)
#define LIGHTING_GREEN          rgb(0,155,0)
#define LIGHTING_MACHINE_GLOW   rgb(209, 140, 199)
#define LIGHTING_WHITE          rgb(255,255,255)