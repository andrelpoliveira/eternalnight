/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
var  rectx2_vida = ((vida_max/10)*vida_atual)

if(mostra_estado){
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(x,y - sprite_height*1.2,estado)
	
	draw_set_color(c_red)
	draw_rectangle(x-5,y - sprite_height*1.8,x+5,(y - sprite_height*1.8)+8,false)
	
	draw_set_color(c_green)
	draw_rectangle(x-5,y - sprite_height*1.8,(x-5)+rectx2_vida,(y - sprite_height*1.8)+8,false)
	draw_set_valign(-1);
	draw_set_halign(-1);
}