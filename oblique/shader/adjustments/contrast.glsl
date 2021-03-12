/**
 *
 * contrast
 *
 * by masood
 *
 * last updated: 2/22/21
 *
 */

// Processing Defaults
//varying vec4 vertColor;
varying vec4 vertTexCoord;

// Custom
uniform sampler2D srcTex;
//uniform vec2 resolution;
uniform float contrast;
uniform float time;


void main()
{
    lowp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
    
    gl_FragColor = vec4(((textureColor.rgb - vec3(0.5)) * contrast + vec3(0.5)), textureColor.a);
}
