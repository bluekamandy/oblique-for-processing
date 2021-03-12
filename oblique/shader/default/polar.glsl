/**
 *
 * polar shader
 *
 * by masood
 *
 * last updated: 3/11/21
 *
 */

#define M_PI 3.1415926535897932384626433832795
#define M_TAU 6.2831853071795864769252867665590

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

void main()
{
    highp vec2 normCoord = vertTexCoord.xy - vec2(.5);
    highp vec2 normCenter = 2.0 * vec2(.5) - 1.0;
    
    normCoord -= normCenter;
    
    highp float radius = length(normCoord);
    highp float angle = -atan(normCoord.y, normCoord.x);
    mediump vec2 textureCoordinateToUse = normCoord + 0.5;
    
//    highp vec4 color = texture2D(srcTex, vec2(radius, fract(angle / map(parameter.x, 0.0, 1.0, 10.0, 0.0)/M_PI)));
    
    highp vec4 color = texture2D(srcTex, vec2(radius, parameter.x));
    
    gl_FragColor = vec4(color.rgb, 1.0);
    
}
