var gw = display_get_gui_width();
var gh = display_get_gui_height();
draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(gw/2, 10, "WAVE " + string(wave));
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(60,0,0));
draw_rectangle(16, 40, 216, 56, false);
draw_set_color(c_lime);
draw_rectangle(16, 40, 16 + 200*(hp/max_hp), 56, false);
draw_set_color(c_white);
draw_set_font(fnt_small);
draw_text(16, 58, "HP: " + string(hp) + "/" + string(max_hp));
var bw = 250;
var bx = gw/2 - bw/2;

var sname;
if (game_won = true) {
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);
    draw_set_font(fnt_title);
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    draw_text(gw/2, gh/2-50, "VICTORY!");
    draw_set_font(fnt_main);
    draw_set_color(c_white);
    draw_text(gw/2, gh/2+10, "The Blood Goddess is defeated!");
    draw_set_font(fnt_small);
    draw_set_color(make_color_rgb(160,160,160));
    draw_text(gw/2, gh/2+44, "ENTER to Title");
}