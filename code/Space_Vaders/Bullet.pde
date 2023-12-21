class Bullet extends AbstractGraphics{

    int x, y;
    int velocity = pixelsize * 2;

    Bullet(int xpos, int ypos) {

        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void update() {

        y -= velocity;
    }

    void draw() {
        
        fill(255);
        rect(x, y, pixelsize, pixelsize);
    }
}
