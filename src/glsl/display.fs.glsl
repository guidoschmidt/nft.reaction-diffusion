precision highp float;

uniform int uFrame;
uniform float uTime;
uniform vec2 uResolution;
uniform sampler2D uTexture;

varying vec2 vUv;

void main() {
  vec2 uv = gl_FragCoord.xy / uResolution.xy;

  vec3 diffusionState = texture2D(uTexture, uv).rgb;
  vec3 color_fg = vec3(1.0);
  vec3 color_bg = vec3(0.0);
  vec3 color = mix(color_fg, color_bg, smoothstep(0.1, 0.5, diffusionState.r));

  gl_FragColor = vec4(color, 1.0);
}
