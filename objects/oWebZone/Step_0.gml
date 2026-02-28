lifetime--;
if (lifetime <= 0 || hp <= 0) { instance_destroy(); exit; }
if (instance_exists(oCannonBase)) {
    if (point_distance(x, y, oCannonBase.x, oCannonBase.y) < web_r) oGC.cat_in_web = true;
}