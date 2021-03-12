/**
 *
 * rainbow shader
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

// Directionality of touch SOURCE: https://www.shadertoy.com/view/XltGWS

highp float map(highp float value, highp float low1, highp float high1, highp float low2, highp float high2) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}

void main()
{
    
    highp vec4 textureColor = texture2D(srcTex, vertTexCoord.xy);
        
    highp float distFromCenter = distance(vec2(.5, .5), parameter);
    
    int numOfSteps = int(ceil(map(distFromCenter, 0., .5, 1., 20.)));
    
    highp float xAmount = (0.25 - parameter.x * 0.5) / 10.;
    highp float yAmount = (0.25 - parameter.y * 0.5) / 10.;;
    
    highp float r = 0.0;
    highp float pass = 0.0;
    
    for (int i = 0; i < numOfSteps; i++) {
        r += texture2D(srcTex, vec2(vertTexCoord.x + pass*xAmount, vertTexCoord.y + pass*yAmount)).r;
        pass += 1.0;
    }
    r /= pass;
    
    highp float g = 0.0;
    pass = 0.0;
    
    for (int i = 0; i < numOfSteps; i++) {
        g += texture2D(srcTex, vec2(vertTexCoord.x, vertTexCoord.y)).g;
        pass += 1.0;
    }
    g /= pass;
    
    highp float b = 0.0;
    pass = 0.0;
    
    for (int i = 0; i < numOfSteps; i++) {
        b += texture2D(srcTex, vec2(vertTexCoord.x - pass*xAmount, vertTexCoord.y - pass*yAmount)).b;
        pass += 1.0;
    }
    b /= pass;
    
    gl_FragColor =  vec4(vec3(r,g,b), 1.0);
    
}

