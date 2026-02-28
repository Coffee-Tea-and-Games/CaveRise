if (game_over || game_won) {
    end_timer++;
    if (end_timer > 180 && keyboard_check_pressed(vk_enter)) room_goto(rm_title);
    exit;
}
if (inv_timer > 0) inv_timer--;
if (shake > 0) {
    shake--;
    view_xview[0] = random_range(-shake, shake);
    view_yview[0] = random_range(-shake, shake);
} else {
    view_xview[0] = 0;
    view_yview[0] = 0;
}
spawn_timer++;
if (spawn_timer >= spawn_delay && spawned < enemies_to_spawn) {
    spawn_timer = 0;
    spawned++;
    var ex = random_range(wall_left + 20, wall_right - 20);
    var roll = irandom(100);
    if (wave <= 2) {
        instance_create_layer(ex, spawn_y, "Enemies", oCrawler);
    } else if (wave <= 4) {
        if (roll < 60) instance_create_layer(ex, spawn_y, "Enemies", oCrawler);
        else instance_create_layer(ex, spawn_y, "Enemies", oSkitterer);
    } else if (wave <= 7) {
        if (roll < 35) instance_create_layer(ex, spawn_y, "Enemies", oCrawler);
        else if (roll < 65) instance_create_layer(ex, spawn_y, "Enemies", oSkitterer);
        else if (roll < 82) instance_create_layer(ex, spawn_y, "Enemies", oShellback);
        else instance_create_layer(ex, spawn_y, "Enemies", oWebSpinner);
    } else {
        if (roll < 25) instance_create_layer(ex, spawn_y, "Enemies", oCrawler);
        else if (roll < 48) instance_create_layer(ex, spawn_y, "Enemies", oSkitterer);
        else if (roll < 64) instance_create_layer(ex, spawn_y, "Enemies", oShellback);
        else if (roll < 78) instance_create_layer(ex, spawn_y, "Enemies", oWebSpinner);
        else instance_create_layer(ex, spawn_y, "Enemies", oBurrower);
    }
}
var alive = instance_number(oCrawler) + instance_number(oSkitterer) + instance_number(oShellback) + instance_number(oWebSpinner) + instance_number(oBurrower);
if (spawned >= enemies_to_spawn && alive == 0 && !boss_alive) {
    wave++;
    spawned = 0;
    enemies_to_spawn = 5 + wave * 2;
    spawn_delay = max(25, 80 - wave * 5);
    hp = min(max_hp, hp + 10);
    if (wave mod 5 == 0) {
        instance_create_layer(683, spawn_y, "Enemies", oBoss);
        boss_alive = true;
    }
    shake = 8;
}
if (xp >= xp_next) {
    xp -= xp_next;
    plr_level++;
    xp_next = 100 + plr_level * 50;
    if (plr_level == 3) shot_unlocked[1] = true;
    if (plr_level == 6) shot_unlocked[2] = true;
}
if (score >= 5000) game_won = true;
if (hp <= 0 && !game_over) { game_over = true; shake = 20; }
cat_in_web = false;