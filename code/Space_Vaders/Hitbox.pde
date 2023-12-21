/**
(sx, sy) is the hitbox's upper-left corner assuming the sprite origin is at (0,0).
(ex, ey) is the hitbox's lower-right corner -||-.
chr is a reference to the character with this specific hitbox. It is used for reading the origin coordinates.
*/
class Hitbox {

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

    // for Plate hitboxes
    public Hitbox (Plate plt, int sx, int sy, int ex, int ey) {

        this.sx = sx;
        this.sy = sy;
        this.ex = ex;
        this.ey = ey;
        this.plt = plt;
    }

    /**
    Returns if the given coordinates are in the hitbox's absoulte position.
    */
    public boolean inside(int x, int y) {
        
        // calculating the absolute position from relative position 
        if(chr != null) {

            int sx = chr.x + this.sx;
            int sy = chr.y + this.sy;
            int ex = chr.x + this.ex;
            int ey = chr.y + this.ey;
        }
        else if(plt != null) {

            int sx = plt.x + this.sx;
            int sy = plt.y + this.sy;
            int ex = plt.x + this.ex;
            int ey = plt.y + this.ey;
            /*print("sx:"+sx+",");
            print("sy:"+sy+",");
            print("ex:"+ex+",");
            print("ey:"+ey+",");
            print("x:"+x+",");
            print("y:"+y+",");*/
        }

        return sx < x && x < ex && sy < y && y < ey;
    }
}
