/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// definição de comandos
btn_esquerda = (keyboard_check(ord("A")) or keyboard_check(vk_left))
btn_direita = (keyboard_check(ord("D")) or keyboard_check(vk_right))
btn_pulo = keyboard_check_pressed(vk_space)
btn_ataque = (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_lcontrol))
btn_dash = mouse_check_button_pressed(mb_right)




aplica_coyoteTimer()





//Maquina de estado
switch(estado){
	
	case "idle":{
		//mudando a animação
		if !apos_golpe {
			sprite_index = spr_player_Idle
		}else{
			sprite_index = spr_player_Idle2
		}
		
		
		//comportamento
		mov_lateral();
		aplica_gravidade();
		//condições de saida do estado
		
		if !(btn_esquerda && btn_direita){
			if(btn_direita || btn_esquerda ){
				muda_estado("correndo")
				
			}
		}
		if!(no_chao()){
			muda_estado("caindo")	
			
		}
		
		if(coyoteTimer > 0 && btn_pulo ){		
			muda_estado("pulando")
			 
		}
		
		
		if btn_ataque{
			muda_estado("ataque01")
		}
		
		
		if btn_dash && dashTimer >0{
			muda_estado("dash")
		}
		
		break;	
	}
	
	case "correndo":{
		//mudando a animação
		sprite_index = spr_player_correndo;
		
		//comportamento
		mov_lateral();
		
		
		//condiçãode saida do estado
		
		
		if (abs(velH)< .1){
			muda_estado("idle")
			
		}else if!(no_chao()){
			muda_estado("caindo")	
		}
		if(coyoteTimer >0 && btn_pulo ){
			muda_estado("pulando")
		}
		
		if btn_dash && dashTimer >0{
			muda_estado("dash")
		}
		
		if btn_ataque{
			muda_estado("ataque_aereo")
			velV-= 2
		}
		
		
		break;	
	}
	
	case "pulando":{
		//mudando a animação
		
		
		if(velV !=0){
			sprite_index = spr_player_pulo;
			if(image_index > image_number-1){
				image_index= image_number-1
			}
		}
		
		
		//comportamento
		mov_lateral();
		aplica_gravidade();
		
		//condiçãode saida do estado
		if(double_jump==true &&  btn_pulo ){
			muda_estado("double_jump")
	
		}
		
		
		if (velV <= max_velV &&  image_index > image_number-1){
			muda_estado("caindo")
		}
		
		if btn_ataque{
			muda_estado("ataque_aereo")
			
		}
		
		if btn_dash && dashTimer >0{
			muda_estado("dash")
		}
		
		
		break;	
	}
	
	case "caindo":{
		//mudando a animação
		if(velV > 0){
			sprite_index = spr_player_caindo;
			
		}
				
		
		//comportamento
		mov_lateral();
		aplica_gravidade();
		
		//condiçãode saida do estado
		if (no_chao() ){
			muda_estado("idle")
		}
		
		if(double_jump==false && coyoteTimer > 0 && btn_pulo ){
			muda_estado("pulando")	
		}
		
		if btn_ataque{
			muda_estado("ataque_aereo")
		}
		
		if btn_dash && dashTimer >0{
			muda_estado("dash")
		}

		break;	
	}
	
	case "double_jump":{
		
		//mudando a animação
		sprite_index = spr_player_doublejump;

				
		
		//comportamento
		mov_lateral();
		aplica_gravidade();
		

		//condiçãode saida do estado
		if (no_chao() ){
			muda_estado("idle")
		}
		
		if btn_ataque{
			muda_estado("ataque_aereo")
		}
		if btn_dash && dashTimer >0{
			muda_estado("dash")
		}

		break;	
	}
	
	case "ataque01":{
		
		//mudando a animação
		sprite_index = spr_player_ataque01;

				
		
		//comportamento
		
		criaHitBox(1,x-(-18*image_xscale),y-21,"Instances",obj_colisao_espada)
		
		
		
		
		if btn_ataque{
			combo_ataque = 2
			
			
		}
		
	
		
		//condiçãode saida do estado
		if (image_index >= image_number-1){			
			switch combo_ataque {
				case 1:{
					muda_estado("idle")
					combo_ataque = 1;
					break;
				}
				case 2:{
					muda_estado("ataque02")
					break;
				}	
			}
		}
		break;	
	}
	
	case "ataque02":{
		
		//mudando a animação
		sprite_index = spr_player_ataque02;

				
		
		//comportamento
		criaHitBox(2,x-(-18*image_xscale),y-21,"Instances",obj_colisao_espada)
		
		
		if btn_ataque{
			combo_ataque = 3
		}
		
	
		

		//condiçãode saida do estado
		if (image_index >= image_number-1){			
			switch combo_ataque {
				case 2:{
					muda_estado("idle")
					combo_ataque = 1;
					break;
				}
				case 3:{
					muda_estado("ataque03")
					break;
				}	
			}
		}


		break;	
	}
	
	case "ataque03":{
		
		//mudando a animação
		sprite_index = spr_player_ataque03;


		//comportamento
		criaHitBox(2,x-(-18*image_xscale),y-21,"Instances",obj_colisao_espada)

		//condiçãode saida do estado
		if (image_index >= image_number-1){			
			muda_estado("idle")
			combo_ataque = 1
		}
		break;	
	}
	
	case "ataque_aereo":{
		
		//mudando a animação
		
		sprite_index = spr_player_ataque_aereo;
		
				
		
		//comportamento
		aplica_gravidade();
		
		
		criaHitBox(1,x-(-18*image_xscale),y-21,"Instances",obj_colisao_espada)
		
		//condiçãode saida do estado
		if no_chao(){			
			muda_estado("idle")
		}else{
			if image_index >= image_number-1{
				muda_estado("caindo")
			}
		
		}
		
		
		break;	
	}
		
	case "dash":{
		
		//mudando a animação
		sprite_index = spr_player_dash;
		if image_index >= image_number-1{
			image_index = image_number-1
		}
		//
		
				
		
		//comportamento
		aplica_gravidade();		
		dash_direcao = image_xscale
		max_dash()
		
		//condiçãode saida do estado

		if dashTimer==0 {
			muda_estado("idle")
		}
		
		
		break;	
	}
	
	case "durmindo":{
		 
		//mudando a animação
		sprite_index = spr_player_Durmindo;
		image_index = 0

		//comportamento
		

		//condiçãode saida do estado
		if (btn_ataque||keyboard_check_pressed(ord("D"))){			
			muda_estado("acordado")
		}
	
		break;	
	}
	
	case "acordado":{
		
		//mudando a animação
		sprite_index = spr_player_acordou;
		image_index = 0

		//comportamento
		

		//condiçãode saida do estado
		if (btn_ataque||keyboard_check_pressed(ord("D"))){			
			muda_estado("sair da cama")
		}
	
		break;	
	}
	
		case "sair da cama":{
		//muda a animação
		sprite_index = spr_player_levantouCama;
		

		//comportamento
		

		//condiçãode saida do estado
		if (image_index >= image_number-1){
			muda_estado("idle")
		}
	
		break;	
	}
	

}

//var dir =point_direction(x,y,x+btn_direita-btn_esquerda,y)


//show_debug_message(string(dashTimer))