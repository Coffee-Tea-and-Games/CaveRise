lifetime--;
float_t += 4;
y = y_base + sin(degtorad(float_t)) * 4;
vy = lerp(vy, 0, 0.07);
y_base += vy;
if (lifetime <= 0) { instance_destroy(); exit; }
if (instance_exists(oCannonBase)) {
    if (point_distance(x, y_base, oCannonBase.x, oCannonBase.y) < 50) {
        oGC.xp += xp_val;
        instance_destroy();
    }
}