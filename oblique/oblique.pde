/**
 *
 * oblique for processing
 *
 * by masood kamandy-milne
 *
 * initiated: 2/20/21
 * last updated: 3/11/21
 *
 * note: this is a port of my iOS app oblique for processing.
 * Whereas the focus with the iOS oblique was realtime image
 * filtration, this app allows users to import high resolution
 * images and apply GLSL filters directly to them. The
 * interface allows for editing and a finalize button applies
 * the filtration to the high resolution file.
 *
 */

/**
 *
 * to do list:
 *
 * 01 - create layout for app [DONE]
 * 02 - import low res image and size it within image frame [DONE]
 * 03 - maintain reference to original file path [DONE]
 * 04 - build interface to load images with gui [DONE]
 * 05 - build mechanism to apply glsl filters to preview [DONE]
 * 06 - encapsulate shader chain into an object [DONE]
 * 07 - create shader data structure with generics as uniforms [DONE]
 * 08 - develop layout for individual shaders and highlighting [DONE]
 * 09 - develop controls: either a 2d slider or mouse clicks on the image [DONE]
 * 10 - work on loading high resolution images
 * 11 - add quit button. [TO DO]
 * 12 - work on loading outside shaders. [FUTURE]
 * 13 - allow saving of settings as presets in a dropdown. [FUTURE]
 * 14 - make loaded shaders persistent. [FUTURE]
 * 15 - create mechanism for deleting unwanted shaders. [FUTURE]
 *
 */

/**
 *
 * resources:
 *
 * Dialog Box - https://forum.processing.org/two/discussion/869
 * "Chaining" glsl filters in Processing - https://github.com/cansik/processing-bloom-filter
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
  previewImage = loadImage("mandrill.png");

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
