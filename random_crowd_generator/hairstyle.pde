color hairColour[]={//colour palette for hair colour
  30, //black
  200, //silver
  #52381A, //brown
  #EBE417, //yellow
  #A34734, //red
};



void hairDisplayOver(float px, float py) {//a function to place random hairstyles over the faces
  int c = (int)random(5);//variables used to control possibility
  if (c == 0) {//20% chance to have hairstyle 1 
    hair1(px, py);
  } else if (c==1) {//20% chance to have hairstyle 2 
    hair2(px, py);
  } else if (c==2) {//20% chance to have hairstyle 3 
    hair3(px, py);
  } else if (c==3) {//20% chance to have hairstyle 4 
    hair4(px, py);
  }
  //20% chance to be bald(without any hairstyle)
}



void hair1(float x, float y) {//this function draws hairstyle1
  fill(hairColour[(int)random(5)]);//a random colour from hair palette
  noStroke();
  ellipse(x, y-20, 10, 10);
  ellipse(x+10, y-20, 10, 10);
  ellipse(x-10, y-20, 10, 10);
}


void hair2(float x, float y) {//this function draws hairstyle2
  fill(hairColour[(int)random(5)]);//a random colour from hair palette
  noStroke();
  rectMode(CENTER);
  rect(x, y-18, random(15, 36), 10, 5);
}


void hair3(float x, float y) {//this function draws hairstyle3
  int hairThickness = (int)random(0, 7);//randomise thickness
  int hairLength = (int)random(20, 35);//randomise length

  fill(hairColour[(int)random(5)]);//a random colour from hair palette
  noStroke();
  arc(x, y-12, 45, 25, PI, 2*PI, OPEN);//hair on top of the head
  rectMode(CENTER);
  rect(x-19, y-2, hairThickness, hairLength);//stripe of hair besides cheek
  rect(x+19, y-2, hairThickness, hairLength);
}


void hair4(float x, float y) {//this function draws hairstyle4
  int hairLength = (int)random(2, 8);//randomise length

  stroke(hairColour[(int)random(5)]);//a random colour from hair palette
  strokeWeight(3);
  line(x, y-20, x, y-20+hairLength);//a stripe of hair

  if (random(100)<70) {//70% chance to add other 2 stripes of hair
    line(x-5, y-20, x-5, y-20+hairLength);
    line(x+5, y-20, x+5, y-20+hairLength);
    if (random(100)<30) {//30% chance to add other 2 stripes of hair
      line(x-10, y-20, x-10, y-22+hairLength);
      line(x+10, y-20, x+10, y-22+hairLength);
      if (random(100)<30) {//30% chance to add other 2 stripes of hair
        line(x-15, y-20, x-15, y-24+hairLength);
        line(x+15, y-20, x+15, y-24+hairLength);        
      }
    }
  }
}