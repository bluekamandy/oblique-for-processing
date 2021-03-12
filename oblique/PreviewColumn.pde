class PreviewColumn {

  int columnHeight;
  Preview[] previews;
  int yOffset = 0;

  PreviewColumn(Preview[] previews) {

    this.previews = previews;
  }

  void display() {
    for (int i = 0; i < previews.length; i++) {
      push();
      translate(0,yOffset);
      previews[i].yOffset = -yOffset;
      image(previews[i].display(), previews[i].x, i*300);
      pop();
    }
    columnHeight = previews.length*300;
  }
  
  void turnOffHighlights(){
    for (int i = 0; i < previews.length; i++){
      previews[i].highlight=false;
    }
  }
}
