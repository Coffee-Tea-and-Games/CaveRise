draw_set_color((flash_t > 0) ? c_red : make_color_rgb(80,160,60));
draw_circle(x, y, 12, false);
draw_set_color(c_black);
draw_circle(x-4, y-3, 3, false);
draw_circle(x+4, y-3, 3, false);
draw_set_color(c_white);