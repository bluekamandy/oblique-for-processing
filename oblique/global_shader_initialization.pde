// --Shader-Pipeline--
PShader brightness_shader;
PShader contrast_shader;
PShader saturation_shader;
PShader temperature_shader;
PShader tint_shader;
PShader hue_shader;
PShader invert_shader;
PShader oblique_shader;

// --Shader-Passes--
PGraphics brightness_pass;
PGraphics contrast_pass;
PGraphics saturation_pass;
PGraphics temperature_pass;
PGraphics tint_pass;
PGraphics hue_pass;
PGraphics invert_pass;
PGraphics oblique_pass;

// --Shader-Uniforms--
float adjust_brightness = 0.0;
float adjust_contrast = 1.0;
float adjust_saturation = 1.0;
float adjust_temperature = 0.0;
float adjust_tint = 0.0;
float adjust_hue = 0.0;
boolean adjust_invert = false;
boolean adjust_time = true;
PVector adjust_oblique = new PVector(0.5,0.5);

// --Shader-Packages
ShaderPackage brightness_pack;
ShaderPackage contrast_pack;
ShaderPackage saturation_pack;
ShaderPackage temperature_pack;
ShaderPackage tint_pack;
ShaderPackage hue_pack;
ShaderPackage invert_pack;
ShaderPackage oblique_pack;

// --All-Shaders--
PShader blank_shader;
PShader grid_shader;
PShader stretch_shader;
PShader shear_shader;
PShader waves_shader;
PShader tunnel_shader;
PShader polar_shader;
PShader foursplit_shader;
PShader rainbow_shader;
PShader colorcompress_shader;
PShader rgbseparation_shader;
PShader rgbhard_shader;
PShader clampmode0_shader;
PShader clampmode1_shader;
PShader clampmode2_shader;
PShader clampmode3_shader;
PShader clampmode4_shader;
PShader clampmode5_shader;
PShader colorcycle_shader;
PShader noise_shader;
PShader noisewarp_shader;
PShader hmirror_shader;
PShader vmirror_shader;
PShader fourscope_shader;
PShader overmirror_shader;

// --Preview-passes--
PGraphics blank_pass;
PGraphics grid_pass;
PGraphics stretch_pass;
PGraphics shear_pass;
PGraphics waves_pass;
PGraphics tunnel_pass;
PGraphics polar_pass;
PGraphics foursplit_pass;
PGraphics rainbow_pass;
PGraphics colorcompress_pass;
PGraphics rgbseparation_pass;
PGraphics rgbhard_pass;
PGraphics clampmode0_pass;
PGraphics clampmode1_pass;
PGraphics clampmode2_pass;
PGraphics clampmode3_pass;
PGraphics clampmode4_pass;
PGraphics clampmode5_pass;
PGraphics colorcycle_pass;
PGraphics noise_pass;
PGraphics noisewarp_pass;
PGraphics hmirror_pass;
PGraphics vmirror_pass;
PGraphics fourscope_pass;
PGraphics overmirror_pass;
