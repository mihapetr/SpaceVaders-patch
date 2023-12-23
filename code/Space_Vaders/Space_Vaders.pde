// temp polishing
int xOffset;
int yOffset;

//..........................................................DATA..........................................................  
 //pozadine za igru, menije i zavrsne screenove
 PImage game_bckgrnd, menu_bckgrnd, won_bckgrnd, lost_bckgrnd;

//unosim file za zvuk u igru : deprecated, ne radi
/*import processing.sound.*; 
  SoundFile game_music;
  SoundFile won_sound;
  SoundFile lost_sound;
  SoundFile bullet_sound;*/

// new audio playback
import ddf.minim.*;
Minim minim;
AudioPlayer game_music;
AudioPlayer won_sound;
AudioPlayer lost_sound;
AudioPlayer bullet_sound;

//gumbi za početak igre i izlazak iz igre
ButtonMenu startButton;
ButtonExit exitButton;
//objekt za igru 
Game game;
//font
PFont f;
//flag za igru
int gameflag; //0 je menu, 1 je pobjeda, -1 je gubitak a 2 je igra


//..........................................................SETUP..........................................................
//funkcija za inicijalizaciju igre
void setup() {
 
    //konstruiram prozor
    noStroke();
    //size(1000, 680);	// HD
    fullScreen();
    frameRate(60);
    
      //.............................load pozadinskih slika..............................
    
    menu_bckgrnd = new PImage();
    menu_bckgrnd = loadImage("menu.jpg");
    
    lost_bckgrnd = new PImage();
    lost_bckgrnd = loadImage("lost.jpg");
    
    won_bckgrnd = new PImage();
    won_bckgrnd = loadImage("won.jpg");
    
    game_bckgrnd = new PImage();
    game_bckgrnd = loadImage("game.jpg");

	// temporary polishing 
	xOffset = (width - menu_bckgrnd.width) / 2;
	yOffset = (height - menu_bckgrnd.height) / 2;
    
    //.......................load i pokretanje pozadinske glazbe i zvukova................. 

	// we pass this to Minim so that it can load files from the data directory
	minim = new Minim(this);
	game_music = minim.loadFile("bkg1.wav");
    game_music.play();

	// sfx
	lost_sound = minim.loadFile("lost.wav");
	won_sound = minim.loadFile("won.wav");
	//bullet_sound = minim.loadFile("blaster.mp3");
    
    //.......................inicijalizacija objekata gumba za menu...................


    startButton = new ButtonMenu();
    startButton.setX(113 + xOffset);
    startButton.setY(102 + yOffset);
    startButton.setWidth(123);
    startButton.setHeight(70);
    
    exitButton = new ButtonExit();
    exitButton.setX(120 + xOffset);
    exitButton.setY(238 + yOffset);
    exitButton.setWidth(112);
    exitButton.setHeight(73);
    
    //............................inicijalizacija igre.......................
    gameflag = 0;
    game = new Game();

    //............................inicijaliza
    f = createFont("Arial", 36, true);

}

//..........................................................DRAW..........................................................

// replaced ifelse with switch
// placed the case flag==2 as the first case to save CPU time
void draw() {
        
	switch (gameflag) {
		
		case 2 :	// game in progress
			//image(game_bckgrnd, 0, 0);	// decided black was good for now
    		game.draw();
		break;
		case 0 :	// in menu
			background(0);
			image(menu_bckgrnd, xOffset, yOffset);
      		//game.draw();
		break;	
		case 1 :	// player won
			background(0);
      		game_music.pause();
			won_sound.play();
			image(won_bckgrnd, xOffset, yOffset);
		break;	
		case -1 :	// player lost
			background(0);
      		game_music.pause();
			lost_sound.play();
			image(lost_bckgrnd, xOffset, yOffset);
		break;		
	}
}
    
void keyPressed() {

	game.player.keyPressed(keyCode);
}

void keyReleased() {

	game.player.keyReleased(keyCode);
}