/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();


vida_max = 10;
vida_atual = vida_max;

max_velH = 3;
max_velV = 6;


mostra_estado=true;



// variaveis de controle coyoteTimer
coyoteTimer= 0;
max_coyoteTimer = 10 ;


//Variaveis de controle doouble jump
double_jump=false;

//variaveis de controle ataque
apos_golpe = false; // controla animação idle apos golpe
combo_ataque = 1;

//variaveis de controle dash

max_dashTimer = 10 // TEMPO DE DASH
dashTimer = max_dashTimer;
dash_forca = 2 // MULTIPLICA DISTANCIA
dash_direcao = 1
dashDistance = 100

estado="durmindo"




function muda_estado(_estado){
	
	image_index =0
	
	switch(_estado){
		case "idle":
		{	

			velH = 0;
			break;
		}
		
		case "pulando":
		{
			coyoteTimer = 0
			mov_pular()
			double_jump=true
			break;
		}
		
		case "double_jump":
		{
			mov_pular()
			break;
		}
		
		case "correndo":
		{
			apos_golpe = false;
			break;
		}
		
		case "caindo":
		{
			apos_golpe = false;
			break;
		}
		
		case "ataque01":
		{
			apos_golpe = true;
			break;
		}
			
		case "ataque02":
		{
			apos_golpe = true;
			break;
		}
			
		case "ataque03":
		{
			apos_golpe = true;
			break;
		}
			
		case "ataque_aereo":
		{
			apos_golpe = true;
			break;
		}
			
		case "dash":
		{	
			alarm[1] = room_speed*2
			mov_dash();
			break;
		}
	
	
	}
	estado= _estado;
	
	
}

function no_chao()
{
	return (place_meeting(x,y+1,obj_bloco)) 
}

function mov_lateral(){
	// movimentação lateral
	velH = (btn_direita-btn_esquerda)*max_velH;
}
	
function mov_pular()
{
	velV -= max_velV;
}

function mov_dash(){
	part_dash = part_system_create(par_dash)
}

function aplica_coyoteTimer()
{
	if no_chao(){
		//reseta coyote timer
		coyoteTimer = max_coyoteTimer;
		double_jump = false
	}

	//inicia contagem do coyote timer 
	if coyoteTimer > 0 {
		coyoteTimer--
	}
}

function aplica_gravidade()
{
	
	//Gravidade
	//no ar
	if !no_chao(){
		if (velV < max_velH*2){
			velV += GRAVIDADE * massa;
		}
	}

}

function max_velocidade_pulo(){
	// aplicado em final step
	if velV < -(max_velV){
			velV = -(max_velV)
		}
}
	
function max_dash(){
	
	if dashTimer > 0{
		if velH <= dashDistance{
			
			var Tempobj = instance_create_layer(x, y, "Instances", obj_part_dash)	
			Tempobj.dir = image_xscale
			Tempobj.b = 255-(dashTimer*20)
			Tempobj.g = 190
			Tempobj.r = 0
			Tempobj.sprite_index =sprite_index
			Tempobj.img = image_index
			velH += dash_direcao*dash_forca
			dashTimer--
		}
	}

}

function criaHitBox(img_index,posx,posy,camada,_objHitBox){
	
	if !instance_exists(_objHitBox){
		if ceil(image_index) == img_index{		
				instance_create_layer(posx,posy,camada,_objHitBox)
			}
	}

}