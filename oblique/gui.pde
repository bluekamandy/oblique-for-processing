void setupGUI() {

  ControlFont cf1 = new ControlFont(createFont("OpenSans-Regular.ttf", 12));

  color activeColor = color(0, 0, 100);

  controlP5 = new ControlP5(this);

  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(50));
  controlP5.setColorForeground(color(170));

  sliders = new Slider[10];
  buttons = new Button[10];
  toggles = new Toggle[10];

  int left = UI_WIDTH + imageView.width + UI_MARGIN;
  int top = 5;
  int len = UI_WIDTH - UI_MARGIN*2;
  int hei = 25;

  int si = 0;
  int bi = 0;
  int ti = 0;
  int posY = 0;
  int spacer = 60;

  sliders[si] = controlP5.addSlider("adjust_brightness", -1.0, 1.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("Brightness");
  posY += spacer;

  sliders[si] = controlP5.addSlider("adjust_contrast", 0.0, 4.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("Contrast");
  posY += spacer;

  sliders[si] = controlP5.addSlider("adjust_saturation", 0.0, 2.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("Saturation");
  posY += spacer;

  sliders[si] = controlP5.addSlider("adjust_temperature", -1.0, 1.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("Temperature");
  posY += spacer;

  sliders[si] = controlP5.addSlider("adjust_tint", -1.0, 1.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("Tint");
  posY += spacer;

  sliders[si] = controlP5.addSlider("adjust_hue", 0.0, 1.0, left, top+posY, len, hei);
  sliders[si].setBroadcast(false);
  sliders[si++].getCaptionLabel().setText("hue");
  posY += spacer;

  toggles[ti] = controlP5.addToggle("adjust_invert", false);
  toggles[ti].setBroadcast(false);
  toggles[ti].setPosition(left, top+posY);
  toggles[ti].setSize(50, 20);
  controlP5.getController("adjust_invert")
    .getCaptionLabel()
    .setText("Invert");
  toggles[ti++].setMode(ControlP5.SWITCH);
  posY += spacer;

  toggles[ti] = controlP5.addToggle("adjust_time", true);
  toggles[ti].setBroadcast(false);
  toggles[ti].setPosition(left, top+posY);
  toggles[ti].setSize(50, 20);
  controlP5.getController("adjust_time")
    .getCaptionLabel()
    .setText("Toggle Time");
  toggles[ti++].setMode(ControlP5.SWITCH);
  posY += spacer;

  controlP5.addSlider2D("adjust_oblique")
    .setPosition(left, top+posY)
    .setSize(UI_WIDTH- UI_MARGIN*2, UI_WIDTH - UI_MARGIN*2)
    .setMinMax(0.0, 0.0, 1.0, 1.0)
    .setValue(0.5, 0.5)
    .setLabel("Oblique Parameter")
    ;

  posY += 260+spacer;

  buttons[bi++] = controlP5.addButton("resetAdjustments")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(left, top+posY)
    .setSize(50, 20)
    ;
  controlP5.getController("resetAdjustments")
    .getCaptionLabel()
    .setText("Reset");
  posY += spacer-17;

  buttons[bi++] = controlP5.addButton("randomizeAdjustments")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(left, top+posY)
    .setSize(50, 20)
    ;
  controlP5.getController("randomizeAdjustments")
    .getCaptionLabel()
    .setText("randomize");
  posY += spacer-17;

  buttons[bi++] = controlP5.addButton("getFile")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(left, top+posY)
    .setSize(50, 20)
    ;
  controlP5.getController("getFile")
    .getCaptionLabel()
    .setText("Load Image");
  posY += spacer-17;

  buttons[bi++] = controlP5.addButton("saveFile")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(left, top+posY)
    .setSize(50, 20)
    ;
  controlP5.getController("saveFile")
    .getCaptionLabel()
    .setText("Save Image");
  posY += spacer-17;

  for (int i = 0; i < si; i++) {
    sliders[i].setSize(len, hei);
    sliders[i].getCaptionLabel().toUpperCase(true);
    sliders[i].getCaptionLabel().getStyle().padding(0, 4, 0, 0);
    sliders[i].getCaptionLabel().getStyle().marginTop = 28;
    sliders[i].getCaptionLabel().getStyle().marginLeft = -284;
    sliders[i].getCaptionLabel().setColorBackground(activeColor);
    sliders[i].getCaptionLabel().setFont(cf1);
    sliders[i].setBroadcast(true);
  }

  for (int i = 0; i < bi; i++) {
    buttons[i].setBroadcast(false);
    buttons[i].setSize(len, hei);
    buttons[i].getCaptionLabel().toUpperCase(true);
    buttons[i].getCaptionLabel().setFont(cf1);
    buttons[i].setBroadcast(true);
  }

  for (int i = 0; i < ti; i++) {
    toggles[i].setBroadcast(false);
    toggles[i].getCaptionLabel().toUpperCase(true);
    toggles[i].getCaptionLabel().setColorBackground(activeColor);
    toggles[i].getCaptionLabel().setFont(cf1);
    toggles[i].setBroadcast(true);
  }
}

void checkValuesFromGUI() {

  // --Check-values-from-GUI--
  adjust_brightness = controlP5.getController("adjust_brightness").getValue();
  shader_pack[0].uniform =  adjust_brightness;
  adjust_contrast = controlP5.getController("adjust_contrast").getValue();
  shader_pack[1].uniform = adjust_contrast;
  adjust_saturation = controlP5.getController("adjust_saturation").getValue();
  shader_pack[2].uniform = adjust_saturation;
  adjust_temperature = controlP5.getController("adjust_temperature").getValue();
  shader_pack[3].uniform = adjust_temperature;
  adjust_tint = controlP5.getController("adjust_tint").getValue();
  shader_pack[4].uniform = adjust_tint;
  adjust_hue = controlP5.getController("adjust_hue").getValue();
  shader_pack[5].uniform = adjust_hue;
  adjust_invert = ((Toggle)controlP5.getController("adjust_invert")).getBooleanValue();
  shader_pack[6].uniform = adjust_invert;
  float[] adjust_oblique_array = controlP5.getController("adjust_oblique").getArrayValue();
  adjust_oblique = new PVector(adjust_oblique_array[0], adjust_oblique_array[1]);
  shader_pack[7].uniform = adjust_oblique;
}
