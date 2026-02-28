var spd = 4;

if (keyboard_check(vk_left))  x -= spd;
if (keyboard_check(vk_right)) x += spd;

x = clamp(x, room_width/2 - 300, room_width/2 + 300);