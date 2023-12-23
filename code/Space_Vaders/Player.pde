class Player extends Character {

    boolean canShoot = true;
    int shootdelay = 0;

    int moveSpeed = 5;
    int moveDir = 0; 
    boolean shoot = false;

    Game game;
    Hitbox hitbox;

    Player(Game game) {

        this.game = game;

        x = width/gridsize/2;
        y = height - (10 * pixelsize);
        sprite    = new String[5];
        sprite[0] = "1001001";
        sprite[1] = "1001001";
        sprite[2] = "1111111";
        sprite[3] = "0010100";
        sprite[4] = "0100010";

        hitbox = new Hitbox(this, 0, 0, pixelsize*7, pixelsize*5);
    }

    // space == 32
    void keyPressed(int keyCode) {

        //print(keyCode);   // debug
        switch (keyCode) {
            case LEFT :
                moveDir = -moveSpeed;
            break;	
            case RIGHT :
                moveDir = moveSpeed;
            break;	
            case 32 :
                shoot = true;
            break;	
        }
    }

    void keyReleased(int keyCode) {

        //print(keyCode);    // debug
        switch (keyCode) {
            case LEFT :
                moveDir = 0;
            break;	
            case RIGHT :
                moveDir = 0;
            break;	
            case 32 :
                shoot = false;
            break;	
        }
    }

    void update() {

        if(x+moveDir > 0 && x+moveDir < width-gridsize) x += moveDir;   // update position
        
        // if player wants to shoot and the delay is allowing it
        if (shoot && canShoot) {
            game.playerShootsBullet(x-pixelsize, y - pixelsize*3);
            canShoot = false;
            shootdelay = 0;
        }

        // update shoot delay
        shootdelay++;
        if (shootdelay >= 30) {
            canShoot = true;
        }

        // check if hit
        Bullet b = hitbox.isHit();
        if(b != null) {
            game.bulletList.remove(b);
            if(--game.lives < 0) gameflag = -1;
        }
    }
   
    //reset igrača
    void reset(){

        //reset koordinata
        x = width/gridsize/2;
        y = height - (10 * pixelsize);
    }
}
