void setupGraphicsPipeline() {
  // --Set-up-filter-chain-with-PGraphics--
  canvas = createGraphics(previewImage.width, previewImage.height, P2D);
  setUpPGraphicsChain();

  // --Package-up-contexts,-shader,-uniforms,-and-uniform-names--
  setUpShaderPackages();

  // --Set-up-ShaderChain-object
  chain = new ShaderChain(previewImage, canvas, shader_pack);

  // --Set-up-oblique-shaders--
  setupObliqueShaders();

  // --Set-up-Shader-Previews--
  setupShaderPreviews();
}

void setUpPGraphicsChain() {
  canvas = createGraphics(previewImage.width, previewImage.height, P2D);
  brightness_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  contrast_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  saturation_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  temperature_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  tint_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  hue_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  invert_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  oblique_pass = createGraphics(previewImage.width, previewImage.height, P2D);
}

void setUpShaderPackages() {

  // --Set-up-shaders--
  brightness_shader = loadShader("shader/adjustments/brightness.glsl");
  contrast_shader = loadShader("shader/adjustments/contrast.glsl");
  saturation_shader = loadShader("shader/adjustments/saturation.glsl");
  temperature_shader = loadShader("shader/adjustments/temperature.glsl");
  tint_shader = loadShader("shader/adjustments/temperature.glsl");
  hue_shader = loadShader("shader/adjustments/hue.glsl");
  invert_shader = loadShader("shader/adjustments/invert.glsl");
  oblique_shader = loadShader("shader/default/blank.glsl");

  // --Set-up-packages--
  brightness_pack = new ShaderPackage(brightness_shader, brightness_pass, "Brightness", "brightness", adjust_brightness);
  contrast_pack = new ShaderPackage(contrast_shader, contrast_pass, "Contrast", "contrast", adjust_contrast);
  saturation_pack = new ShaderPackage(saturation_shader, saturation_pass, "Saturation", "saturation", adjust_saturation);
  temperature_pack = new ShaderPackage(temperature_shader, temperature_pass, "Temperature", "temperature", adjust_temperature);
  tint_pack = new ShaderPackage(tint_shader, tint_pass, "Tint", "tint", adjust_tint);
  hue_pack = new ShaderPackage(hue_shader, hue_pass, "Hue", "hue", adjust_hue);
  invert_pack = new ShaderPackage(invert_shader, invert_pass, "Invert", "invert", adjust_invert);
  oblique_pack = new ShaderPackage(oblique_shader, oblique_pass, "No Filter", "parameter", adjust_oblique);

  // --set-up-package-array--
  shader_pack = new ShaderPackage[] {
    brightness_pack,
    contrast_pack,
    saturation_pack,
    temperature_pack,
    tint_pack,
    hue_pack,
    invert_pack,
    oblique_pack
  };
}

void setupObliqueShaders() {
  // --Load-shaders--
  blank_shader = loadShader("shader/default/blank.glsl");
  grid_shader = loadShader("shader/default/grid.glsl");
  stretch_shader = loadShader("shader/default/stretch.glsl");
  waves_shader = loadShader("shader/default/waves.glsl");
  shear_shader = loadShader("shader/default/shear.glsl");
  tunnel_shader = loadShader("shader/default/tunnel.glsl");
  polar_shader = loadShader("shader/default/polar.glsl");
  foursplit_shader = loadShader("shader/default/4split.glsl");
  rainbow_shader = loadShader("shader/default/rainbow.glsl");
  colorcompress_shader = loadShader("shader/default/color_compress.glsl");
  rgbseparation_shader = loadShader("shader/default/rgb_separation.glsl");
  rgbhard_shader = loadShader("shader/default/rgb_hard.glsl");
  colorcycle_shader = loadShader("shader/default/colorcycle.glsl");
  clampmode0_shader = loadShader("shader/default/clampmode0.glsl");
  clampmode1_shader = loadShader("shader/default/clampmode1.glsl");
  clampmode2_shader = loadShader("shader/default/clampmode2.glsl");
  clampmode3_shader = loadShader("shader/default/clampmode3.glsl");
  clampmode4_shader = loadShader("shader/default/clampmode4.glsl");
  clampmode5_shader = loadShader("shader/default/clampmode5.glsl");
  noise_shader = loadShader("shader/default/noise.glsl");
  noisewarp_shader = loadShader("shader/default/noisewarp.glsl");
  hmirror_shader = loadShader("shader/default/hmirror.glsl");
  vmirror_shader = loadShader("shader/default/vmirror.glsl");
  fourscope_shader = loadShader("shader/default/4scope.glsl");
  overmirror_shader = loadShader("shader/default/overmirror.glsl");

  // --Initialize-all-Oblique-PGraphics--
  blank_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  grid_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  stretch_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  shear_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  waves_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  tunnel_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  polar_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  foursplit_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  rainbow_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  colorcompress_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  rgbseparation_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  rgbhard_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  colorcycle_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode0_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode1_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode2_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode3_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode4_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  clampmode5_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  noise_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  noisewarp_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  hmirror_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  vmirror_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  fourscope_pass = createGraphics(previewImage.width, previewImage.height, P2D);
  overmirror_pass = createGraphics(previewImage.width, previewImage.height, P2D);
}

void resetAdjustments() {
  adjust_brightness = 0.0;
  adjust_contrast = 1.0;
  adjust_saturation = 1.0;
  adjust_temperature = 0.0;
  adjust_tint = 0.0;
  adjust_hue = 0.0;
  adjust_invert = false;
  adjust_oblique = new PVector(0.5, 0.5);

  controlP5.getController("adjust_brightness").setValue(adjust_brightness);
  controlP5.getController("adjust_contrast").setValue(adjust_contrast);
  controlP5.getController("adjust_saturation").setValue(adjust_saturation);
  controlP5.getController("adjust_temperature").setValue(adjust_temperature);
  controlP5.getController("adjust_tint").setValue(adjust_tint);
  controlP5.getController("adjust_hue").setValue(adjust_hue);
  ((Toggle)controlP5.getController("adjust_invert")).setValue(adjust_invert);
  controlP5.getController("adjust_oblique").setArrayValue(new float[] {adjust_oblique.x, adjust_oblique.y});
}

void setupShaderPreviews() {
  int yPos = 0;
  ShaderPackage blank_pack = new ShaderPackage(blank_shader, blank_pass, "NO FILTER", "parameter", adjust_oblique);
  Preview blank_preview = new Preview(0, yPos, blank_pack, previewImage);
  yPos += 300;

  ShaderPackage grid_pack = new ShaderPackage(grid_shader, blank_pass, "GRID", "parameter", adjust_oblique);
  Preview grid_preview = new Preview(0, yPos, grid_pack, previewImage);
  yPos += 300;

  ShaderPackage stretch_pack = new ShaderPackage(stretch_shader, blank_pass, "STRETCH", "parameter", adjust_oblique);
  Preview stretch_preview = new Preview(0, yPos, stretch_pack, previewImage);
  yPos += 300;

  ShaderPackage shear_pack = new ShaderPackage(shear_shader, shear_pass, "SHEAR", "parameter", adjust_oblique);
  Preview shear_preview = new Preview(0, yPos, shear_pack, previewImage);
  yPos += 300;

  ShaderPackage waves_pack = new ShaderPackage(waves_shader, waves_pass, "WAVES", "parameter", adjust_oblique);
  Preview waves_preview = new Preview(0, yPos, waves_pack, previewImage);
  yPos += 300;

  ShaderPackage tunnel_pack = new ShaderPackage(tunnel_shader, tunnel_pass, "TUNNEL", "parameter", adjust_oblique);
  Preview tunnel_preview = new Preview(0, yPos, tunnel_pack, previewImage);
  yPos += 300;

  ShaderPackage polar_pack = new ShaderPackage(polar_shader, polar_pass, "POLAR", "parameter", adjust_oblique);
  Preview polar_preview = new Preview(0, yPos, polar_pack, previewImage);
  yPos += 300;


  ShaderPackage foursplit_pack = new ShaderPackage(foursplit_shader, foursplit_pass, "4SPLIT", "parameter", adjust_oblique);
  Preview foursplit_preview = new Preview(0, yPos, foursplit_pack, previewImage);
  yPos += 300;

  ShaderPackage rainbow_pack = new ShaderPackage(rainbow_shader, rainbow_pass, "RAINBOW", "parameter", adjust_oblique);
  Preview rainbow_preview = new Preview(0, yPos, rainbow_pack, previewImage);
  yPos += 300;

  ShaderPackage colorcompress_pack = new ShaderPackage(colorcompress_shader, colorcompress_pass, "COLOR COMPRESS", "parameter", adjust_oblique);
  Preview colorcompress_preview = new Preview(0, yPos, colorcompress_pack, previewImage);
  yPos += 300;

  ShaderPackage rgbseparation_pack = new ShaderPackage(rgbseparation_shader, rgbseparation_pass, "RGB SEPARATION", "parameter", adjust_oblique);
  Preview rgbseparation_preview = new Preview(0, yPos, rgbseparation_pack, previewImage);
  yPos += 300;

  ShaderPackage rgbhard_pack = new ShaderPackage(rgbhard_shader, rgbhard_pass, "RGB HARD", "parameter", adjust_oblique);
  Preview rgbhard_preview = new Preview(0, yPos, rgbhard_pack, previewImage);
  yPos += 300;

  ShaderPackage colorcycle_pack = new ShaderPackage(colorcycle_shader, colorcycle_pass, "COLOR CYCLE", "parameter", adjust_oblique);
  Preview colorcycle_preview = new Preview(0, yPos, colorcycle_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode0_pack = new ShaderPackage(clampmode0_shader, clampmode0_pass, "CLAMP MODE 0", "parameter", adjust_oblique);
  Preview clampmode0_preview = new Preview(0, yPos, clampmode0_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode1_pack = new ShaderPackage(clampmode1_shader, clampmode1_pass, "CLAMP MODE 1", "parameter", adjust_oblique);
  Preview clampmode1_preview = new Preview(0, yPos, clampmode1_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode2_pack = new ShaderPackage(clampmode2_shader, clampmode2_pass, "CLAMP MODE 2", "parameter", adjust_oblique);
  Preview clampmode2_preview = new Preview(0, yPos, clampmode2_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode3_pack = new ShaderPackage(clampmode3_shader, clampmode3_pass, "CLAMP MODE 3", "parameter", adjust_oblique);
  Preview clampmode3_preview = new Preview(0, yPos, clampmode3_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode4_pack = new ShaderPackage(clampmode4_shader, clampmode4_pass, "CLAMP MODE 4", "parameter", adjust_oblique);
  Preview clampmode4_preview = new Preview(0, yPos, clampmode4_pack, previewImage);
  yPos += 300;

  ShaderPackage clampmode5_pack = new ShaderPackage(clampmode5_shader, clampmode5_pass, "CLAMP MODE 5", "parameter", adjust_oblique);
  Preview clampmode5_preview = new Preview(0, yPos, clampmode5_pack, previewImage);
  yPos += 300;

  ShaderPackage noise_pack = new ShaderPackage(noise_shader, noise_pass, "NOISE", "parameter", adjust_oblique);
  Preview noise_preview = new Preview(0, yPos, noise_pack, previewImage);
  yPos += 300;

  ShaderPackage noisewarp_pack = new ShaderPackage(noisewarp_shader, noisewarp_pass, "NOISE WARP", "parameter", adjust_oblique);
  Preview noisewarp_preview = new Preview(0, yPos, noisewarp_pack, previewImage);
  yPos += 300;

  ShaderPackage hmirror_pack = new ShaderPackage(hmirror_shader, hmirror_pass, "H MIRROR", "parameter", adjust_oblique);
  Preview hmirror_preview = new Preview(0, yPos, hmirror_pack, previewImage);
  yPos += 300;

  ShaderPackage vmirror_pack = new ShaderPackage(vmirror_shader, vmirror_pass, "V MIRROR", "parameter", adjust_oblique);
  Preview vmirror_preview = new Preview(0, yPos, vmirror_pack, previewImage);
  yPos += 300;

  ShaderPackage fourscope_pack = new ShaderPackage(fourscope_shader, vmirror_pass, "4 SCOPE", "parameter", adjust_oblique);
  Preview fourscope_preview = new Preview(0, yPos, fourscope_pack, previewImage);
  yPos += 300;

  ShaderPackage overmirror_pack = new ShaderPackage(overmirror_shader, overmirror_pass, "OVERMIRROR", "parameter", adjust_oblique);
  Preview overmirror_preview = new Preview(0, yPos, overmirror_pack, previewImage);
  yPos += 300;

  Preview[] previews = new Preview[] {
    blank_preview,
    grid_preview,
    stretch_preview,
    shear_preview,
    waves_preview,
    tunnel_preview,
    polar_preview,
    foursplit_preview,
    rainbow_preview,
    colorcompress_preview,
    rgbseparation_preview,
    rgbhard_preview,
    colorcycle_preview,
    clampmode0_preview,
    clampmode1_preview,
    clampmode2_preview,
    clampmode3_preview,
    clampmode4_preview,
    clampmode5_preview,
    noise_preview,
    noisewarp_preview,
    hmirror_preview,
    vmirror_preview,
    fourscope_preview,
    overmirror_preview,
  };

  previewColumn = new PreviewColumn(previews);
}

void randomizeAdjustments() {
  adjust_saturation = random(0.0, 2.0);
  adjust_temperature = random(-1.0, 1.0);
  adjust_tint = random(-1.0, 1.0);
  adjust_hue = random(0.0, 1.0);
  adjust_invert = round(random(1)) == 0 ? false : true;
  adjust_oblique = new PVector(random(1.0), random(1.0));

  controlP5.getController("adjust_saturation").setValue(adjust_saturation);
  controlP5.getController("adjust_temperature").setValue(adjust_temperature);
  controlP5.getController("adjust_tint").setValue(adjust_tint);
  controlP5.getController("adjust_hue").setValue(adjust_hue);
  ((Toggle)controlP5.getController("adjust_invert")).setValue(adjust_invert);
  controlP5.getController("adjust_oblique").setArrayValue(new float[] {adjust_oblique.x, adjust_oblique.y});
}

void saveFile() {
  long d = System.currentTimeMillis();
  PImage img = chain.display();
  img.save("output/oblique" + d + ".png");
}
