//klasa koja predstavlja vojsku neprijatelja
class Enemies extends AbstractGraphics{
  ArrayList enemies = new ArrayList();
  
  //konstruktor
  Enemies() {
    for (int i = 0; i < width/gridsize/2; i++) {
        for (int j = 0; j <= 5; j++) {
            enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
        }
      }
   }
  
   //funkcija za update vojske neprijatelja
   void update(int player_x, int player_y){
     
     //provjera je li neprijatelj uspio invadirati
    for (int i = 0; i < enemies.size(); i++) {
          Enemy enemy = (Enemy) enemies.get(i);
          
          if (enemy.hasInvaded(player_x, player_y)){//player has lost [IGRAC JE IZGUBIO]
            gameflag=-1; 
            //lost_sound.play();
            return; 
          }
       }
     
     //mijenja smjer neprijatelja ako su van ekrana po x osi
     for (int i = 0; i < enemies.size(); i++) {
                Enemy enemy = (Enemy) enemies.get(i);
                
                if (enemy.outside()) {
                    changeArmyDirection();
                    setIncrementY(true);
                    break;
                }
            }
        
      //provjerava je li koji neprijatelj pogodjen
      for (int i = 0; i < enemies.size(); i++) {
                Enemy enemy = (Enemy) enemies.get(i);
                
                if (!enemy.alive()) {
                    enemies.remove(i);
                    updateVelocity();
                } else {
                    enemy.draw();
                }
            }
            
       setIncrementY(false);
       
       //ako nema zivih neprijatelja [IGRAC JE POBJEDIO]
       if (enemies.isEmpty()){ 
         gameflag =1;
         //won_sound.play();
       }
   }

  
  //funkcija za povecanje brzine vojske (ova funkcija se poziva kada se broj neprijatelja smanji, tj neki neprijatelj bude pogođen)
  void updateVelocity(){
     for (int i = 0; i < enemies.size(); i++) {
         Enemy enemy = (Enemy) enemies.get(i);
         enemy.updateVelocity();
       }
  }
  
  //funkcija za reset
  void reset(){
    enemies.clear();
    
    //stvaram novu vojsku neprijatelja
    for (int i = 0; i < width/gridsize/2; i++) {
        for (int j = 0; j <= 5; j++) {
            enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
        }
    }
  }
  
  void changeArmyDirection(){
    for (int i = 0; i < enemies.size(); i++) {
         Enemy enemy = (Enemy) enemies.get(i);
         enemy.changeDirection();
       }
  
  }

  void setIncrementY(boolean b){
      for (int i = 0; i < enemies.size(); i++) {
         Enemy enemy = (Enemy) enemies.get(i);
         enemy.increment_y=b;
       }
  }
}
