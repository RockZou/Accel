Accelerometer accel;

Maxim maxim;
AudioPlayer player;

float[] spec;

int xPos;

void setup()
{
  xPos=0;
  
  accel = new Accelerometer();
  maxim = new Maxim(this);
  player = maxim.loadFile("mybeat.wav");
  player.play();
  player.setLooping(true);
  player.setAnalysing(true);
}

void draw()
{
  int r,g,b;
  float speed;
  float power;
  
    
  //background(255);
  r=int(map(accel.getX(),-10,10,0,255));
  g=int(map(accel.getY(),-10,10,0,255));
  b=int(map(accel.getZ(),-10,10,0,255));
  player.play();
  spec = player.getPowerSpectrum();
  if (spec!=null)
  {
    for (int i=0; i<spec.length;i++)
    {
      strokeWeight(10*spec[i]);
      point(xPos,i);
    }
  }
  xPos+=4;
  
  if (xPos>width)
  {
    xPos=0;
    background(255);
  }
  //background(r,g,b);
  
  fill(r,g,b);
  //power = player.getAveragePower();
  //rect(0,height-power*height,width,height*power);
  //player.play();
  
  //println("X is "+accel.getX());
  //println("Y is "+accel.getY());
  //println("Z is "+accel.getZ());
  
  //speed = map(accel.getX(),-10,10,0,2);
  //player.speed(speed);
  
}

void mousePressed()
{

}
