
enum Menu {
	PRINCIPAL,
	JOGAR,
	CONFIGURACOES,
	RESOLUCOES,
	VOLUME,
	GRAFICOS,
	IDIOMA,
	CREDITOS,
	SAIR
}

EstadoMenu = Menu.PRINCIPAL
opcoesMenuPrincipal = ["JOGAR","CONFIGURAÇÕES","CREDITOS","SAIR"];
opcoesMenuJogar = ["NOVO JOGO", "CARREGAR JOGO","VOLTAR"];
opcoesMenuConfiguracoes = ["OPÇÕES DE RESOLUÇÃO", "OPÇÕES DE VOLUME", "GRAFICOS","IDIOMA","VOLTAR"];


// MENU RESOLUÇÂO
opcoesMenuOpcoesResolucoes = ["MODO JANELA : < 640 x 320 >","SALVAR", "CANCELAR"];
opcoesResolucao = ["MODO JANELA : < 640 x 320 >","MODO JANELA : < 1280 x 640 >", "MODO JANELA : < 1920 x 960 >","FULLSCREEN"];
indexResolucao=0; // Pode ser substituida no save da configuração



opcoesMenuOpcoesVolume =["SFX : < 100 >", "MUSICA: < 100 >", "SALVAR", "CANCELAR"];
volumeSFX=100; // substituir no save da configuração
volumeMusica=100; // substituir no save da configuração


opcoesMenuGraficos= ["QUALIDADE : < ALTA >","SALVAR", "CANCELAR"];
graficos = ["BAIXA", "MÉDIA" , "ALTA"]
index_graficos=3
opcoesMenuIdioma=["IDIOMA = < PORTUGUÊS BR >","SALVAR", "CANCELAR"];


Creditos = ["Título do Jogo",
"                      ",
"Desenvolvimento",
"                      ",
"Diretor de Projeto:",
"Nome do Diretor",
"                      ",
"Programadores:",
"Nome do Programador 1",
"Nome do Programador 2",
"Nome do Programador 3",
"                      ",
"Design",
"Nome do Designer de Nível 1",
"Nome do Designer de Nível 2",
"Design de Interface:",
"                     ",

"Compositores:",
"Nome do Compositor 1",
"Nome do Compositor 2",
"                      ",

"Roteiristas",
"Nome do Roteiristas 1",
"Nome do Roteiristas 2",
"                      ",

"Ferramentas Utilizadas",
"Engine: Nome da Engine (GameMaker Studio)",
"Software de Arte: Nome do Software de Arte (Photoshop, Illustrator, etc.)",
"Software de Áudio: Nome do Software de Áudio (Audacity, FL Studio, etc.)",
"                      ",
"Patrocinadores e Parceiros",
"Nome do Patrocinador/Parceiro 1",
"Nome do Patrocinador/Parceiro 2",

"                      ",
"Jogadores",
"A todos os jogadores que tornaram este jogo possível, obrigado!",
"                      ",
"                      ",
"                      ",
"                      ",
"                      ",
"VOLTAR AO MENU PRINCIPAL"
]

index=0;
opc_max=0;

posInicial = [window_get_width()/2,window_get_height()/2]
espacamento = 50


//index= 0

function DesenharMenu(indexselecao,corTextoSelecao,corTexto,posInicial,espacamento,arrayMenu,halign=fa_center,valign=fa_center,offsetX=0,offsetY=0){
	for(var i=0; i < array_length(arrayMenu);i++){
			var x1 = posInicial[0];
			var y1 = posInicial[1];
			var y2 = y1 + espacamento*i;
			var mx = device_mouse_x_to_gui(0);
			var my = device_mouse_y_to_gui(0);
			var larguraString = string_width(arrayMenu[i]);
			var alturaString = string_height(arrayMenu[i]);
			
			if (point_in_rectangle(mx,my,x1 - larguraString/2 ,y2 - alturaString/2,x1 + larguraString/2 ,y2 + alturaString/2)){
				draw_set_color(corTextoSelecao)
				index = i
			}else{
				
				if (indexselecao == i){
					draw_set_color(corTextoSelecao)
				}else{
					draw_set_color(corTexto)
				}
			}
					
			draw_set_halign(halign)
			draw_set_valign(valign)
			draw_text(posInicial[0]+offsetX,posInicial[1]+offsetY+(i*espacamento),arrayMenu[i])	
	
		}
}