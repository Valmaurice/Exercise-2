

void settings() {
  size(600,600);
}
 
void setup() {
   
  makeThatPlace();
}

void draw() {

}

void makeHills(color theColor, int vertScale, int offsetFromTop, float noiseScale){
  noStroke();
  fill(25,124,19);
  beginShape();
  float contour[] = new float[width];
  for(int i = 0; i < width; i++){
    contour[i]=noise(i*noiseScale)*vertScale+offsetFromTop;
    vertex(i,contour[i]);
  }
  vertex(width,height);
  vertex(0,height);
  endShape(CLOSE);
  
  int NUMTREES = 10;
  for (int j = 0; j < NUMTREES; j++){
    drawTree(contour);
  }
  
}

void makeSun(color theColor){
  int xval = (int) random(width);
  int yval = (int) random(height);
  int radius = (int) random(width/20,width/10);
  
  ellipseMode(RADIUS);
  noStroke();
  
  fill(theColor); // primary central circle
  ellipse(xval,yval,radius,radius);
  
}

void mousePressed(){
  noiseSeed((long) random(1000));
  makeThatPlace();

}

void makeThatPlace(){
  background(40,150,200);
  makeSun(color(200,200,20));
  makeHills(color(150),200,3*height/5,0.02);
  makeHills(color(220),150,4*height/5,0.002);
 
  
}

void drawTree(float theContour[]){
  int xval = (int) random(width);
  int yval = (int) random(theContour[xval],height);
  
  int trunkWidth = 10;
  int trunkHeight = 40;
  
  rectMode(CORNERS);
  
  fill(100,20,20);
  rect(xval-trunkWidth/2,yval,xval+trunkWidth/2,yval-trunkHeight);
  
  fill(50,200,75);
  triangle(xval-25,yval-20,xval+25,yval-20,xval,yval-60);
  
}
