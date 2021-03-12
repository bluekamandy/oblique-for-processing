/**
 *
 * color cycle
 *
 * by masood
 *
 * last updated: 3/1/21
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
    vec2 textureCoordinateToUse = vertTexCoord.xy;
    vec3 color = vec3(0.0);
    
    // Get RGB values from the camera. Store them in 'textureColor.'
    vec4 textureColor = texture2D(srcTex, textureCoordinateToUse);
    
    textureColor.r = fract(textureColor.r+parameter.x);

    textureColor.g = fract(textureColor.g+parameter.y);

    // This is weird.
    textureColor.b = fract(textureColor.b+parameter.x/parameter.y);
 
    color = vec3(textureColor.r,textureColor.g,textureColor.b);
    
    gl_FragColor = vec4(vec3(color), 1.0 );
}
