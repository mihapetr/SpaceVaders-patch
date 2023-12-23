
//klasa koja opisuje igru
class Game{
  
    // objekti igre
    Player player;
    Enemies enemyArmy;
    Bullets bulletList;
	ArrayList<Shield> shields = new ArrayList<Shield>();

    //data
    int score = 0;
	int kills = 0;
    int lives = 2;

    //konstruktor
    Game() {

        player = new Player(this);
        enemyArmy = new Enemies(this, 70);    
        bulletList = new Bullets();

		//testing
        int pixelsize = 4;
		shields.add(new Shield(this, width/2, height - 10*pixelsize - 15*pixelsize));
        shields.add(new Shield(this, width/4, height - 10*pixelsize - 15*pixelsize));
        shields.add(new Shield(this, 3*width/4, height - 10*pixelsize - 15*pixelsize));
    }

    //........................................KONTROLA TOKA........................................

    //funkcija koja crta igru
    void draw(){  

		background(0);
        removeExcessBullets();
        
        player.update();
        player.draw();  

        for (Shield s : shields) {

            s.update();
            s.draw();
        }

        enemyArmy.update(player.x, player.y);   
        enemyArmy.draw();

        bulletList.update();   
        bulletList.draw();

		drawScore(); 
    }

    /**
    Removes bullets out of screen bounds.
    */
    void removeExcessBullets(){

        bulletList.removeExcess();
    }

    //funkcija koja resetira igru
    void reset(){

        //reset objekata
        bulletList.reset();
        enemyArmy.reset(70);
        player.reset();
            
        //reset score-a
        score=0;
        game_music.play();
    }

    //.......................................Score.........................................

    //nacrtaj score
    void drawScore() {

        textFont(f);
        text("Score: " + String.valueOf(score), 50, 50);
        text("Extra lives: " + String.valueOf(lives), width - 400, 50);
    }

    //uvecaj score kad je neprijatelj ubijen
    void increaseScore(){

        increaseScore(50);
    }

    void increaseScore(int x){

        score+=x;
		kills += 1;
    }

    //......................................Pucanje...................................

    //funkcija koja dodaje bullet novi u listu kada se ispuca
    void playerShootsBullet(int x, int y){

        //bullet_sound.play();
        bulletList.addBullet(x,y);
    }
}
