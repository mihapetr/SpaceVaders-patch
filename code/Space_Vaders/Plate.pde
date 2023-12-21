/**
A class designed to represent destructable elementary parts of a shield 
*/
public class Plate {

    int x, y;
    int width, height;
    Game game;
    Hitbox hitbox;

    public Plate (Game game, int x, int y, int width, int height) {
        
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.game = game;

        hitbox = new Hitbox(this, 0, 0, this.width, this.height);
    }

    void draw() {

        fill(50,255,50);
        rect(x, y, width, height);
    }

    /**
    Runs through all bullets in the game:Game and checks if some have hit the enemies hitbox.
    If no bullet was found returns null.
    */
    Bullet isHit() {
        
        Bullet b;
        for (Object o : game.bulletList.bullets) {

            b = (Bullet)o;  //cast
            if(this.hitbox.inside(b.x, b.y)) {
                
                print("inside");
                return b;
            }
        }

        // if no bullet was found returns null
        return null;
    }
}
