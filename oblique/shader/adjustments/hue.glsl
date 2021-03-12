/**
 *
 * hue
 *
 * by masood
 *
 * last updated: 2/23/21
 *
 */

precision highp float;
#define M_PI 3.1415926535897932384626433832795

// Processing Defaults
//varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
//uniform vec2 resolution;
uniform float time;

const highp  vec4  kRGBToYPrime = vec4 (0.299, 0.587, 0.114, 0.0);
const highp  vec4  kRGBToI     = vec4 (0.595716, -0.274453, -0.321263, 0.0);
const highp  vec4  kRGBToQ     = vec4 (0.211456, -0.522591, 0.31135, 0.0);

const highp  vec4  kYIQToR   = vec4 (1.0, 0.9563, 0.6210, 0.0);
const highp  vec4  kYIQToG   = vec4 (1.0, -0.2721, -0.6474, 0.0);
const highp  vec4  kYIQToB   = vec4 (1.0, -1.1070, 1.7046, 0.0);

uniform float hue;

void main ()
{
    // Sample the input pixel
    highp vec4 color   = texture2D(srcTex, vertTexCoord.xy);
    
    // Scale center.x to pi
    highp float hueScaled = hue * M_PI * 2.0;
    
    // Convert to YIQ
    highp float   YPrime  = dot (color, kRGBToYPrime);
    highp float   I      = dot (color, kRGBToI);
    highp float   Q      = dot (color, kRGBToQ);
    
    // Calculate the hue and chroma
    highp float   h     = atan (Q, I);
    highp float   chroma  = sqrt (I * I + Q * Q);
    
    // Make the user's adjustments
    h += (-hueScaled); //why negative rotation?
    
    // Convert back to YIQ
    Q = chroma * sin (h);
    I = chroma * cos (h);
    
    // Convert back to RGB
    highp vec4    yIQ   = vec4 (YPrime, I, Q, 0.0);
    color.r = dot (yIQ, kYIQToR);
    color.g = dot (yIQ, kYIQToG);
    color.b = dot (yIQ, kYIQToB);
    
    // Save the result
    gl_FragColor = color;
}
