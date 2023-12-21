class Player extends Character {

    boolean canShoot = true;
    int shootdelay = 0;

    int moveSpeed = 5;
    int moveDir = 0; 
    boolean shoot = false;

    Player() {

        x = width/gridsize/2;
        y = height - (10 * pixelsize);
        sprite    = new String[5];
        sprite[0] = "1001001";
        sprite[1] = "1001001";
        sprite[2] = "1111111";
        sprite[3] = "0010100";
        sprite[4] = "0100010";
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

        x += moveDir;   // update position
        
        // if player wants to shoot and the delay is allowing it
        if (shoot && canShoot) {
            game.playerShootsBullet(x,y);
            canShoot = false;
            shootdelay = 0;
        }

        // update shoot delay
        shootdelay++;
        if (shootdelay >= 30) {
            canShoot = true;
        }
    }
   
    //reset igrača
    void reset(){

        //reset koordinata
        x = width/gridsize/2;
        y = height - (10 * pixelsize);
    }
}
