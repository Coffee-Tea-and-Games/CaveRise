var gc = oGC;
if (gc.game_over || gc.game_won) exit;
zigzag++;
if (zigzag mod 28 == 0) zigzag_dir = -zigzag_dir;
y += spd;
x += zigzag_dir * 2.8;
x = clamp(x, 365, 979);
if (y > 700) {
    if (gc.inv_timer <= 0) {
        gc.hp -= bdmg;
        gc.inv_timer = 80;
        gc.shake = 8;
        if (gc.hp <= 0) gc.game_over = true;
    }
    instance_destroy(); exit;
}
if (hp <= 0) { instance_destroy(); exit; }
if (flash_t > 0) { flash_t--; image_blend = c_red; } else { image_blend = c_white; }