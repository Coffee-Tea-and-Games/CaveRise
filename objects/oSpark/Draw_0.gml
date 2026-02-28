var t = timer/10;
draw_set_alpha(t);
for (var i = 0; i < 6; i++) {
    var ang = i*60 + (10-timer)*25;
    var len = (10-timer)*4;
    draw_set_color(merge_color(c_red, c_yellow, t));
    draw_line(x, y, x+lengthdir_x(len,ang), y+lengthdir_y(len,ang));
}
draw_set_alpha(1);
draw_set_color(c_white);