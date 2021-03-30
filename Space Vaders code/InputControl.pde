//Funkcija koja se poziva kad se pritisne tipka na misu
void mousePressed(){
   
  
    if (gameflag == 0) { //ukoliko se nalazimo u meni-ju
          startButton.mousePressed();
          exitButton.mousePressed();
          
          }else if(gameflag == -1 || gameflag == 1){ //ukoliko smo na pobjedničkom/gubitničkom ekranu
              // klik nas vraća na meni
              gameflag = 0;
          
             //......reset igre tako da se omogući ponovno igranje....
             game.reset();
           }
  }
  
