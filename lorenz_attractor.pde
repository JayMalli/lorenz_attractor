import peasy.*;

float a=10;
float b=28;
float c=8.0/3.0;

float x=0.01;
float y=0;
float z=0;
ArrayList <PVector> points;

PeasyCam cam;
void setup()
{
  size(800,600,P3D);
  colorMode(HSB);
  points=new ArrayList<PVector>();
  cam=new PeasyCam(this,500);
}

void draw()
{
   background(0);
  float h=0;
  float dt=0.01;
  float dx=(a*(y-x))*dt;
  float dy=(x*(b-z)-y)*dt;
  float dz=(x*y-c*z)*dt;
  x=x+dx;
  y=y+dy;
  z=z+dz;
  points.add(new PVector(x,y,z));
  //translate(width/2,height/2);
  scale(5);               //for big sketch

  noFill();
  beginShape();
  for(PVector v : points)
  {
      stroke(h,200,255);
     vertex(v.x,v.y,v.z);
     h+=0.5;
     if(h>255)
     {
       h=0;
     }
  }
  endShape();
}
