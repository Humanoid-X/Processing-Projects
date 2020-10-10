class Circle{
  float radius;
  color colorStroke;
  color colorFill;
  float thickness;
  
  float mass;
  float restitution;
  float friction;
  
  PVector position,velocity;
  
  Circle(float r,color cs,color cf,float t,float m,float re,float f,PVector p,PVector v){
    radius = r;
    colorStroke = cs;
    colorFill = cf;
    thickness = t;
    
    mass = m;
    restitution = re;
    friction = f;
    
    position = p;
    velocity = v;
  }
  
  Circle(){
    radius = random(10,50);
    colorStroke = color(random(0,255),random(0,255),random(0,255),random(128,255));
    colorFill = color(random(0,255),random(0,255),random(0,255),random(128,255));
    thickness = random(0,5);
    
    mass = random(-10.0,10.0);
    restitution = random(0.0,1.0);
    friction = random(0.0,1.0);
    
    position = new PVector(random(0,width),random(0,height));
    velocity = new PVector(random(-0.2,-0.2),random(-0.2,0.2));
  }
  
  void update(){
    position.add(velocity);
    
    if(position.y > (height - radius) && velocity.y > 0){
      velocity.y = velocity.y * -restitution;
      velocity.y -= (velocity.y * friction);
      position.y = height - radius;
    }
    if(position.y < radius && velocity.y < 0){
      velocity.y = velocity.y * -restitution;
      velocity.y -= (velocity.y * friction);
      position.y = radius;
    }
    if(position.x > (width - radius) && velocity.x > 0){
      velocity.x = velocity.x * -restitution;
      velocity.x -= (velocity.x * friction);
      position.x = width - radius;
    }
    if(position.x < radius && velocity.x < 0){
      velocity.x = velocity.x * -restitution;
      velocity.x -= (velocity.x * friction);
      position.x = radius;
    }
    
    for (int i = 1;i < circles.length;i++) {
      float dx = circles[i].position.x - position.x;
      float dy = circles[i].position.y - position.y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = (circles[i].radius) + radius;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = position.x + cos(angle) * minDist;
        float targetY = position.y + sin(angle) * minDist;
        PVector bounce = new PVector(targetX - circles[i].position.x,targetY - circles[i].position.y);
        bounce.mult(restitution);
        velocity.sub(bounce);
        circles[i].velocity.add(bounce);
      }
    }
  }
  
  void applyForce(PVector force){
    velocity.add(force);
  }
  
  void display(){
    ellipseMode(CENTER);
    
    stroke(colorStroke);
    if(thickness == 0){
      noStroke();
    }else{
      strokeWeight(thickness);
    }
    
    fill(colorFill);
    ellipse(position.x,position.y,radius * 2,radius * 2);
  }
}
