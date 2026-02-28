if (!falling) {
    warning--;
    if (warning <= 0) { falling = true; if (instance_exists(shad)) instance_destroy(shad); }
} else {
    fall_spd += fall_accel;
    y += fall_spd;
    if (y > 700) {
        if (point_distance(x, y, oCannonBase.x, oCannonBase.y) < 28) {
            var gc = oGC;
            if (gc.inv_timer <= 0) { gc.hp -= 10; gc.inv_timer = 80; gc.shake = 8; if (gc.hp<=0) gc.game_over = true; }
        }
        instance_create_layer(x, y, "Effects", oSpark);
        instance_destroy();
    }
}