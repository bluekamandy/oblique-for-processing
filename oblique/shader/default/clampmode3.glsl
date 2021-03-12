/**
 *
 * clamp mode 3 shader
 *
 * by masood
 *
 * last updated: 3/10/21
 *
 * original by Adam Ferris:
 * https://www.shadertoy.com/view/MtyXRc
 *
 */

#define mode 3

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
    highp vec4 t;
    
#if mode == 0
        //vertical stripes meet in the middle
        t = texture2D(srcTex, vec2(vertTexCoord.x, mod(clamp(vertTexCoord.y, 1.0 - parameter.y, parameter.y) + parameter.x, 1.0)));
#endif
    
#if mode == 1
        //horizontal stripes meet in the middle
        t = texture2D(srcTex, vec2(mod(clamp(vertTexCoord.x, 1.0 - parameter.x, parameter.x)+parameter.y, 1.0), vertTexCoord.y));
#endif
    
#if mode == 2
        //top down curtain
        t = texture2D(srcTex, vec2(vertTexCoord.x, clamp(vertTexCoord.y, parameter.y, 1.0 )));
#endif
    
#if mode == 3
        //left right curtain
        t = texture2D(srcTex, vec2(clamp(vertTexCoord.x, 0.0, parameter.x), vertTexCoord.y));
#endif
    
#if mode == 4
        //horizontal halfsies
        t = texture2D(srcTex, vec2(clamp(vertTexCoord.x, parameter.x - 0.001, parameter.x), mod(vertTexCoord.y + parameter.y, 1.0)));
#endif
    
#if mode == 5
        //vertical stripes
        t = texture2D(srcTex, vec2(mod(vertTexCoord.x + parameter.x, 1.0), clamp(vertTexCoord.y, 0.0, 0.001) + parameter.y));
#endif
    
    gl_FragColor = t;
}
