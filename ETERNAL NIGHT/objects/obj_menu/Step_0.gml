
switch(EstadoMenu){
	case Menu.PRINCIPAL:
		opc_max = array_length(opcoesMenuPrincipal);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 0:
					EstadoMenu =  Menu.JOGAR;
					opc_max =0
					break;
				case 1:
					EstadoMenu =  Menu.CONFIGURACOES;
					opc_max =0
					break;
				case 2:
					EstadoMenu =  Menu.CREDITOS;
					opc_max =0
					break;
				case 3:
					EstadoMenu =  Menu.SAIR;
					opc_max =0
					game_end()
					break;
			}
		}
		
		break;
	
	case Menu.JOGAR:
		opc_max = array_length(opcoesMenuJogar);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 0:
					// inicia um novo game
					room_goto(Room1)
					break;
				case 1:
					// carrega o jogo
					break;
				case 2:
					//Voltar ao menu Principal
					EstadoMenu =  Menu.PRINCIPAL;
					opc_max =0
					break;
				
			}
		}
		break;
	
	case Menu.CONFIGURACOES:
		opc_max = array_length(opcoesMenuConfiguracoes);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 0:
					EstadoMenu =  Menu.RESOLUCOES;
					opc_max =0
					break;
				case 1:
					EstadoMenu =  Menu.VOLUME;
					opc_max =0
					break;
				case 2:
					EstadoMenu =  Menu.GRAFICOS;
					opc_max =0
					break;
				case 3:
					//Voltar ao menu Principal
					EstadoMenu =  Menu.IDIOMA;
					opc_max =0
					break;
				case 4:
					//Voltar ao menu Principal
					EstadoMenu =  Menu.PRINCIPAL;
					opc_max =0
					break;
				
			}
		}
		break;
	case Menu.RESOLUCOES:
		show_debug_message(string(array_length(opcoesResolucao)-1))
		opc_max = array_length(opcoesMenuOpcoesResolucoes);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 1:
					//OK
					EstadoMenu =  Menu.PRINCIPAL;
					//Salva configuração
					opc_max =0
					break;
				case 2:
					//Cancelar
					EstadoMenu =  Menu.CONFIGURACOES;
					// volta para menu configuração
					opc_max =0
					break;

			}
		}
		if (keyboard_check_pressed(vk_left)){
			
			if(index == 0){
				if (indexResolucao <=0){
					indexResolucao = array_length(opcoesResolucao)-1
				}else{
					indexResolucao--
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesResolucoes[0] = opcoesResolucao[indexResolucao]
				show_debug_message(opcoesMenuOpcoesResolucoes[0])
			}
		}
		if (keyboard_check_pressed(vk_right) or mouse_check_button_pressed(mb_left)){
			if(index == 0){
				if (indexResolucao >=array_length(opcoesResolucao)-1){
					indexResolucao = 0
				}else{
					indexResolucao++
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesResolucoes[0] = opcoesResolucao[indexResolucao]
				
				show_debug_message("direita "+opcoesMenuOpcoesResolucoes[0])
			}
		}
		break;
	case Menu.VOLUME:
		opc_max = array_length(opcoesMenuOpcoesVolume);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 2:
					//OK
					EstadoMenu =  Menu.PRINCIPAL;
					//Salva configuração
					opc_max =0
					break;
				case 3:
					//Cancelar
					EstadoMenu =  Menu.CONFIGURACOES;
					// volta para menu configuração
					opc_max =0
					break;

			}
		}
		if (keyboard_check_pressed(vk_left)){
			if(index == 0){
				if (volumeSFX <=0){
					volumeSFX = 0
				}else{
					volumeSFX--
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesVolume[0] = "SFX : < "+string(volumeSFX)+" >"
			}
			if(index == 1){
				if (volumeMusica <=0){
					volumeMusica = 0
				}else{
					volumeMusica--
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesVolume[1] = "MUSICA: < "+string(volumeMusica)+" >"
			}
		}
		if (keyboard_check_pressed(vk_right)){
			if(index == 0){
				if (volumeSFX >=100){
					volumeSFX = 100
				}else{
					volumeSFX++
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesVolume[0] = "SFX : < "+string(volumeSFX)+" >"
			}
			if(index == 1){
				if (volumeMusica >=100){
					volumeMusica = 100
				}else{
					volumeMusica++
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuOpcoesVolume[1] = "MUSICA: < "+string(volumeMusica)+" >"
			}
		}
		break;
		
		
	case Menu.GRAFICOS:
		opc_max = array_length(opcoesMenuGraficos);
		if (keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)){
			switch (index){
				case 1:
					//OK
					EstadoMenu =  Menu.PRINCIPAL;
					//Salva configuração
					opc_max =0
					break;
				case 2:
					//Cancelar
					EstadoMenu =  Menu.CONFIGURACOES;
					// volta para menu configuração
					opc_max =0
					break;

			}
		}
		if (keyboard_check_pressed(vk_left)){
			if(index == 0){
				if (index_graficos <=0){
					index_graficos = array_length(graficos)-1
				}else{
					index_graficos--
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuGraficos[0] = "QUALIDADE : < "+graficos[index_graficos]+" >"
			}
			
		}
		if (keyboard_check_pressed(vk_right) or mouse_check_button_pressed(mb_left)){
			if(index == 0){
				if (index_graficos >=array_length(graficos)-1){
					index_graficos = 0
				}else{
					index_graficos++
				}
				//controla qual opção vai ser desenhada no draw
				opcoesMenuGraficos[0] = "QUALIDADE : < "+graficos[index_graficos]+" >"
			}
			
		}
		break;
		
	case Menu.CREDITOS:
		if (posInicial[1] >=-1716){
			if !(mouse_check_button(mb_left)){
				posInicial[1]-=1;
			}
			if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape)){
				EstadoMenu = Menu.PRINCIPAL
				posInicial[1] = display_get_height()/2
			}
			if (keyboard_check(vk_left) or keyboard_check(vk_right)){
				posInicial[1]-=5
			}
		}else{
			if (mouse_check_button(mb_left)or keyboard_check_pressed(vk_enter)or keyboard_check_pressed(vk_escape)){
				posInicial[1] = display_get_height()/2
				EstadoMenu=Menu.PRINCIPAL;
				opc_max =0
			}		
		}
		
	break;
}





if (keyboard_check_pressed(vk_down)){
	if (index >= opc_max-1){
		index =0;	
	}else{
		index++;
	}
	
} 
if (keyboard_check_pressed(vk_up)){
	if (index <= 0){
		index = opc_max-1;	
	}else{
		index--;
	}

}





