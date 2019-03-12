class PColor{
  /*-------------------------------------
   ************* VARIABLES *************
  -------------------------------------*/
  int rangoColores= 360; //36 colores / 360 pixeles
  
  int col; // color principal
  int hue; //valor del color
  int sat; //saturacion
    
  PImage paletaRYB; //variable de carga de imagen
  PImage paletaRGB; //variable de carga de imagen

  //--- RYB ---//
  color RYB_color; //color principal
  color[] RYB_Triad= new color[3]; //esquema triadico
  color[] RYB_Compl= new color[2]; //esquema complementario
  color[] RYB_CoDiv= new color[3]; //esquema complementario dividido
  color[] RYB_Analo= new color[3]; //esquema analogo
  color[] RYB_Tetra= new color[4]; //esquema Tetraedrico
  color[] RYB_MonoL= new color[5]; //equema monocromatico Luces
  color[] RYB_MonoS= new color[5]; //equema monocromatico Sombras
  
  //--- RGB ---//
  color RGB_color; //color principal
  color[] RGB_Triad= new color[3]; //esquema triadico
  color[] RGB_Compl= new color[2]; //esquema complementario
  color[] RGB_CoDiv= new color[3]; //esquema complementario dividido
  color[] RGB_Analo= new color[3]; //esquema analogo
  color[] RGB_Tetra= new color[4]; //esquema Tetraedrico
  color[] RGB_MonoS= new color[5]; //equema monocromatico Luces
  color[] RGB_MonoL= new color[5]; //equema monocromatico Soombras
 /*---------------------------------------
   ************* CONSTRUCTOR *************   
  ---------------------------------------*/ 
  PColor(){
     paletaRYB= loadImage("RYB_Paleta.png");   // carga lista de colores
     paletaRGB= loadImage("RGB_Paleta.png"); 
  }
  
  /*---------------------------------------
   ************** FUNCIONES **************
  ---------------------------------------*/
  //---- COLOR BASE ----//
  //calculo de color principal y esquemas
  void Esquemas(int col_princ,int valor,int saturacion){
    col= (col_princ *10 + 5) % rangoColores ;   //color seleccionado
    hue= 45 + 10*(valor%5);   //valor: positivos=claro / negativos=oscuro
    sat= 90* (saturacion%5);  //saturacion 0 a 4 
    
    //.... COLOR PRINCIPAL  
    RYB_color= paletaRYB.get( col , hue+sat);
    RGB_color= paletaRGB.get( col , hue+sat);
  
    //.... TRIADICO
    for(int i=1;i<3;i++){ 
      RYB_Triad[i]= paletaRYB.get( (col + i*120) % rangoColores, hue+sat); 
      RGB_Triad[i]= paletaRGB.get( (col + i*120) % rangoColores, hue+sat); 
    }
     
    //.... COMPLEMENTARIO
    for(int i=1;i<2;i++){
      RYB_Compl[i]= paletaRYB.get( (col + i *180) % rangoColores, hue+sat);
      RGB_Compl[i]= paletaRGB.get( (col + i *180) % rangoColores, hue+sat);
    }    
     
    //.... COMPLEMENTARIO DIVIDIDO
    RYB_CoDiv[1]= paletaRYB.get( (col+150) % rangoColores, hue+sat);
    RYB_CoDiv[2]= paletaRYB.get( (col+210) % rangoColores, hue+sat);
     
    RGB_CoDiv[1]= paletaRGB.get( (col+150) % rangoColores, hue+sat);
    RGB_CoDiv[2]= paletaRGB.get( (col+210) % rangoColores, hue+sat);

    //.... ANALOGO
    RYB_Analo[1]= paletaRYB.get( (col+30) % rangoColores, hue+sat);
    RYB_Analo[2]= paletaRYB.get( (col+330) % rangoColores, hue+sat);
    
    RGB_Analo[1]= paletaRGB.get( (col+30) % rangoColores, hue+sat);
    RGB_Analo[2]= paletaRGB.get( (col+330) % rangoColores, hue+sat);      
  
    //.... TETRAEDRICO
    for(int i=1;i<4;i++){
        RYB_Tetra[i]= paletaRYB.get((col + i*90) % rangoColores, hue+sat);
        RGB_Tetra[i]= paletaRGB.get((col + i*90) % rangoColores, hue+sat);
    }
      
    //.... MONOCROMATICO
    for(int i=1;i<5;i++){
        //Luces
        RYB_MonoL[i]= paletaRYB.get(col % rangoColores, hue+i*10+sat);
        RGB_MonoL[i]= paletaRYB.get(col % rangoColores, hue+i*10+sat);
        //Sombras
        RYB_MonoS[i]= paletaRYB.get(col % rangoColores, hue-i*10+sat);
        RGB_MonoS[i]= paletaRYB.get(col % rangoColores, hue-i*10+sat);
     }    
  
  }//------------------//
  
}//____ FIN DE CLASS
