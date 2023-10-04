import processing.sound.*;

AudioIn input;
Amplitude analyzer;

void setup(){
  size(500, 500);
  noFill();
  stroke(255);
  strokeWeight(2);
  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
}


void draw(){
  background(0);
  float vol = analyzer.analyze()*50;
  translate(width/2, height/2);
  beginShape();
  for(float theta = 0; theta <= 2 * PI; theta+=0.001){
    float rad = r(theta, 
    vol, // a
    vol, // b
    7, // m
    1, //n1 
    4, //n2 
    4 //n3 
    );
    float x = rad*cos(theta) * 50;
    float y = rad*sin(theta) * 50;
    vertex(x, y);
  }
  endShape();
}


float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  // Theta is used to calculate the radius of each point on the curve
  // 'a' controls the scaling of the shape in the X direction
  // 'b' controls the scaling of the shape in the Y direction
  // 'm' controls the number of lobes/petals. it detremines how many bends the shape will have
  // 'n1' affects the overall roundness of the shape
  // 'n2' controls the individual curveture of the X components
  // 'n3' controls the individual curveture of the Y components
  // n2 and n3 can be used to assymetric or symmetric shapes
  return pow(
  pow(abs(cos(m* theta/4.0)/ a), n2) + pow(abs(sin(m* theta/4.0)/ b), n3)
  , -1/n1);
}
