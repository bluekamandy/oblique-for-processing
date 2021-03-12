/**
 *
 * blank shader
 *
 * by masood
 *
 * last updated: 2/22/21
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
    lowp vec4 textureColor = texture2D(srcTex,vertTexCoord.xy);
    
    gl_FragColor = vec4(vec3(textureColor.rgb), textureColor.w);
}

