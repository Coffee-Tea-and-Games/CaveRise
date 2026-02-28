if (!instance_exists(oGC)) exit;
var gc = oGC;
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

var _hit = noone;
var _score = 0;
var _xp = 0;

with (oCrawler) {
    if (point_distance(x, y, other.x, other.y) < 20) {

        hp -= other.bdmg;

        if (hp <= 0) {
            other._hit = id;
            other._score = 10;
            other._xp = 2;
        } else {
            other._hit = -1;
        }

        break;
    }
}


if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    gc.score += _score;
    gc.xp += _xp;
    instance_destroy();
    exit;
}
_hit = noone;
with (oSkitterer) {
    if (point_distance(x, y, other.x, other.y) < 15) {

        hp -= other.bdmg;

        if (hp <= 0) {
            other._hit = id;
            other._score = 8;
            other._xp = 2;
        } else {
            other._hit = -1;
        }

        break;
    }
}

_hit = noone;
with (oShellback) {
    if (point_distance(x, y, other.x, other.y) < 22) {

        hp -= other.bdmg;

        if (hp <= 0) {
            other._hit = id;
            other._score = 25;
            other._xp = 3;
        } else {
            other._hit = -1;
        }

        break;
    }
}

_hit = noone;
with (oWebSpinner) {
    if (point_distance(x, y, other.x, other.y) < 18) {

        hp -= other.bdmg;

        if (hp <= 0) {
            other._hit = id;
            other._score = 15;
            other._xp = 2;
        } else {
            other._hit = -1;
        }

        break;
    }
}

_hit = noone;
with (oBurrower) {
    if (emerged && point_distance(x, y, other.x, other.y) < 18) {

        hp -= other.bdmg;

        if (hp <= 0) {
            other._hit = id;
            other._score = 20;
            other._xp = 2;
        } else {
            other._hit = -1;
        }

        break;
    }
}

_hit = noone;
with (oBoss) {
    if (point_distance(x, y, weakpoint_x, weakpoint_y) < 22) {

        hp -= other.bdmg;
        other.gc.shake = 5;

        if (hp <= 0) {
            other._hit = id;
            other._score = 500;
            other._xp = 50;
            other.gc.boss_alive = false;
        } else {
            other._hit = -1;
        }

        break;
    }
}
