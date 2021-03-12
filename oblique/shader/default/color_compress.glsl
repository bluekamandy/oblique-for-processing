/**
 *
 * color compress shader
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

highp float map(highp float value, highp float low1, highp float high1, highp float low2, highp float high2) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}


void main()
{
    highp float remappedX = map(parameter.x, 0., 1., 1., 4.0);
    highp float remappedY = map(parameter.y, 0., 1., 1., 4.0);
    
    highp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
    
    highp float redTextureColor = texture2D(srcTex, vertTexCoord.xy).r;
    highp float redModulus = fract(redTextureColor * remappedX);
    
    highp float greenTextureColor = texture2D(srcTex, vertTexCoord.xy).g;
    highp float greenModulus = fract(greenTextureColor * remappedX);
    
    highp float blueTextureColor = texture2D(srcTex, vertTexCoord.xy).b;
    highp float blueModulus = fract(blueTextureColor * remappedX);
       
    gl_FragColor = vec4(vec3(redModulus, greenModulus, blueModulus), textureColor.a);
}

