if (!instance_exists(oGC)) exit;
lifetime--;
if (lifetime <= 0) { instance_destroy(); exit; }

x += lengthdir_x(bspd, bdir);
y += lengthdir_y(bspd, bdir);

if (x <= 365 && bbounce > 0) {
    x = 367;
    bdir = 180 - bdir;
    bbounce--;
    bdmg = ceil(bdmg * 1.3);
    bmult += 0.3;
}
if (x >= 979 && bbounce > 0) {
    x = 977;
    bdir = 180 - bdir;
    bbounce--;
    bdmg = ceil(bdmg * 1.3);
    bmult += 0.3;
}

if (y < 0 || y > room_height) { instance_destroy(); exit; }

with (oCrawler) {
    if (!instance_exists(other)) break;
    if (point_distance(x, y, other.x, other.y) < 20) {
        other.hp -= other.bdmg;
        if (other.hp <= 0) {
            oGC.score += 10;
            oGC.xp += 2;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}
with (oSkitterer) {
    if (!instance_exists(other)) break;
    if (point_distance(x, y, other.x, other.y) < 15) {
        other.hp -= other.bdmg;
        if (other.hp <= 0) {
            oGC.score += 8;
            oGC.xp += 2;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}
with (oShellback) {
    if (!instance_exists(other)) break;
    if (point_distance(x, y, other.x, other.y) < 22) {
        other.hp -= other.bdmg;
        if (other.hp <= 0) {
            oGC.score += 25;
            oGC.xp += 3;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}
with (oWebSpinner) {
    if (!instance_exists(other)) break;
    if (point_distance(x, y, other.x, other.y) < 18) {
        other.hp -= other.bdmg;
        if (other.hp <= 0) {
            oGC.score += 15;
            oGC.xp += 2;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}
with (oBurrower) {
    if (!instance_exists(other)) break;
    if (other.emerged && point_distance(x, y, other.x, other.y) < 18) {
        other.hp -= other.bdmg;
        if (other.hp <= 0) {
            oGC.score += 20;
            oGC.xp += 2;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}
with (oBoss) {
    if (!instance_exists(other)) break;
    if (point_distance(x, y, other.weakpoint_x, other.weakpoint_y) < 22) {
        other.hp -= bdmg;
        oGC.shake = 5;
        if (other.hp <= 0) {
            oGC.boss_alive = false;
            oGC.score += 500;
            oGC.xp += 50;
            instance_destroy(other);
        }
        instance_destroy();
        exit;
    }
}