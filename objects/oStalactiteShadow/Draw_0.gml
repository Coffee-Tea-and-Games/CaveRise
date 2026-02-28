draw_set_color(c_black);
draw_set_alpha(0.35 + sin(current_time*0.015)*0.2);
draw_ellipse(x-18, y-5, x+18, y+5, false);
draw_set_alpha(1);