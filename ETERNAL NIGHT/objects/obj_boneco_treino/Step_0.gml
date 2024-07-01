/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if vida_atual <= 0{
	vida_atual = vida_max
}



switch(estado){
	case "livre":{
		//comportamento	
		
		
		
		//Condição de saida
		
		if place_meeting(x,y,obj_colisao_espada){
			estado = "hit"
			image_angle-= forca_hit
			vida_atual--
			
		}
		
	break;
	}
	
	case "hit":{
		
		
		
		
		//condição de saida
		if image_angle != angle_inicial{
			if image_angle > angle_inicial+.1{
				image_angle-= angleVel
			}else
			if image_angle < angle_inicial-.1{
				image_angle+= angleVel
			}
		}else {
			
			estado="livre"
		}
		
		
		
	
	break;
	}



}