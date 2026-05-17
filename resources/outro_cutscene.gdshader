shader_type canvas_item;

uniform float fade : hint_range(0.0, 1.0, 0.05) = 0.0;

void fragment() {
	vec2 center = vec2(0.5, 0.5);
	float dist = length(UV - center);
	float progress = step(dist, fade);
	COLOR.a *= progress; 
}
