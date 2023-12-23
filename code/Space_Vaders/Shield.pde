public class Shield extends AbstractGraphics {

    Game game;
    String[] shape = new String[3];
    ArrayList<Plate> plates = new ArrayList<Plate>();

    int pixelsize = 8;  // had to modify because of Hitbox 

    // xpos is the shield's center x-coordinate
    public Shield (Game game, int xpos, int ypos) {

        this.game = game;
        
        shape[0] = "....oooooo....";
        shape[1] = "..oooooooooo..";
        shape[2] = ".ooo......ooo.";

        int offset = pixelsize * (int) ((float)shape[0].length() / 2.0f);

        for (int i = 0; i < 3; ++i) {
            for (int j = 0; j < shape[0].length(); ++j) {

                if(shape[i].charAt(j) == 'o') {

                    plates.add(
                        new Plate(game, this, xpos - offset + j*pixelsize, ypos + i*pixelsize)
                    );
                }
            }
        }
    }

    void draw() {

        for (Plate p : plates) p.draw();
    }

    void update() {

        Bullet b;
        Plate p;
        for (int i = 0; i < plates.size(); ++i) {
            
            p = plates.get(i);
            b = p.isHit();
            if(b != null) {
                game.bulletList.remove(b);
                plates.remove(i);
            }
        }
    }
}
