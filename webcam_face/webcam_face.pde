import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {
  size(640, 480);
  opencv = new OpenCV(this);
  opencv.capture(320, 240);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT); 
}

void draw() {
  opencv.read();
  // display the current video feed
  image(opencv.image(), 0, 0);
 
  // detect anything ressembling a FRONTALFACE
  Rectangle[] faces = opencv.detect();
 
  // draw detected face area(s)
  fill(255,0,0);
  stroke(255,0,0);
  for (int i=0; i<faces.length; i++) {
    // copy a specific area from the image in memory (the background)
    // place the copy exactly where the face is in the current image
    rect(faces[i].x,faces[i].y,faces[i].width,faces[i].height);
  }
 
  // display the image in memory
  image(opencv.image(OpenCV.MEMORY), 329, 0);  
}

void keyPressed() {
  opencv.remember();
}

