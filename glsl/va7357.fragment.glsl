#ifdef GL_ES
precision mediump float;
#endif

// modified by @hintz

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

#define PI 3.14159
#define TWO_PI (PI*2.0)
#define N 6.0

void main(void) 
{
	vec2 center = (gl_FragCoord.xy)/100.;
	center.x=-100.12*sin(time/200.0);
	center.y=-100.12*cos(time/200.0);
	
	vec2 v = (gl_FragCoord.xy - resolution/50.0) / min(resolution.y,resolution.x) * 18.0;
	v.x=v.x-10.0;
	v.y=v.y-200.0;
	float col = 0.0;

	for(float i = 1.0; i < N; i++) 
	{
	  	float a = i * (TWO_PI/N) * 23.95;
		col += cos(TWO_PI*(v.y * cos(a) + v.x * sin(a) + mouse.y +i*mouse.x + sin(time*0.001)*1000.0 ));
	}
	
	col /= 12.0;

	gl_FragColor = vec4(col*0.4+0.3, col*0.4+0.3,col*0.4+0.3, 1.0);
}