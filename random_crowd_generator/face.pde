import java.util.Random;
Random faceLength = new Random(); //get ready to generate random numbers

color skinColour[]={ //colour palette for skin
  #FFF1DE, //light
  #FCF7D7, //light2
  #FCC4B8, //pink
  #F7CDAB, //medium
  #EBB68A, //medium2
  #9C7E67, //brown
  #B8876C, //brown2
};
color eye[]={ //colour palette for eyes
  #EBAD05, //yellow
  #7EAFE6, //blue
  #9ED99E, //green
  #78503E, //brown
  30, //black
};
color nose[]={ //colour palette for nose
  #DB9374, //pink
  #E8B358, //orange
  #FCF7D7, //yellow
  #CF663A, //red
};

class Face { //a class to assemble elements and methods to generate faces

  int offset = 10;    //to adjust horizontal
  int gridHorizontal; //set grid for faces
  int gridVerticle;
  float middleX;      //anchor a centre point for a single element
  float middleY;
  float chaos;        //level of disorder

  Face(int horizon, int verticle, int pChaos) {
    gridHorizontal = horizon;
    gridVerticle = verticle;
    chaos = pChaos;
  } //constructor

  void display() { //methods to display
    //anchor a centre point
    middleX=gridHorizontal+offset+random(-chaos, chaos);
    middleY=gridVerticle+random(-chaos, chaos);

    // prevent hairstyles under face and over face appear at the same time
    if (random(100)<50) { //50% chance to have hairstyle under face
      hairDisplayUnderneath(middleX, middleY);
      face();
      nose();
      if (random(100)<30) { //30% chance to flush
        blush();
      }
      eyes();
      mouth();
    } else { //50% chance to have hairstyle over face
      face();
      nose();
      if (random(100)<30) {
        blush();
      }
      eyes();
      mouth();
      hairDisplayOver(middleX, middleY);
    }

    accessoriesDisplay(middleX, middleY);

    // 25% chance to wear a hat when the hairstyle is not afro (as afro hair cannot be contained by a hat)
    if (nonAfro) {
      if (random(100)<25) {
        hat(middleX, middleY);
      }
    }
  }


  void face() {//set basic shape of a face

    //ears
    noStroke();
    fill(skinColour[(int)random(7)]); 
    int randomX=(int)random(5, 12);
    int randomY=(int)random(10, 15);
    ellipse(middleX-20, middleY, randomX, randomY);
    ellipse(middleX+20, middleY, randomX, randomY);

    //faces
    float stdDev=3;
    float f = (float)faceLength.nextGaussian();
    f *= stdDev;
    f = f+43;//use normal distribution to control face length
    int roundnessUp=(int)random(10, 30);
    int roundnessDown=(int)random(10, 30);
    rectMode(CENTER);
    rect(middleX, middleY, random(37, 43), f, roundnessUp, roundnessUp, roundnessDown, roundnessDown);
  }

  void blush() {

    //blush
    fill(200, 0, 0, random(50, 70));
    noStroke();
    ellipse(middleX-10, middleY+5, 15, 10); 
    ellipse(middleX+10, middleY+5, 15, 10);
  }

  void nose() {

    //nose
    int noseLength = (int)random(0, 7);//randomise length
    strokeCap(ROUND);
    strokeWeight((int)random(0, 10));
    stroke(nose[(int)random(4)]);
    line(middleX, middleY-2, middleX, middleY+noseLength);

    //nostrils
    strokeWeight((int)random(0, 4));//randomise width of nose
    stroke(#5C392A);
    point(middleX-2, middleY+noseLength+2);
    point(middleX+2, middleY+noseLength+2);
  }


  void eyes() {
    //variables used to randomise position and size of eyes and eyebrows
    int eyeDistance=(int)random(5, 15);
    int eyeSize=(int)random(5, 8);
    int whiteSize=(int)random(1, 5);
    int eyeShiftX=(int)random(-3, 3);
    int eyeShiftY=(int)random(-3, 3);
    int eyebrowDir;
    int eyebrowDis=(int)random(2, 8);


    //white of the eye
    if (random(100)<40) {//40% chance to have eyeline
      strokeWeight(random(1, 4));
    } else {
      noStroke();
    }
    fill(255);
    ellipse(middleX+eyeDistance, middleY, eyeSize+whiteSize, eyeSize+whiteSize);
    ellipse(middleX-eyeDistance, middleY, eyeSize+whiteSize, eyeSize+whiteSize);

    //40% chance to have eyelashes
    if (random(100)<40) {
      stroke(20);
      strokeWeight(2);
      point(middleX+eyeDistance, middleY-eyeSize+whiteSize-2);
      point(middleX+eyeDistance+whiteSize, middleY-eyeSize+whiteSize);
      point(middleX+eyeDistance+whiteSize+2, middleY-eyeSize+whiteSize+2);
      point(middleX-eyeDistance, middleY-eyeSize+whiteSize-2);
      point(middleX-eyeDistance-whiteSize, middleY-eyeSize+whiteSize);
      point(middleX-eyeDistance-whiteSize-2, middleY-eyeSize+whiteSize+2);
    }

    //iris
    fill(eye[(int)random(5)]);
    noStroke();
    ellipse(middleX+eyeDistance+eyeShiftX, middleY+eyeShiftY, eyeSize, eyeSize);
    ellipse(middleX-eyeDistance+eyeShiftX, middleY+eyeShiftY, eyeSize, eyeSize);

    //eyebrow
    stroke(0);
    strokeWeight(random(1, 3));
    if (random(100)<70) {//70% chance without explicit emotion
      eyebrowDir=0;
    } else {//30% chance without emotion, either sad or angry
      eyebrowDir=(int)random(-5, 5);
    }
    line(middleX-eyebrowDis, middleY-7, middleX-eyebrowDis-5, middleY+eyebrowDir-7);//left
    line(middleX+eyebrowDis, middleY-7, middleX+eyebrowDis+5, middleY+eyebrowDir-7);//right
  }


  void mouth() {
    //mouth
    fill(#E55353);
    noStroke();
    rect(middleX, middleY+random(10, 13), random(1, 10), random(1, 6), random(7));//randomise position and size
  }
}
