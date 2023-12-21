
//klasa koja opisuje igru
class Game{
  
    // objekti igre
    Player player;
    Enemies enemyArmy;
    Bullets bulletList;

    //data
    int score = 0;

    //konstruktor
    Game() {

        player = new Player();
        enemyArmy = new Enemies(70);    
        bulletList = new Bullets();
    }

    //........................................KONTROLA TOKA........................................

    //funkcija koja crta igru
    void draw(){  

        drawScore(); 
        
        player.update();
        player.draw();  

        bulletList.update();    // updates and draws :/
        bulletList.draw();

        enemyArmy.update(player.x, player.y);   
        enemyArmy.draw();
    }

    //funkcija koja resetira igru
    void reset(){

        //reset objekata
        bulletList.reset();
        enemyArmy.reset(70);
        player.reset();
            
        //reset score-a
        score=0;
    }

    //.......................................Score.........................................

    //nacrtaj score
    void drawScore() {

        textFont(f);
        text("Score: " + String.valueOf(score), 300, 50);
    }

    //uvecaj score kad je neprijatelj ubijen
    void increaseScore(){

        increaseScore(50);
    }

    void increaseScore(int x){

        score+=x;
    }

    //......................................Pucanje...................................

    //funkcija koja dodaje bullet novi u listu kada se ispuca
    void playerShootsBullet(int x, int y){

        //bullet_sound.play();
        bulletList.addBullet(x,y);
    }

    //funkcija koja javlja je li neprijatelj s koordinatama x i y pogođen, i ako jest, unosi promjene
    /*boolean enemyWasShot(int x, int y){

        //provjeravamo je li ga ijedan metak pogodio
            if (bulletList.enemyWasShot(x,y)){              ;
                return true;
            }
        
        //ako nije pogođen 
        return false;
    }*/
}
