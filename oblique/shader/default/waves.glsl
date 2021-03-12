/**
 *
 * waves shader
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

void main()
{
   	lowp vec2 uv = vertTexCoord.xy;
    
    uv.y += (cos((uv.y + (time * 0.04)) * 45.0) * parameter.y/2.0) +
    (cos((uv.y + (time * 0.1)) * 10.0) * 0.01);
    
    uv.x += (sin((uv.y + (time * 0.07)) * 15.0) * parameter.x/2.0) +
    (sin((uv.y + (time * 0.1)) * 15.0) * 0.01);
    
    
    lowp vec4 texColor = texture2D(srcTex, fract(uv));
    gl_FragColor = texColor;
    
 
}


