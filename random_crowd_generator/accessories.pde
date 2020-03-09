//a function to place random accessories depending on given possibilities. px and py will be replaced by cood of center point
void accessoriesDisplay(float px, float py) {
  int c = (int)random(100);//variables used to control possibility
  if (c >=0 && c <= 10) {//10% chance to wear glasses
    glasses(px, py);
  }
  if (c >=0 && c <=5) {//5% chance to wear bowknot
    bowKnot(px, py);
  }
  if (c<=30) {//30% chane to wear earrings
    earrings(px, py);
  }
}


color accCol[]={//colour palette for accessories
  20, //black
  #FC9B33, //orange
  #4883E5, //blue
  #CE5DFF, //purple
  #84C656, //green
  #FA5858, //red
};

void glasses(float x, float y) {//this function draws glasses
  int roundness = (int)random(3, 10);//randomise shape
  color glassesCol = accCol[(int)random(6)];//randomise colour
  

  if (random(100)<60) {
    fill(glassesCol);//60% chance to have sunglasses
  } else {
    noFill();//40% normal glasses
  }

  //glasses
  strokeWeight(random(1, 3));//randomise the width of glasses frame
  stroke(20);//almost blk
  line(x-5, y, x+5, y);//bridge
  rectMode(CENTER);
  rect(x-10, y, 12, 12, roundness);//left lense
  rect(x+10, y, 12, 12, roundness);//right lense
  stroke(255);
  strokeWeight(2);
  point(x-7, y-2);//hight light
  point(x+13, y-2);
}


void bowKnot(float x, float y) {//this function draws bowknow

  //bow knot
  fill(accCol[5]);//red
  noStroke();
  triangle(x, y+22, x-10, y+17, x-10, y+27);
  triangle(x, y+22, x+10, y+17, x+10, y+27);
  ellipse(x, y+22, 5, 5);
}



void earrings(float x, float y) {//this function draws earrings
  
  //earring
  fill(accCol[(int)random(6)]);//a random colour from accessories palette
  noStroke();
  
  //50% chance to wear earring on each ear separately 
  if (random(100) >=50) {
    ellipse(x-22, y+5, 5, 5);
  }
  if (random(100) >=50) {
    ellipse(x+22, y+5, 5, 5);
  }
}

void hat(float x, float y) {//this function draws hat
  
  //hat
  fill(accCol[(int)random(6)]);//a random colour from accessories palette
  noStroke(); 
  rectMode(CENTER);
  rect(x, y-15, 43, 20, 10, 10, 0, 0);
  if (random(100)<50) {//randomise the direction of peak
    rect(x-20, y-7, 23, 3);
  } else {
    rect(x+20, y-7, 23, 3);
  }
  ellipse(x, y-25, 5, 5);
}