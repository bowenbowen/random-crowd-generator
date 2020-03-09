import processing.pdf.*;//get ready to save PDF

color bg[]={//colour palette for background
  0, //black
  150, //grey
  #9683A0, //purple
  #89A6A7, //blue
  #865046, //dark red
  #638170, //dark green
};


int count;              // times of the execution of draw function
int rows = 30;
int columns = 30;
int boxSize = 70;
int randomness = 15;
ArrayList<Face> a;      // to generate multiple faces 
ArrayList<Emotion> b;   // to generate multiple emotional elements 
boolean output = true;  // to control the export of PDF file


void setup() {
  size(1414, 1000);
  
  a=new ArrayList<Face>();                  // initialise arrayList a
  for (int i = 0; i < columns; i++) {       // expand horizontally
    for (int j = 0; j < rows; j++) {        // expand vertically
      a.add(new Face(boxSize*i, boxSize*j, randomness));    
      //add a new face to the arrayList. Set 70*70 squares for each face and randomness level 15
    }
  }
  
  b=new ArrayList<Emotion>();                // initialise arrayList b
  for (int i = 0; i < columns; i++) {        // expand horizontally
    for (int j = 0; j < rows; j++) {         // expand vertically
      b.add(new Emotion(boxSize*i, boxSize*j, randomness));   
      // add a new emotional element to the arrayList.Set 70*70 squares for each element and randomness level 15
    }
  }
}



void draw() {
  output = true; //always ready to record every time draw function is called
  if (output) {
    System.out.println("Start saving"+" No."+count);//prompt for start saving
    beginRecord(PDF, count+".pdf");//begin recording and name the file with time count
  }

  background(bg[(int)random(6)]);//bg colour for the first time

  if (mousePressed) {//click mouse
    background(bg[(int)random(6)]);//give a new background with random colour to covr the old drawing
  }



  for (Face f : a) {
    f.display();
    // call dispplay method from all elements in arrayList a - i.e.,display all the faces
  }
  for (Emotion e : b) {
    e.display();
    // call display method from all elements in arrayList b - i.e.,display all the emotional elements
  }

  if (output) {
    output =false;
    endRecord();//end recording
    System.out.println("Done saving"+" No."+count);//prompt for done saving
    count++;
  }

  noLoop();//still result
}


void mousePressed() {
  redraw();//everytime mouse is pressed, draw things again
}
