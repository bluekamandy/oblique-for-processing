/**
 *
 * overmirror
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

void main()
{
    lowp vec4 base = texture2D(srcTex, vertTexCoord.xy);
    lowp vec4 overlayer = texture2D(srcTex, vertTexCoord.xy*mat2(-1.,0.,0.,1.)+vec2(1.,0.));
    
    gl_FragColor = vec4(min(overlayer.rgb * base.a, base.rgb * overlayer.a) + overlayer.rgb * (1.0 - base.a) + base.rgb * (1.0 - overlayer.a), 1.0);
}
