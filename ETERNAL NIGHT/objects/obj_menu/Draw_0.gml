
draw_set_font(fonteMenu)
pos_opcao_x1 = posInicial[0]
pos_opcao_x1 = posInicial[1]





// Atributos da função Desenhar menu
//indexselecao,---> definido em step ao interagir com teclado
//corTextoSelecao,
//corTexto,
//posInicial,--- array com posInicial[ posição em X , posição em Y] onde surgira o menu
//espacamento, espacamento entre os textos
//arrayMenu, array definindo quais opções o menu tem
//halign=fa_center, alinhamento do texto na horizontal
//valign=fa_center alinhamento do texto na vertical
//offsetX desloca o menu naa pos X
//offsetY desloca o mennu na pos Y

switch(EstadoMenu){
	case Menu.PRINCIPAL:
	   
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuPrincipal)
		break;
	case Menu.JOGAR:
		
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuJogar)
		break;
	case Menu.CONFIGURACOES:
	
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuConfiguracoes)
		break;
	case Menu.RESOLUCOES:
		
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuOpcoesResolucoes)
		break;
	case Menu.VOLUME:
	
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuOpcoesVolume)
		break;
	case Menu.GRAFICOS:
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuGraficos)
		break;
		
	case Menu.IDIOMA:
		
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,opcoesMenuIdioma)
		break;
	case Menu.CREDITOS:
		DesenharMenu(index,c_yellow,make_color_rgb(250,250,250),posInicial,espacamento,Creditos)
		break;
	

}

draw_set_font(-1)