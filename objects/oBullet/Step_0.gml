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

var _hit = noone;
var _score = 0;
var _xp = 0;

with (oCrawler) {
    if (point_distance(x, y, other.x, other.y) < 20) {
        other.hp -= bdmg;
        if (other.hp <= 0) { _hit = id; _score = 10; _xp = 2; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}

_hit = noone;
with (oSkitterer) {
    if (point_distance(x, y, other.x, other.y) < 15) {
        other.hp -= bdmg;
        if (other.hp <= 0) { _hit = id; _score = 8; _xp = 2; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}

_hit = noone;
with (oShellback) {
    if (point_distance(x, y, other.x, other.y) < 22) {
        other.hp -= bdmg;
        if (other.hp <= 0) { _hit = id; _score = 25; _xp = 3; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}

_hit = noone;
with (oWebSpinner) {
    if (point_distance(x, y, other.x, other.y) < 18) {
        other.hp -= bdmg;
        if (other.hp <= 0) { _hit = id; _score = 15; _xp = 2; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}

_hit = noone;
with (oBurrower) {
    if (other.emerged && point_distance(x, y, other.x, other.y) < 18) {
        other.hp -= bdmg;
        if (other.hp <= 0) { _hit = id; _score = 20; _xp = 2; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}

_hit = noone;
with (oBoss) {
    if (point_distance(x, y, other.weakpoint_x, other.weakpoint_y) < 22) {
        other.hp -= bdmg;
        oGC.shake = 5;
        if (other.hp <= 0) { _hit = id; _score = 500; _xp = 50; oGC.boss_alive = false; }
        else { _hit = -1; }
        break;
    }
}
if (_hit == -1) { instance_destroy(); exit; }
if (_hit != noone) {
    instance_destroy(_hit);
    oGC.score += _score;
    oGC.xp += _xp;
    instance_destroy();
    exit;
}