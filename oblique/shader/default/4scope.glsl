/**
 *
 * 4 Scope
 *
 * by masood
 *
 * last updated: 3/11/21
 *
 */

// Processing Defaults
//varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
//uniform vec2 resolution;
uniform vec2 parameter;
uniform float time;

void main() {
    highp vec2 normCoord = vec2((1. - 2.*abs(1./2. - fract(1./2.*vertTexCoord.x + 1./4.))), (1. - 2.*abs(1./2. - fract(1./2.*vertTexCoord.y + 1./4.))));
    
    highp vec4 textureColor = texture2D(srcTex, normCoord);
    
    gl_FragColor = vec4(textureColor.rgb, textureColor.a);

}
