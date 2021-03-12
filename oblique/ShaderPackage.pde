class ShaderPackage<T> {

  PShader shader;
  PGraphics shaderPass;
  String shaderTitle;
  String uniformName;
  T uniform;

  public ShaderPackage(PShader shader, PGraphics shaderPass, String shaderTitle, String uniformName, T uniform) {
    this.shader = shader;
    this.shaderPass = shaderPass;
    this.shaderTitle = shaderTitle;
    this.uniformName = uniformName;
    this.uniform = uniform;
  }
}
