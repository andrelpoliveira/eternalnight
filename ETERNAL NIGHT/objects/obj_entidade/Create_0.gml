


vida_max = 1;  // o maximo de vida
vida_atual=vida_max; // controla o quanto de vida tem o personagem

velH = 0; //velocidade horizontal
velV = 0;//velocidade vertical
max_velH = 1; // velocidade maxima horizontal 
max_velV = 1; // velocidade maxima vertical 

massa = 1; // define o pesso do personagem no game se cai mais rapido ou mais lento é só reescrever no create do personagem com valor desejado
ataque = 1; 


xscale = 1; // variavel controla o a direção que olha

mostra_estado=false;


// Está em String pois pode ser usado em muitos outros personagens se fosse enum ficaria fixo
// atribuir estados em minusculo para não confllitar e atenção com os nomes
estado = "idle"; 