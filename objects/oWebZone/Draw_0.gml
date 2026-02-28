var a = 0.45 + sin(current_time*0.005)*0.15;
draw_set_color(make_color_rgb(180,180,220));
draw_set_alpha(a);
draw_circle(x, y, web_r, false);
for (var i = 0; i < 8; i++) {
    var ang = i * 45;
    draw_line(x, y, x+lengthdir_x(web_r,ang), y+lengthdir_y(web_r,ang));
}
draw_set_alpha(1);
draw_set_color(c_white);