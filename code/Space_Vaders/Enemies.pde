//klasa koja predstavlja vojsku neprijatelja
class Enemies extends AbstractGraphics{

	ArrayList enemies = new ArrayList();
	int shootPause = 30;	// # of frames
	int shootTimer = 0;
	
	/**
	Greater altitude means the army starts closer to the player.
	game is a reference to the Game object running the game.
	*/
	Enemies(Game game, int altitude) {

		for (int i = 0; i < width/gridsize/2; i++) {
			for (int j = 0; j <= 5; j++) {

				enemies.add(new Enemy(game, i*gridsize, j*gridsize + altitude));
			}
		}
	}

	// draws every enemy in the army
	void draw() {

		for (Object _enemy : enemies) {

			Enemy enemy = (Enemy)_enemy;	// explicit cast
			enemy.draw();
		}
	}

	void remove(Enemy target) {

		Enemy element;
		for (int i = 0; i < enemies.size(); ++i) {

			element = (Enemy)enemies.get(i);
			if(target.x == element.x && target.y == element.y) enemies.remove(i);
		}
	}
  
    //funkcija za update vojske neprijatelja
	void update(int player_x, int player_y) {
    
		//provjera je li neprijatelj uspio invadirati
		for (int i = 0; i < enemies.size(); i++) {

			Enemy enemy = (Enemy) enemies.get(i);
			
			if (enemy.hasInvaded(player_x, player_y)){ 	//player has lost [IGRAC JE IZGUBIO]
			
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
			
		// updates all enemies in the army
		for (int i = 0; i < enemies.size(); i++) {

			Enemy enemy = (Enemy) enemies.get(i);
			enemy.update();
		}
				
		setIncrementY(false);
		
		//ako nema zivih neprijatelja [IGRAC JE POBJEDIO]
		if (enemies.isEmpty()){ 

			gameflag =1;
			//won_sound.play();
		}

		// this block controls the enemies shooting at the ally
		shootTimer++;
		if(shootTimer >= shootPause) {

			shootTimer = 0;
			// find frontline enemies who can shoot without damaging their own
			ArrayList<Enemy> frontline = new ArrayList<Enemy>();
			Enemy e;
			int maxY = -1;
			for (int i = enemies.size()-1; i >= 0; --i) {
				
				e = (Enemy)enemies.get(i);
				if(e.y > maxY) maxY = e.y;
				if(e.y == maxY) frontline.add(e);
			}

			// make a random one shoot
			e = frontline.get(
					(int)random(0, frontline.size())
				);
			game.bulletList.addEnemyBullet(e.x, e.y+4*6);
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
	void reset(int altitude){

		enemies.clear();
		
		//stvaram novu vojsku neprijatelja
		for (int i = 0; i < width/gridsize/2; i++) {
			for (int j = 0; j <= 5; j++) {

				enemies.add(new Enemy(game, i*gridsize, j*gridsize + altitude));
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
