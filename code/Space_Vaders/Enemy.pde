
class Enemy extends Character {
    int life = 1;
    int velocity=2;
    int direction = 1;
    boolean increment_y=false;
    
    Enemy(int xpos, int ypos) {
        x = xpos;
        y = ypos;
        sprite    = new String[5];
        sprite[0] = "0001000";
        sprite[1] = "0011100";
        sprite[2] = "0101010";
        sprite[3] = "1111111";
        sprite[4] = "1101011";
    }
    
    void updateVelocity(){
      velocity++;
    }

    void update() {
        if (frameCount%30 == 0) {
            x += direction * velocity;
        }
        
        if (increment_y == true) {
            y += gridsize / 2;
        }
    }

    boolean alive() {
      
      //updateamo broj zivota
        if (game.enemyWasShot(x,y) == true){
                //oduzimamo 1 život i mijenjamo boju pogođenog u crveno
                life--;
                nextColor = color(255, 0, 0);
        }
        
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
