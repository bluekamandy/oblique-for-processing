class ShaderChain {

  PImage image;

  PGraphics context;

  ShaderPackage[] shaderPacks;

  ShaderChain(PImage image, PGraphics context, ShaderPackage[] shaderPacks) {
    this.image = image.get();
    this.context = context;
    this.shaderPacks = shaderPacks;
  }

  PGraphics display() {
    context.noStroke();
    context.beginDraw();
    context.image(image, 0, 0);
    context.endDraw();

    for (int i = 0; i < shaderPacks.length; i++) {
      shaderPacks[i].shaderPass.noStroke();
      shaderPacks[i].shaderPass.beginDraw();
      shaderPacks[i].shaderPass.shader(shaderPacks[i].shader);

      // Determining Type:
      // https://stackoverflow.com/questions/12361492/how-to-determine-the-primitive-type-of-a-primitive-variable
      String type = ((Object)shaderPacks[i].uniform).getClass().getName();
      //println(type);

      if (type == "java.lang.Float") {
        shaderPacks[i].shader.set(shaderPacks[i].uniformName, (float)shaderPacks[i].uniform);
        //println("Setting: " + shaderPacks[i].uniformName + " to a float");
      } else if (type == "java.lang.Boolean") {
        shaderPacks[i].shader.set(shaderPacks[i].uniformName, (boolean)shaderPacks[i].uniform);
        //println("Setting: " + shaderPacks[i].uniformName + " to a boolean");
      } else if (type == "processing.core.PVector") {
        shaderPacks[i].shader.set(shaderPacks[i].uniformName, ((PVector)shaderPacks[i].uniform).x, ((PVector)shaderPacks[i].uniform).y);
      }
      
      // add time uniform
      shaderPacks[i].shader.set("time", time);

      if (i == 0) {
        shaderPacks[i].shader.set("srcTex", context);
      } else {
        shaderPacks[i].shader.set("srcTex", shaderPacks[i - 1].shaderPass);
      }

      shaderPacks[i].shaderPass.rect(0, 0, shaderPacks[i].shaderPass.width, shaderPacks[i].shaderPass.height);
      shaderPacks[i].shaderPass.endDraw();
    }
    return shaderPacks[shaderPacks.length - 1].shaderPass;
  }
  
  void resetShaders(){
    for (int i = 0; i < shaderPacks.length; i++){
      shaderPacks[i].shaderPass.resetShader();
    }
  }
  
  void newImage(PImage image){
    this.image = image.get();
    resetShaders();
  }
  
  void changeObliqueFilter(ShaderPackage shader_pack){
    shaderPacks[shaderPacks.length-1] = shader_pack;
    
  }
}
