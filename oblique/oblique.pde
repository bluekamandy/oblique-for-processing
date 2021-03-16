/**
 *
 * oblique for processing
 *
 * by masood kamandy-milne
 *
 * initiated: 2/20/21
 * last updated: 3/16/21
 *
 * note: this is a port of my iOS app oblique for processing.
 * Whereas the focus with the iOS oblique was realtime image
 * filtration, this app allows users to import still
 * images and apply GLSL filters directly to them. The
 * interface allows for editing and a finalize button applies
 * the filtration to the high resolution file.
 *
 */


import static javax.swing.JOptionPane.*;
import java.util.Arrays;
import java.util.List;
import controlP5.*;

// --GUI--
ControlP5 controlP5;
Slider[] sliders;
Button[] buttons;
Toggle[] toggles;

String imagePath;

final int UI_WIDTH = 300;
final int UI_MARGIN = 10;
final int GRAY_BACKGROUND = 20;

PGraphics canvas;
PGraphics imageView;
PImage previewImage;

ShaderPackage[] shader_pack;
ShaderChain chain;

// --Global-Uniforms--
float time = 0.0;
PVector clickPosition;

PreviewColumn previewColumn;

void setup() {
  fullScreen(P2D);
  noStroke();

  imageView = createGraphics(width-UI_WIDTH*2, height, P2D); // This is just for layout.
  previewImage = loadImage("Moon_Crescent_-_False_Color_Mosaic.jpg");
  
  previewImage = resizeToFit(previewImage);

  setupGraphicsPipeline();

  // --GUI--
  setupGUI();
}

void draw() {
  if (adjust_time) {
    time += .025;
  }

  // --Filter-Area--
  fill(GRAY_BACKGROUND);
  rect(0, 0, UI_WIDTH, height);
  previewColumn.display();

  // --Access-image-from-shader-chain--
  canvas = chain.display();

  // --Image-Area--
  imageView.beginDraw();
  imageView.background(GRAY_BACKGROUND);
  imageView.imageMode(CENTER);
  imageView.image(canvas, imageView.width/2, imageView.height/2);
  imageView.endDraw();

  image(imageView, UI_WIDTH, 0);

  // --Adjustment-Area--
  fill(GRAY_BACKGROUND);
  rect(UI_WIDTH+imageView.width, 0, UI_WIDTH, height);

  checkValuesFromGUI();
}
