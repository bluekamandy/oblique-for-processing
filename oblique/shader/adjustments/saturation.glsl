/**
 *
 * saturation
 *
 * by masood
 *
 * last updated: 2/23/21
 *
 */

// Processing Defaults
//varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
//uniform vec2 resolution;
uniform float saturation;
uniform float time;

// Values from "Graphics Shaders: Theory and Practice" by Bailey and Cunningham
const mediump vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);

void main()
{
    highp float saturationScaled = saturation;
    
    highp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
    highp float luminance = dot(textureColor.rgb, luminanceWeighting);
    highp vec3 greyScaleColor = vec3(luminance);
    
    gl_FragColor = vec4(mix(greyScaleColor, textureColor.rgb, saturationScaled), 1.0);
    
}

