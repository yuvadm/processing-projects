import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {
  size(640, 480);
  fill(0,0);
  stroke(255,0,0);
  
  opencv = new OpenCV(this);
  opencv.capture(320, 240);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT); 
}

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
 
  // detect anything ressembling a FRONTALFACE
  Rectangle[] faces = opencv.detect();
  
  for (int i=0; i<faces.length; i++) {
    rect(faces[i].x,faces[i].y,faces[i].width,faces[i].height);
  }
  
  image(opencv.image(OpenCV.MEMORY), 329, 0);  
}

void keyPressed() {
  opencv.remember();
}

