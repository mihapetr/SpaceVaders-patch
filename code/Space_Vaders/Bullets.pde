class Bullets extends AbstractGraphics{
  ArrayList bullets = new ArrayList();

  Bullets(){}
  
  void update(){
	  
	for (int i = 0; i < bullets.size(); i++) {
    	Bullet bullet = (Bullet) bullets.get(i);
    	bullet.draw();
	}
  }
  
  void addBullet(int x,int y){
   bullets.add(new Bullet(x, y));
  }
  
  //resetira metke
  void reset(){
    bullets.clear();
  }

//funkcija koja javlja je li neprijatelj s koordinatama x i y pogođen, i ako jest, unosi promjene
 boolean enemyWasShot(int x, int y){
      //provjeravamo je li ga ijedan metak pogodio
        for (int i = 0; i < bullets.size(); i++) {
          
            //objekt za i-ti metak
            Bullet bullet = (Bullet) bullets.get(i);
            
            //ako ga je metak pogodio
            if (     bullet.x > x 
                  && bullet.x < x + gridsize 
                  && bullet.y > y 
                  && bullet.y < y + charsize * pixelsize) {
                    
                //uništavamo metak iz liste metaka
                bullets.remove(i);
                
                //budući je pogođen, i može ga pogoditi max 1 metak at the time, vraćamo true
                return true;
                }
        }
    
      //ako ga nije pogodio nijedan metak, stigli smo do ovdje
      return false;
    }
}
