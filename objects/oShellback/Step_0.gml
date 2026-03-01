var gc = oGC;
if (gc.game_over || gc.game_won) exit;
y += spd;
if (y > 700) {
    if (gc.inv_timer <= 0) {
        gc.hp -= bdmg;
        gc.inv_timer = 80;
        gc.shake = 12;
        if (gc.hp <= 0) gc.game_over = true;
    }
    instance_destroy(); exit;
}
if (hp <= 0) {
    gc.score += score_val;
    gc.xp += xp_val;
    instance_destroy(); exit;
}
if (flash_t > 0) { flash_t--; image_blend = c_red; } else { image_blend = c_white; }
x = clamp(x, 365, 979);