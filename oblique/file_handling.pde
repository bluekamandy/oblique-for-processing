// --File-Handling--

void getFile() {
  selectInput("Select a file to process:", "processImage");
}

void processImage(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    if (selection.getName().endsWith(".png")
    || selection.getName().endsWith(".PNG")
      || selection.getName().endsWith(".jpg")
      || selection.getName().endsWith(".JPG")
      || selection.getName().endsWith(".jpeg")
      || selection.getName().endsWith(".JPEG")
      || selection.getName().endsWith(".tga")
      || selection.getName().endsWith(".TGA")) {
      imagePath = selection.getAbsolutePath(); // Store it in the global image path.
      PImage newImage = loadImage(imagePath);
      previewImage = resizeToFit(newImage);
      chain.newImage(previewImage);
      resetFilterChain();
    } else {
      showMessageDialog(null, "This is not an image file. Oblique supports png, jpg, jpeg, tif, tiff, and tga extensions.",
        "Alert", ERROR_MESSAGE);
    }
  }
}

void storeFilePath(File selection) {

  // A way to get back to the original high resolution file.
}

PImage resizeToFit(PImage img) {
  if (img.width < imageView.width && img.height < imageView.height) {
    return img;
  } else {

    // Using proportions is much easier than comparing width and height.
    float displayProportion = (float)imageView.width / (float)imageView.height;
    float imageProportion = (float)img.width / (float)img.height;

    if (displayProportion >= imageProportion) {
      img.resize(0, imageView.height);
    } else if (displayProportion < imageProportion) {
      img.resize(imageView.width, 0);
    }
    return img;
  }
}

void resetFilterChain() {
  resetAdjustments();
  setupGraphicsPipeline();
}
