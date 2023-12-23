class Bullets extends AbstractGraphics{

	ArrayList bullets = new ArrayList();

	Bullets(){}
	
	void update(){

		/*for (int i = 0; i < bullets.size(); i++) {
			
			Bullet bullet = (Bullet) bullets.get(i);
			bullet.update();
		}*/

		Bullet b;
		for (Object o : bullets) {

			b = (Bullet)o;
			b.update();
		}
	}

	void removeExcess() {

		Bullet b;
		for (int i = 0; i < bullets.size(); ++i) {
			b = (Bullet)bullets.get(i);
			if(b.y < 0) {
				bullets.remove(i);
				return;
			}
		}
	}

	void remove(Bullet target) {

		for (int i = 0; i < bullets.size(); ++i) {
			
			if(target.y == ((Bullet)bullets.get(i)).y) bullets.remove(i);
		}
	}

	void draw() {

		for (int i = 0; i < bullets.size(); i++) {
			
			Bullet bullet = (Bullet) bullets.get(i);
			bullet.draw();
		}
	}
	
	void addBullet(int x,int y){
		
		bullets.add(new Bullet(this, x, y, -1));
		//bullet_sound.play();
	}

	void addEnemyBullet(int x, int y) {

		bullets.add(new Bullet(this, x, y, 1));
		//bullet_sound.play();
	}
	
	//resetira metke
	void reset(){
		
		bullets.clear();
	}

	// DEPRECATED
	//funkcija koja javlja je li neprijatelj s koordinatama x i y pogođen, i ako jest, unosi promjene
 	/*boolean enemyWasShot(int x, int y) {

        //provjeravamo je li ga ijedan metak pogodio
        for (int i = 0; i < bullets.size(); i++) {
          
            //objekt za i-ti metak
            Bullet bullet = (Bullet) bullets.get(i);
            
            //ako ga je metak pogodio
            if ( 
				bullet.x > x 
            	&& bullet.x < x + gridsize 
                && bullet.y > y 
                && bullet.y < y + charsize * pixelsize) {
                    
                //uništavamo metak iz liste metaka
                bullets.remove(i);
                
                //budući je pogođen, i može ga pogoditi max 1 metak at the time, vraćamo true
                return true;
            }
        }
    
      //ako ga nije pogodio niti jedan metak, stigli smo do ovdje
      return false;
    }*/
}
