ArrayList<Triangle> triangles;
color[] colors = new color[8];
              
int num = 25;
PImage colorPalette;
int rate = 10;

void setup() {

  size(600,600);
  frameRate(rate);
  smooth();
  
  triangles = new ArrayList<Triangle>();
  colorPalette = loadImage("paleta 003_A-02.png");
  
  for (int i = 0; i < 7; i++) {
  
    colors[i] = colorPalette.get(10, 10 + i * 20);
    
  }
  
  colors[7] = #000000;

  float angle = PI/2;
  int i = 0;
  
  while(angle < 3*PI/2) {

    int num2 = int(random(8));
    if (i > 0) {
      while (colors[num2] == triangles.get(i-1).col) num2 = int(random(8));
    }
    if (i > 0) angle = triangles.get(i-1).a2;
    triangles.add(new Triangle(angle, colors[num2], num2));
    i++;
    
  }
  
}

void draw() {
  
  background(5);
   
  float anim = map(frameCount%rate, 0, rate, 0, 7);
  if (frameCount%(2*rate) >= rate) anim = map(frameCount%rate, 0, rate, 7, 0);
  if (frameCount % (4*rate) > 2*rate) anim = 0;
  
  println(frameCount + " " + anim);
  
  for (int i = 0; i < triangles.size(); i++) {

    if (triangles.get(i).getType() < anim){ 
      triangles.get(i).display();
    }
    
  }

  if (frameCount == 40) exit();
  PGraphics frameToSave;


    frameToSave = createGraphics(width, height);
    frameToSave.beginDraw();
    frameToSave.smooth();
    loadPixels();
    frameToSave.loadPixels();
    for (int i=0; i<pixels.length; i++){
      
      frameToSave.pixels[i] = pixels[i];
      if (frameToSave.pixels[i] == color(5)) frameToSave.pixels[i] = color(255,0,0,0);
    }
    frameToSave.updatePixels();
    frameToSave.endDraw();
    String fileName = "faceA/filter003A-00"+frameCount+".png";
    if (frameCount >= 10) fileName = "faceA/filter003A-0"+frameCount+".png";
    frameToSave.save(fileName);

}