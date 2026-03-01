var gc = oGC;
if (gc.game_over || gc.game_won) exit;
y += spd;
x += dir_drift;
x = clamp(x, 365, 979);
if (y > 700) {
    gc.hp -= 10;
    gc.inv_timer = 80;
    gc.shake = 10;
    if (gc.hp <= 0) gc.game_over = true;
    instance_destroy(); exit;
}
if (hp <= 0) { instance_destroy(); exit; }
if (flash_t > 0) { flash_t--; image_blend = c_red; } else { image_blend = c_white; }
