class Bullet extends AbstractGraphics{

    int x, y;
    int velocity = pixelsize * 2;
    Bullets bullets;    // reference to the collection

    /**
    direction is -1 or 1. 1 represents diving bullets, and -1 towards the
    top of the screen.
    */
    Bullet(Bullets bullets, int xpos, int ypos, int direction) {

        x = xpos + gridsize/2 - 4;
        y = ypos;
        this.bullets = bullets;
        velocity *= direction;
    }

    void update() {

        y += velocity;
    }

    void draw() {
        
        fill(255);
        rect(x, y, pixelsize, pixelsize);
    }
}
