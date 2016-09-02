class Triangle {

  PVector center;
  PVector p1;
  PVector p2;
  float a1, a2;
  float l;
  color col;
  int type;
  
  Triangle(float angle, color col_, int type_) {
  
    center = new PVector(width/2 + 20, height/3);
    
    l = 1000;
    a1 = angle;
    a2 = a1 + random(PI/2/num, 2 * PI/num);
    col = col_;
    type = type_;
    
    p1 = new PVector(center.x + l * cos(a1), center.y + l * sin(a1));
    p2 = new PVector(center.x + l * cos(a2), center.y + l * sin(a2));
  
  }
  
  int getType() {
  
    return type;
    
  }

  void display() {
  
    if (type < 7) {
      fill(col);
      noStroke();
      triangle(center.x, center.y, p1.x, p1.y, p2.x, p2.y);
    }
  }



}