/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_courier);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(10,10,"Shenbot Makes presents...");

draw_set_halign(fa_right);
draw_text(1014,10,"Music by Allen & Bright - ''Constellations''");

draw_set_halign(fa_center);
draw_text(room_width/2,520,"ASCEND. DETONATE. BLOOM.");

if (_textX < 1100)
{
	_textX += 2;
} else {
	_textX = -300;
}

draw_set_halign(fa_left);
draw_text(_textX,680,"Press Any Key to Begin!");