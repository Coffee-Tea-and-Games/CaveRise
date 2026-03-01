x = oCannonBase.x;
y = oCannonBase.y + 60;

if (keyboard_check(ord("C"))) tilt = clamp(tilt - 1.5, -70, 70);
if (keyboard_check(ord("Z"))) tilt = clamp(tilt + 1.5, -70, 70);

if (fire_cool > 0) fire_cool--;

if (keyboard_check(ord("X")) && fire_cool == 0) {
    fire_cool = 40;
    var aim = tilt + 90;
    var mx = x + lengthdir_x(60, aim);
    var my = y + lengthdir_y(60, aim);
    var b = instance_create_layer(mx, my, "Projectiles", oBullet);
    b.bdir = aim;
    b.bspd = 12;
    b.bdmg = 1;
    b.bbounce = 3;
    b.btype = 1;
}