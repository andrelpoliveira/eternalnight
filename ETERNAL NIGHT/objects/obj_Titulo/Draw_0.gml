 

//draw_self()
draw_set_font(fonteTitulo);
draw_set_color(c_white);

var tamanho_texto = [string_width(titulo),string_height(titulo)];
draw_text(centro_tela[0]-(tamanho_texto[0]/2),centro_tela[1]-(tamanho_texto[1]/2),titulo);

draw_set_color(c_black);
draw_rectangle(0,fadey,display_get_width(),display_get_height(),false)

draw_set_font(-1);