draw_set_color(make_color_rgb(20,14,10));
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(make_color_rgb(50,36,26));
draw_rectangle(0, 0, wall_left, room_height, false);
draw_rectangle(wall_right, 0, room_width, room_height, false);
draw_set_color(make_color_rgb(85,62,44));
draw_rectangle(wall_left - 4, 0, wall_left, room_height, false);
draw_rectangle(wall_right, 0, wall_right + 4, room_height, false);
draw_set_color(make_color_rgb(180,30,30));
draw_set_alpha(0.25);
draw_rectangle(wall_left, 690, wall_right, room_height, false);
draw_set_alpha(1);
if (inv_timer > 0) {
    draw_set_alpha(0.35 * (inv_timer / 80));
    draw_set_color(c_red);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}