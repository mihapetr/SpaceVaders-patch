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
    size(800, 550);
    
      //.............................load pozadinskih slika..............................
    
    menu_bckgrnd = new PImage();
    menu_bckgrnd = loadImage("menu.jpg");
    
    lost_bckgrnd = new PImage();
    lost_bckgrnd = loadImage("lost.jpg");
    
    won_bckgrnd = new PImage();
    won_bckgrnd = loadImage("won.jpg");
    
    game_bckgrnd = new PImage();
    game_bckgrnd = loadImage("game.jpg");
    
    //.......................load i pokretanje pozadinske glazbe i zvukova................. 

	// we pass this to Minim so that it can load files from the data directory
	minim = new Minim(this);
	game_music = minim.loadFile("bkg1.wav");

	// sfx
	lost_sound = minim.loadFile("lost.wav");
	won_sound = minim.loadFile("won.wav");
	bullet_sound = minim.loadFile("bullet.wav");

	// deprecated
    //game_music= new SoundFile(this, "bkg1.mp3");  
    /*game_music= new SoundFile(this, "bkg1.wav");
    game_music.rate(0.8);
    game_music.amp(0.5);
    game_music.loop();

    //lost_sound= new SoundFile(this, "lost.mp3");  // deprecated
    lost_sound= new SoundFile(this, "lost.wav");
    //won_sound= new SoundFile(this, "won.mp3");  //deprecated
    won_sound= new SoundFile(this, "won.wav");
    // bullet_sound= new SoundFile(this, "bullet.mp3");
    bullet_sound= new SoundFile(this, "bullet.wav");
    
    bullet_sound.amp(0.2);*/
    
     //.......................inicijalizacija objekata gumba za menu...................
  
    startButton = new ButtonMenu();
    startButton.setX(113);
    startButton.setY(102);
    startButton.setWidth(123);
    startButton.setHeight(70);
    
    exitButton = new ButtonExit();
    exitButton.setX(120);
    exitButton.setY(238);
    exitButton.setWidth(112);
    exitButton.setHeight(73);
    
    
    //............................inicijalizacija igre.......................
    gameflag=0;
    game = new Game();

    //............................inicijaliza
    f = createFont("Arial", 36, true);
}

//..........................................................DRAW..........................................................
//flag za igru:
//0 je menu
//1 je pobjeda
//-1 je gubitak
//2 je igra
//funkcija koja opetovano crta igru
void draw() {
    if (gameflag==0){ //menu
      	background(menu_bckgrnd);
          
          
    } else if (gameflag==1){ //pobjednicki ekran
      	background(won_bckgrnd);
      
      
    } else if (gameflag==-1){ //gubitnicki ekran
      	background(lost_bckgrnd);
      
      
    } else if(gameflag==2){ //igra 
    	background(game_bckgrnd);
    	game.draw();
    }
    
}
    
