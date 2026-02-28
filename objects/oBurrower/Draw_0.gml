if (!emerged) {
    draw_set_alpha(1 - emerge_timer/60);
    draw_set_color(make_color_rgb(120,80,40));
    draw_circle(x, y, 8, false);
    draw_set_alpha(1);
} else {
    draw_set_color((flash_t>0) ? c_red : make_color_rgb(160,90,40));
    draw_circle(x, y, 14, false);
    draw_set_color(c_black);
    draw_circle(x-4, y-4, 3, false);
    draw_circle(x+4, y-4, 3, false);
    draw_set_color(c_white);
}