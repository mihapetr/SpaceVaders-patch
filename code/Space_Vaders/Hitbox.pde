/**
(sx, sy) is the hitbox's upper-left corner assuming the sprite origin is at (0,0).
(ex, ey) is the hitbox's lower-right corner -||-.
chr is a reference to the character with this specific hitbox. It is used for reading the origin coordinates.
*/
class Hitbox extends AbstractGraphics{

    int sx, sy, ex, ey;
    Character chr;
    Plate plt;

    // for Character hitboxes
    public Hitbox (Character chr, int sx, int sy, int ex, int ey) {

        this.sx = sx;
        this.sy = sy;
        this.ex = ex;
        this.ey = ey;
        this.chr = chr;
    }

    /**
    Returns if the given coordinates are in the hitbox's absoulte position.
    */
    public boolean inside(int x, int y) {
        
        // calculating the absolute position from relative position 
        
        int sx = chr.x + this.sx;
        int sy = chr.y + this.sy;
        int ex = chr.x + this.ex;
        int ey = chr.y + this.ey;
        
        return sx < x && x < ex && sy < y && y < ey;
        
    }

    /**
    Runs through all bullets in the game:Game and checks if some have hit the enemies hitbox.
    If no bullet was found returns null.
    */
    Bullet isHit() {
        
        Bullet b;
        for (Object o : game.bulletList.bullets) {

            b = (Bullet)o;  //cast
            //Next block simulates the bullets hitbox. Cna be imporoved.
            if(inside(b.x+pixelsize, b.y+pixelsize)) return b; 
            if(inside(b.x, b.y+pixelsize)) return b; 
            if(inside(b.x+pixelsize, b.y)) return b; 
            if(inside(b.x, b.y)) return b;
        }

        // if no bullet was found returns null
        return null;
    }
}
