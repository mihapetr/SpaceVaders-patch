/**
A class designed to represent destructable elementary parts of a shield 
*/
public class Plate extends Character {

    Game game;
    Shield shield;  // reference to the shield it belongs to
    Hitbox hitbox;

    public Plate (Game game, Shield shield, int xpos, int ypos) {
        
        x = xpos;
        y = ypos;
        this.game = game;
        this.shield = shield;
        sprite = new String[1];
        sprite[0] = "1";
        pixelsize = 8;
        baseColor = color(0, 255, 0);

        hitbox = new Hitbox(this, 0, 0, pixelsize, pixelsize);
    }

    void draw() {

        drawSprite(x,y);
    }

    /**
    Runs through all bullets in the game:Game and checks if some have hit the enemies hitbox.
    If no bullet was found returns null.
    */
    Bullet isHit() {
        return this.hitbox.isHit();
    }
}
