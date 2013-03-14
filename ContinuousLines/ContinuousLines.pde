/**
 * 
 * Draw pattern on a line, following the mouse
 *
 * 2013-03-14 Morgan Aasdam
 *
 * Public domain
 */

void setup() {
  size(1000,1000);
  background(102);
}

void draw() {
  background(102);
  stroke(255);
  textSize(12);
  rotate(0);
  int Ax, Ay,Bx,By,Cx,Cy,Dx,Dy,Ex,Ey,segmentLength,increment;
  float angle;
  Ax = mouseX;
  Ay = mouseY;
  Bx = 800;
  By = 100;
  Cx = 700;
  Cy = 700;
  increment=50;
  
  //Triangle we are looking at
  line(Ax,Ay,Bx,By);
  line(Bx,By,Cx,Cy);
  line(Cx,Cy,Ax,Ay);
  
  //90' triangle we use for calculating AC
 
  line(Ax,Ay,Cx,Ay);
  line(Cx,Ay,Cx,Cy);
  
  //Labels
  text("A", Ax, Ay);
  text("B", Bx, By);
  text("C", Cx, Cy);
  
  //Calculate Angle CAB  
  angle=calculateAngle(Ax,Ay,Cx,Cy);
  text("Angle CAB: "+angle, 0, 12);
  
  //Length of AC
  segmentLength=calculateSegmentLength(Ax,Ay,Cx,Cy);
  text("Length AC: "+segmentLength, 0, 24);
  
  //Draw Dots spaced by increment on line
  for(int i=1; i<floor(segmentLength/increment); i++){
    int j,k;
    j=calculateNewX(Ax,Ay,Cx,Cy,angle,increment*i);
    k=calculateNewY(Ax,Ay,Cx,Cy,angle,increment*i);
    text("position:"+j+","+k,0,36+(12*i));
    ellipse(j,k,10,10);
  }
    
}

//Calculates the angle from horizontal between two points
float calculateAngle(float Xa,float Ya,float Xb,float Yb){
  println(Xa+","+Ya+","+Xb+","+Yb);
  println((Yb-Ya)+","+(Xb-Xa));
  println(atan((Yb-Ya)/(Xb-Xa)));
  return atan((Yb-Ya)/(Xb-Xa));
}

//Calculates segment length (to lowest closest int)
int calculateSegmentLength(int Xa,int Ya,int Xb,int Yb){
  return floor(sqrt(sq(Xb-Xa)+sq(Yb-Ya)));
}

//Calculates X coordinate for new point on line segment with Origin A and End B
int calculateNewX(int Ax, int Ay, int Bx, int By, float angle,int distanceFromA){
  float o = (cos(angle)*distanceFromA);
  if((Bx<Ax && By>Ay) || (Bx<Ax && By<Ay))return floor(Ax-o);
  return floor(o+Ax);
}

//Calculates Y coordinate for new point on line segment with Origin A and End B
int calculateNewY(int Ax, int Ay, int Bx, int By, float angle,int distanceFromA){
  float o = (sin(angle)*distanceFromA);
  if((Bx<Ax && By>Ay) || (Bx<Ax && By<Ay))return floor(Ay-o);
  return floor(o+Ay);
}

