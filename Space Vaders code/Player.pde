class Player extends Character {
    boolean canShoot = true;
    int shootdelay = 0;

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

    void update() {
        if (keyPressed && keyCode == LEFT) {
            x -= 5;
        }
        
        if (keyPressed && keyCode == RIGHT) {
            x += 5;
        }
        
        if (keyPressed && key == ' ' && canShoot) {
            game.playerShootsBullet(x,y);
            canShoot = false;
            shootdelay = 0;
        }

        shootdelay++;
        
        if (shootdelay >= 20) {
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
