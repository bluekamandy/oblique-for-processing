/**
 *
 * invert
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
uniform float time;

varying highp vec2 textureCoordinate;

uniform sampler2D inputImageTexture;
uniform bool invert;


void main()
{
    lowp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
    
    if (invert) {
        gl_FragColor = vec4(vec3(1.0 - textureColor.rgb), textureColor.a);
    } else {
        gl_FragColor = vec4(vec3(textureColor.rgb), textureColor.a);
    }
}

