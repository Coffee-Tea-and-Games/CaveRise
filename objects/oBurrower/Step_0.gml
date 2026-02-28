var gc = oGC;
if (gc.game_over || gc.game_won) exit;
if (!emerged) {
    emerge_timer--;
    if (emerge_timer <= 0) { emerged = true; gc.shake = 5; }
} else {
    snap_timer++;
    if (snap_timer >= 70) {
        snap_timer = 0;
        if (point_distance(x, y, oCannonBase.x, oCannonBase.y) < 60) {
            if (gc.inv_timer <= 0) { gc.hp -= 12; gc.inv_timer = 80; gc.shake = 10; if (gc.hp<=0) gc.game_over = true; }
        }
    }
}
if (hp <= 0) { gc.score += score_val; gc.xp += xp_val; instance_create_layer(x,y,"Pickups",oXpOrb); instance_destroy(); exit; }
if (flash_t > 0) { flash_t--; image_blend = c_red; } else { image_blend = c_white; }