/**
 *
 * 4 split
 *
 * by masood
 *
 * last updated: 2/28/21
 *
 */

// Processing Defaults
varying vec4 vertTexCoord;
uniform mat4 texMatrix;

// Custom
uniform sampler2D srcTex;
uniform vec2 parameter;
uniform float time;

highp float map(highp float value, highp float low1, highp float high1, highp float low2, highp float high2) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}

void main()
{
    highp vec4 sample0, sample1, sample2, sample3;
    
    highp float distFromCenter = distance(vec2(.5, .5), parameter);
    
    sample0 = texture2D(srcTex, vec2(vertTexCoord.x - distFromCenter, vertTexCoord.y - distFromCenter));
    sample1 = texture2D(srcTex, vec2(vertTexCoord.x + distFromCenter, vertTexCoord.y + distFromCenter));
    sample2 = texture2D(srcTex, vec2(vertTexCoord.x + distFromCenter, vertTexCoord.y - distFromCenter));
    sample3 = texture2D(srcTex, vec2(vertTexCoord.x - distFromCenter, vertTexCoord.y + distFromCenter));
    
    lowp vec4 textureColor = texture2D(srcTex, fract(vertTexCoord.xy));
    
    gl_FragColor = vec4(((sample0 + sample1 + sample2 + sample3)/4.0));
}

