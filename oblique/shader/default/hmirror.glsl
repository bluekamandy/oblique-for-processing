/**
 *
 * h mirror shader
 *
 * by masood
 *
 * last updated: 3/10/21
 *
 */

#define M_PI 3.1415926535897932384626433832795


// Processing Defaults
//varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
//uniform vec2 resolution;
uniform vec2 parameter;
uniform float time;

highp float map(highp float value, highp float low1, highp float high1, highp float low2, highp float high2) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}

void main() {
    
    highp float adjustedParameter = map(parameter.x, 0.0, 1.0, 5.0, 0.0);
//    highp vec2 normCoord = vec2((1. - 2.*abs(1./2. - fract(1./2.*vertTexCoord.x + 1./4.))), vertTexCoord.y);
//    highp vec2 normCoord = vec2(1. - abs(0.5 - vertTexCoord.x), vertTexCoord.y);
    
    highp vec2 normCoord = vec2(1. - 1./M_PI*acos(cos(adjustedParameter*M_PI*vertTexCoord.x)), vertTexCoord.y);
    
    
    highp vec4 textureColor = texture2D(srcTex, normCoord);
    
    gl_FragColor = vec4(textureColor.rgb, textureColor.a);
}

