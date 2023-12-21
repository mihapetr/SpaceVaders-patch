
//apstraktna klasa koja drži neke podatke o veličini pixela
class AbstractGraphics {
  
  	//data
	int pixelsize = 4;
	int charsize = 7;
	// Name gridsize is misleading, perhaps a better one would be gridRowSize.
	// update : Somewhere in the game logic it is used as sprite width.
	// The last integer is the sprite padding and a part of the hitbox in the current version.
	int gridsize = pixelsize * charsize + pixelsize*3;
	int columnSize = pixelsize * 5;
}
