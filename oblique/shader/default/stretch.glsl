/**
 *
 * stretch shader
 *
 * by masood
 *
 * last updated: 3/10/21
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

void main()
{
    // Converts from range [0,1] to [-1,1]
    highp vec2 normCoord = 2.0 * vertTexCoord.xy - 1.0;
    highp vec2 normCenter = 2.0 * parameter - 1.0;
    
    normCoord -= normCenter;
    
    // sign returns -1.0 if x is less than 0.0, 0.0 if x is equal to 0.0, and +1.0 if x is greater than 0.0.
    mediump vec2 s = sign(normCoord);
    normCoord = abs(normCoord);
    normCoord = 0.5 * normCoord + 0.5 * smoothstep(0.25, 0.5, normCoord) * normCoord;
    normCoord = s * normCoord;
    
    normCoord += normCenter;
    
    mediump vec2 textureCoordinateToUse = normCoord / 2.0 + 0.5;
    
    
    gl_FragColor = texture2D(srcTex, textureCoordinateToUse );
}
