shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap, repeat_disable;
uniform float lod : hint_range(0.0, 8.0) = 3.0;
uniform float fog_strength : hint_range(0.0, 1.0) = 0.25;

void fragment() {
	
	vec3 color = texture(screen_texture, SCREEN_UV, lod).rgb;

	
	vec3 fog_color = vec3(0.2, 0.2, 0.35);
	COLOR = vec4(mix(color, fog_color, fog_strength), 1.0);
}