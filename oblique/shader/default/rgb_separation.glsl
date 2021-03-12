/**
 *
 * rgb separation shader
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
    highp float remappedX = map(parameter.x, 0., 1., 0., .5);
    highp float remappedY = map(parameter.y, 0., 1., 0., .5);
    
    highp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
    
    highp float redTextureColor = texture2D(srcTex, vec2(vertTexCoord.x - remappedX, vertTexCoord.y - remappedY)).r;
    highp float greenTextureColor = texture2D(srcTex, vertTexCoord.xy).g;
    highp float blueTextureColor = texture2D(srcTex, vec2(vertTexCoord.x + remappedX, vertTexCoord.y + remappedY)).b;
    
    gl_FragColor = vec4(vec3(redTextureColor, greenTextureColor, blueTextureColor), textureColor.a);
}

