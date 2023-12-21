
class Enemy extends Character {

    int MAX_VELOCITY = 5;

    Game game;  // the Game object running the game, needed to get bullets' references

    int life = 1;
    int velocity = 1;
    int direction = 1;
    boolean increment_y=false;

    Hitbox hitbox;
    
    Enemy(Game game, int xpos, int ypos) {

        this.game = game;

        x = xpos;
        fx = (float)xpos;
        y = ypos;
        fy = (float)ypos;
        sprite    = new String[5];
        sprite[0] = "0001000";
        sprite[1] = "0011100";
        sprite[2] = "0101010";
        sprite[3] = "1111111";
        sprite[4] = "1101011";

		// seems easier to design with chars ' ' and 'o'
		sprite[0] = "   o   ";
        sprite[1] = "  ooo  ";
        sprite[2] = " o o o ";
        sprite[3] = "ooooooo";
        sprite[4] = "oo o oo";

        this.hitbox = new Hitbox(this, 0, 0, pixelsize*7, pixelsize*5);
    }
    
    /**
    Depending on the number of kills the enemies speed up. Starting velocity is 1 and max is around 10.
    */
    void updateVelocity() {

        velocity = 1 + (int) game.kills * MAX_VELOCITY / 70;
        //print("(" + velocity + ")");
    }

    void update() {

        Bullet b = isHit();
        if(b != null) {

            game.bulletList.remove(b);      // remove the bullet
            game.enemyArmy.remove(this);    // remove self from army
            game.enemyArmy.updateVelocity();    // make it harder
            game.increaseScore();
        }

        //x += (int)( (float)direction * (float)velocity / 6 );
        if(frameCount % 2 == 0) x += direction * velocity;
        
        if (increment_y == true) {

            y += gridsize / 2;
        }
    }

    /**
    Runs through all bullets in the game:Game and checks if some have hit the enemies hitbox.
    If no bullet was found returns null.
    */
    Bullet isHit() {
        
        Bullet b;
        for (Object o : game.bulletList.bullets) {

            b = (Bullet)o;  //cast
            if(this.hitbox.inside(b.x, b.y)) return b;
        }

        // if no bullet was found returns null
        return null;
    }

    // deprecated
    boolean alive() {
      
      	//updateamo broj zivota
        /*if (game.enemyWasShot(x,y) == true){

            //oduzimamo 1 život i mijenjamo boju pogođenog u crveno
            life--;
            nextColor = color(255, 0, 0);
        }*/
        
        //je li mrtav?
        if(life<=0){

        	game.increaseScore();
          	return false;
        }
        
        return true;
    }

    //provjerava hoce li nakon pomaka neprijatelj biti van ekrana
    boolean outside() {

        return x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize;
    }
    
    //provjerava je li neprijatelj uspio doci do donjeg ruba ekrana (uvjet za pobjedu neprijatelja) ili dodirnuti playera
    boolean hasInvaded(int player_x, int player_y){
      
      	boolean Invaded_Earth = y + charsize*pixelsize > height;
      
      	boolean Crushed_Player = (y + charsize*pixelsize > player_y && x+charsize*pixelsize > player_x) || (y+charsize*pixelsize > player_y && x < x+charsize*pixelsize);
      
      	return Invaded_Earth || Crushed_Player;
    }
    
    void changeDirection(){

      	direction *= (-1);
    }
}
