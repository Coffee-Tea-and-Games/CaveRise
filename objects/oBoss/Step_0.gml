var gc = oGC;
if (gc.game_over || gc.game_won) exit;
phase_timer++;
y += spd;
x += dir_x * 1.2;
if (x < gc.wall_left+30 || x > gc.wall_right-30) dir_x = -dir_x;
if (phase_timer >= 180) {
    phase_timer = 0;
    for (var i = 0; i < 3; i++) {
        instance_create_layer(x + random_range(-150,150), 40, "Hazards", oStalactite);
    }
    gc.shake = 8;
}
weakpoint_x = x;
weakpoint_y = y + 10;
if (y > 700) {
    if (gc.inv_timer <= 0) { gc.hp -= 30; gc.inv_timer = 80; gc.shake = 20; if (gc.hp<=0) gc.game_over = true; }
    y = 40;
}
if (hp <= 0) {
    gc.boss_alive = false; gc.score += score_val; gc.xp += xp_val;
    for (var i = 0; i < 5; i++) {
        var o = instance_create_layer(x+random_range(-40,40), y+random_range(-40,40), "Pickups", oXpOrb);
        o.xp_val = 50;
    }
    instance_destroy(); exit;
}
if (flash_t > 0) { flash_t--; image_blend = c_red; } else { image_blend = c_white; }
x = clamp(x, 365, 979);