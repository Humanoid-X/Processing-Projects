class Arrow{
  PVector position;
  float distance;
  float angle;
  float thickness;
  color colorStroke;
  
  Arrow(PVector p,float d,float a,float t,color c){
    position = p;
    distance = d;
    angle = a;
    thickness = t;
    colorStroke = c;
  }
  
  void display(){
    strokeWeight(thickness);
    stroke(colorStroke);
    
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    rotate(-QUARTER_PI);
    translate(distance,distance);
    line(-distance,-distance,0,0);
    rotate(HALF_PI + QUARTER_PI);
    line(0,0,20,20);
    rotate(-(PI + HALF_PI));
    line(0,0,20,20);
    popMatrix();
  }
}

float angle(PVector v1, PVector v2) {
  float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  if (a < 0) a += TWO_PI;
  return a;
}
