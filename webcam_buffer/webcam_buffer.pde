import processing.video.*;

Capture c;
VideoBuffer vb;

void setup() 
{
  size(200, 200);
  c = new Capture(this, width, height, 30);
  vb = new VideoBuffer(30, width, height);
}

void captureEvent(Capture c)
{
  c.read();
  if (vb != null)
    vb.addFrame(c);
}

void draw()
{
  image(vb.getFrame(), 0, 0);
}

class VideoBuffer
{
  PImage[] b;
  int s;
  int w;
  int h;
  int cur;
  
  VideoBuffer(int s, int w, int h)
  {
    this.b = new PImage[s];
    for (int i=0; i<s; i++) {
      this.b[i] = new PImage(w, h);
    }
    this.s = s;
    this.w = w;
    this.h = h;
  }
  
  void addFrame(PImage f)
  {
    System.arraycopy(f.pixels, 0, b[cur].pixels, 0, w * h);
    b[cur].updatePixels();
    cur = (cur + 1) % s;
  }
  
  PImage getFrame()
  {
    int i = int(random(s));
    //int i = cur - 1;
    //i = i < 0 ? 0 : i;
    return b[i];
  }
}
