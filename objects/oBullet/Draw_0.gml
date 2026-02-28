var r;
if (btype == 2) { r = 7; } else if (btype == 3) { r = 4; } else { r = 5; }
var col;
if (btype == 2) { col = make_color_rgb(255,100,20); } else if (btype == 3) { col = c_white; } else { col = c_yellow; }
draw_set_color(col);
draw_circle(x, y, r, false);
draw_set_color(c_white);