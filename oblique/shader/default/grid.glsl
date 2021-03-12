/**
 *
 * grid shader
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

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

// YUV to RGB matrix
mat3 yuv2rgb = mat3(1.0, 0.0, 1.13983,
                    1.0, -0.39465, -0.58060,
                    1.0, 2.03211, 0.0);

// RGB to YUV matrix
mat3 rgb2yuv = mat3(0.2126, 0.7152, 0.0722,
                    -0.09991, -0.33609, 0.43600,
                    0.615, -0.5586, -0.05639);


void main()
{
    vec2 textureCoordinateToUse = vertTexCoord.xy;
    
    vec3 color = vec3(0.0);
    
    // Scale up the space. Ceil keeps the number of views on screen whole (changed from floor).
    if (parameter.x > 0.0) {
        textureCoordinateToUse *= ceil(parameter.x*20.0);
    }
    
    textureCoordinateToUse = fract(textureCoordinateToUse); // Wrap arround 1.0
    
    // Get RGB values from the camera. Store them in 'textureColor.'
    lowp vec4 textureColor = texture2D(srcTex, textureCoordinateToUse);
    
    color = vec3(textureColor.r,textureColor.g,textureColor.b);
    
    gl_FragColor = vec4(vec3(color), 1.0);
}
