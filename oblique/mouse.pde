void mousePressed() {
  for (int i = 0; i < previewColumn.previews.length; i++) {
    previewColumn.previews[i].onClick();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  //println("e = " + e);

  if (previewColumn.columnHeight > height) {
    // scrolling up
    if (e > 0 && abs(previewColumn.yOffset) + height < previewColumn.columnHeight) {

      previewColumn.yOffset -= min(e, previewColumn.columnHeight - abs(previewColumn.yOffset) - height);

      for (int i = 0; i < previewColumn.previews.length; i++) {
        previewColumn.previews[i].yOffset += e;
      }

      // scrolling down
    } else if ( e < 0 && previewColumn.yOffset < 0) {
      previewColumn.yOffset -= max(e, previewColumn.yOffset);

    }
  }

  //println("offset = " + previewColumn.yOffset);
}
