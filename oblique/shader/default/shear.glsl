/**
 *
 * shear
 *
 * by masood
 *
 * last updated: 3/1/21
 *
 */

// Processing Defaults
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
uniform vec2 parameter;
uniform float time;

void main()
{
    
    highp vec2 shiftedCoordinates = vertTexCoord.xy /* * 2.0 - 1.0*/;
    
    lowp mat2 shear = mat2(
                      1.0, parameter.x*5.0,
                           parameter.y*5.0, 1.0
                      );
    
    lowp vec4 textureColor = texture2D(srcTex, fract(shiftedCoordinates*shear));
    
    gl_FragColor = vec4(textureColor.rgb, textureColor.a);
}

