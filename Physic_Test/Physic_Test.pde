float fadeSpeed = 20;

float mouseStrength = 100;
float windStrength = 0.1;
float gravityStrength = 0.2;

Circle[] circles = new Circle[12];
Arrow arrow;

PVector wind = (PVector.random2D()).mult(0.1);
PVector gravity = new PVector(0,gravityStrength);

void setup(){
  background(0);
  size(1000,600);
  for(int n = 0;n < circles.length;n++){
    circles[n] = new Circle();
  }
}

void draw(){
  fill(0,fadeSpeed);
  rect(0,0,width,height);
  
  for(int n = 0;n < circles.length;n++){
    circles[n].applyForce(wind);
    circles[n].applyForce(gravity);
    circles[n].update();
    circles[n].display();
  }
  
  arrow = new Arrow(
                    new PVector(500,200),
                    80,
                    angle(new PVector(0,0),wind),
                    5,
                    color(255)
                   );
  arrow.display();
  
  if(mousePressed && mouseButton == CENTER){
    wind = new PVector(mouseX - 500,mouseY - 200);
    wind.normalize();
    wind.div(10);
  }else{
    wind.rotate((noise(frameCount) - 0.5) / 10);
  }
}
