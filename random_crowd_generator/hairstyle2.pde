boolean nonAfro;//to detect the appearance of afro hairstyle

void hairDisplayUnderneath(float px, float py) {//a function to place random hairstyles under the faces
  int c = (int)random(3);//variables used to control possibility
  if (c == 0) {//25% chance to have hairstyle 1 
    hairU1(px, py);
  } else if (c == 1) {//25% chance to have hairstyle 2
    hairU2(px, py);
  } else if (c == 2) {//25% chance to have hairstyle 3
    hairU3(px, py);
  }

  nonAfro = (c != 1)? true: false;//to detect the appearance of afro hairstyle
}



void hairU1(float x, float y) {//pigtail braids
  fill(hairColour[(int)random(5)]);//a random colour from hair palette

  //braids
  noStroke();
  triangle(x+5, y+5, x-25, y+15, x-20, y+22);
  triangle(x-5, y+5, x+25, y+15, x+20, y+22);

  //hair on top of the head
  rectMode(CENTER);
  rect(x, y-10, 40, 25, random(5, 13));
}



void hairU2(float x, float y) {//Afro-hair
  int p = (int)random(-5, 5);//to randomise size 
  fill(hairColour[(int)random(5)]);//a random colour from hair palette
  noStroke();
  ellipse(x, y-10, 55+p, 50+p);
}



void hairU3(float x, float y) {//braids
  color hairCol = hairColour[(int)random(5)];//create a colour variable to unify the colour of the braids and hair on top of the head
  color hairAccCol = accCol[(int)random(4)];//create a colour variable to unify the colour of hair decorations(if there's more than one)

  //hair on top of the head
  fill(hairCol);
  noStroke();
  rectMode(CENTER);
  rect(x, y-10, 40, 25, random(5, 13));

  //braids
  //50% chance to have a braid on each side separately 
  if (random(100) >=50) {
    //right braid
    fill(hairCol);
    ellipse(x+15, y+15, 10, 10);
    ellipse(x+18, y+20, 7, 7);
    ellipse(x+20, y+23, 4, 4);
    triangle(x+20, y+23, x+28, y+23, x+20, y+30);
    fill(hairAccCol);
    ellipse(x+20, y+23, 5, 5);
  }
  if (random(100) >=50) {
    //left braid
    fill(hairCol);
    ellipse(x-15, y+15, 10, 10);
    ellipse(x-18, y+20, 7, 7);
    ellipse(x-20, y+23, 4, 4);
    triangle(x-20, y+23, x-28, y+23, x-20, y+30);
    fill(hairAccCol);
    ellipse(x-20, y+23, 5, 5);
  }
}