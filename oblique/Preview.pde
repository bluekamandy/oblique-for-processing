class Preview {
  PFont open_sans;
  
  float x, y, yOffset;

  ShaderPackage shader_pack;
  String shaderName;
  PShader shader;
  PGraphics preview;
  PGraphics ui_overlay;
  PImage image;

  boolean highlight = false;

  color highlightColor = color(255, 255, 0);
  color hoverColor = color(255);

  Preview(float x, float y, ShaderPackage shader_pack, PImage image) {
    this.x = x;
    this.y = y;

    this.shader_pack = shader_pack;
    this.shaderName = shader_pack.shaderTitle;
    this.shader = shader_pack.shader;
    this.image = image.get();

    preview = createGraphics(300, 300, P2D);
    ui_overlay = createGraphics(300, 300, P2D);
    
    image = resizeImageForPreview(image);
    
    open_sans = createFont("OpenSans-Regular.ttf", 18);
    
    this.yOffset = 0;
  }

  PImage display() {

    preview.beginDraw();
    preview.shader(shader);
    shader.set("srcTex", image);
    preview.rect(0, 0, preview.width, preview.height);
    preview.endDraw();

    ui_overlay.beginDraw();
    ui_overlay.noFill();
    ui_overlay.image(preview, 0, 0);
    if (mouseHovers(mouseX, mouseY)) {
      ui_overlay.fill(0, 127);
      ui_overlay.noStroke();
      ui_overlay.rectMode(CENTER);
      ui_overlay.rect(150, 150, 260, 80); // width replace
      ui_overlay.fill(255);
      ui_overlay.textAlign(CENTER);
      ui_overlay.textFont(open_sans);
      ui_overlay.text(shaderName, 150, 150+6);
      ui_overlay.stroke(hoverColor);
      ui_overlay.noFill();
      ui_overlay.strokeWeight(10);
      ui_overlay.rectMode(CORNER);
      ui_overlay.rect(0,0,300,300);
    } else if (highlight) {
      ui_overlay.stroke(highlightColor);
      ui_overlay.strokeWeight(10);
      ui_overlay.rect(0,0,300,300);
    } else {
      ui_overlay.noStroke();
    }
    ui_overlay.endDraw();

    return ui_overlay;
  }

  void onClick() {
    if (mouseHovers(mouseX, mouseY)) {
      previewColumn.turnOffHighlights();
      highlight = true;
      chain.changeObliqueFilter(shader_pack);
    }
  }

  boolean mouseHovers(float tx, float ty) {
    ty = ty+yOffset;
    if (tx > x &&
      tx < x + 300 && // width
      ty > y &&
      ty < y + 300) { // height
      return true;
    } else {
      return false;
    }
  }

  PImage resizeImageForPreview(PImage img) {
    
    // Using proportions is much easier than comparing width and height.
    float displayProportion = (float)preview.width / (float)preview.height;
    float imageProportion = (float)img.width / (float)img.height;

    if (displayProportion >= imageProportion) {
      img.resize(0, preview.height);
    } else if (displayProportion < imageProportion) {
      img.resize(preview.width, 0);
    }
    return img.get(0, 0, preview.width, preview.height);
  }
}
