class Emotion {//a class to add emotional elements

  int offset = 10;//to adjust horizontal position
  int gridHorizontal;//set grid. Distance between objects
  int gridVerticle;
  float middleX;//anchor a centre point for a single element
  float middleY;
  float chaos;//level of disorder

  Emotion(int horizon, int verticle, int pChaos) {
    gridHorizontal = horizon;
    gridVerticle = verticle;
    chaos = pChaos;
  }//constructor

  void display() {//methods to display
    //anchor a centre point
    middleX=gridHorizontal+offset+random(-chaos, chaos);//randomise centre point
    middleY=gridVerticle+random(-chaos, chaos);
    heart();
    bubble();
  }

  void bubble() {

    //speech bubbles
    if (random(100)<20) {//20% chance to have a speech bubble
      if (random(100)<50) {//50% chance to have bubble type 1
        stroke(255);
        strokeWeight(3);
        if (random(100)<50) {//50% chance to point to right
          line(middleX+30, middleY+30, middleX+45, middleY+45);
        } else {//50% chance to point to left
          line(middleX+30, middleY+30, middleX+15, middleY+45);
        }
      } else {//50% chance to have bubble type 1
        fill(255);
        noStroke();
        if (random(100)<50) {//50% chance to point to right
          ellipse(middleX+40, middleY+40, 5, 5);
          ellipse(middleX+45, middleY+45, 5, 5);
          ellipse(middleX+50, middleY+50, 2, 2);
        } else {//50% chance to point to left
          ellipse(middleX+20, middleY+40, 5, 5);
          ellipse(middleX+15, middleY+45, 5, 5);
          ellipse(middleX+10, middleY+50, 2, 2);
        }
      }
      fill(255);
      noStroke();
      ellipse(middleX+30, middleY+30, random(40, 50), random(20, 30));

      //text inside bubbles
      textSize(12);
      textAlign(CENTER);
      fill(#36435A);
      int c = (int)random(5);//variable used to control possibility
      //20% chance to get any one kind of text from 5
      if (c == 0) {
        text("...", middleX+30, middleY+35);
      } else if (c == 1) {
        text("???", middleX+30, middleY+35);
      } else if (c == 2) {
        text("!!!", middleX+30, middleY+36);
      } else if (c == 3) {
        text("****", middleX+30, middleY+37);
      } else if (c == 4) {
        text("$", middleX+30, middleY+35);
      }
    }
  }

  void heart() {
    int scale = (int)random(1, 3);//control the size heart shapes 

    //heart shape
    if (random(100)<10) {//10% chance to appear
      pushMatrix();
      translate(15, 15);//slightly adjust position to make hearts less likely appear on faces
      fill(#E33535);
      stroke(#E33535);//red
      strokeWeight(2);
      //draw a heart shape
      beginShape();
      vertex(10*scale+middleX, 3*scale+middleY);
      bezierVertex(10*scale+middleX, -1*scale+middleY, 18*scale+middleX, 1*scale+middleY, 10*scale+middleX, 8*scale+middleY);
      vertex(10*scale+middleX, 3*scale+middleY);
      bezierVertex(10*scale+middleX, -1*scale+middleY, 2*scale+middleX, 1*scale+middleY, 10*scale+middleX, 8*scale+middleY);
      endShape();
      popMatrix();
    }
  }
}