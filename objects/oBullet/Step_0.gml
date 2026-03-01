if (!instance_exists(oGC)) exit;
lifetime--;
if (lifetime <= 0) { instance_destroy(); exit; }
x += lengthdir_x(bspd, bdir);
y += lengthdir_y(bspd, bdir);
if (x <= 365 && bbounce > 0) {
    x = 367;
    bdir = 180 - bdir;
    bbounce--;
}
if (x >= 979 && bbounce > 0) {
    x = 977;
    bdir = 180 - bdir;
    bbounce--;
}
if (y < 0 || y > room_height) { instance_destroy(); exit; }
with (oCrawler) {
    if (distance_to_object(other) < 20) {
        instance_destroy(other);
        instance_destroy();
        exit;
    }
}
with (oSkitterer) {
    if (distance_to_object(other) < 15) {
        instance_destroy(other);
        instance_destroy();
        exit;
    }
}
with (oShellback) {
    if (distance_to_object(other) < 22) {
        instance_destroy(other);
        instance_destroy();
        exit;
    }
}
with (oWebSpinner) {
    if (distance_to_object(other) < 18) {
        instance_destroy(other);
        instance_destroy();
        exit;
    }
}
with (oBoss) {
    if (distance_to_object(other) < 30) {
        other.hp--;
        if (other.hp <= 0) {
            oGC.game_won = true;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}