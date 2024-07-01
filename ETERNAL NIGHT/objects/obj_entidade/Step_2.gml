/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//Movimentação e colisão

var _velh = sign(velH);
var _velv = sign(velV);


//Horizontal
repeat(abs(velH)){
	if(place_meeting(x+ _velh,y,obj_bloco)){
		velH=0;
		break;
	}
	
	x += _velh;
}

//Vertical
repeat(abs(velV)){
	if(place_meeting(x,y+ _velv,obj_bloco)){
		velV=0;
		break;
	}
	
	y += _velv;
}

