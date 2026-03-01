if (keyboard_check(vk_left) || keyboard_check(ord("A"))) x -= spd;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) x += spd;
x = clamp(x, 365, 979);