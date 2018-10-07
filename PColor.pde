
class PColor{
  /*-------------------------------------
   ************* VARIABLES *************
  -------------------------------------*/
  int cant_Col= 36; //cantidad de colores
  color[] colores; //array de colores

  //arrays de esquemas
  color[] ETriadico= new color[3];
  color[] EComplementario= new color[2];
  color[] EComplDividido= new color[3];

 /*---------------------------------------
   ************* CONSTRUCTOR *************   
  ---------------------------------------*/ 
  PColor(){
     colorMode(HSB,360,100,100); //modo de color
     colores=new color[cant_Col]; //array circulo cromatico
  }
  
  /*---------------------------------------
   ************** FUNCIONES **************
  ---------------------------------------*/
  //------ COLORES RGB ------//
  //define matriz de colores aditivo
  void modo_rgb(){
    float dist=360/cant_Col; //distancia de colores
    for(int i=0;i<cant_Col;i++){  
         colores[i]=color(dist*i,100,100); //define arrayde colores
    }
  }//------------------------//

  //------ COLORES RYB ------//
  /*define matriz de colores sustractivo
   se eligieron manualmente utilzando hexa*/
  void modo_ryb(){
    colores[0]=color(#f52c13);  //rojo
    colores[1]=color(#f8381a);
    colores[2]=color(#f94316);
    colores[3]=color(#fb4d11);
    colores[4]=color(#fc580d);
    colores[5]=color(#fe6208);
    colores[6]=color(#fc6d0a);  //naranja
    colores[7]=color(#fd8003);
    colores[8]=color(#fc9403);
    colores[9]=color(#faa702);
    colores[10]=color(#fabe0e);
    colores[11]=color(#f9d619);
    colores[12]=color(#f9ed25); //amarillo
    colores[13]=color(#cfe424);
    colores[14]=color(#a4da24);
    colores[15]=color(#7ad123);
    colores[16]=color(#51cc2f);
    colores[17]=color(#29c63a);
    colores[18]=color(#00c144);
    colores[19]=color(#00ae56);
    colores[20]=color(#009b65);
    colores[21]=color(#008875);
    colores[22]=color(#007585);
    colores[23]=color(#006395);
    colores[24]=color(#0050a5);  //azul
    colores[25]=color(#1745a3);
    colores[26]=color(#2e3ba2);
    colores[27]=color(#4530a0);
    colores[28]=color(#5c259e);
    colores[29]=color(#741b9c);
    colores[30]=color(#8a139a); //violeta
    colores[31]=color(#9d1585);
    colores[32]=color(#ae1a71);
    colores[33]=color(#c01f5c);
    colores[34]=color(#d22448);
    colores[35]=color(#e42933);    
  }//------------------------//

  //--- ESQUEMAS DE COLOR ---//

  //--- TRIADICO ---//
  //calculo esuqema triadico
  void Triadico(int princ){
    int paso= cant_Col/3; //salto de color a color
    for(int i=0;i<3;i++){
      ETriadico[i]= colores[(paso * i + princ)%36];  //define los colores      
    } 
  }//---------------------//
  
  //--- COMPLEMENTARIO ---//
  //calculo esquema complementario
  void Complementario(int princ){
    int paso= cant_Col/2; //salto de color a color
    for(int i=0;i<2;i++){
      EComplementario[i]= colores[(paso * i + princ)%36];  //define los colores      
    }    
  }//------------------------//
  
  //--- COMPLEMENTARIO DIVIDIDO ---//
  //calculo esquema complementario dividido
  void ComplDividido(int princ){
    int paso=3;//(p%5)+1;
    EComplDividido[0]= colores[princ%36];  //color principal      
    EComplDividido[1]= colores[((princ+18)+paso)%36];
    EComplDividido[2]= colores[((princ+18)-paso)%36];
  }
  //------------------------//
    
}//____ FIN DE CLASS