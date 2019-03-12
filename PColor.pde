class PColor{
  /*-------------------------------------
   ************* VARIABLES *************
  -------------------------------------*/
  int rangoColores= 360; //36 colores / 360 pixeles
  
  PImage paletaRYB; //variable de carga de imagen
  PImage paletaRGB; //variable de carga de imagen

  //--- RYB ---//

  color[] ColRYB_Triad= new color[3]; //esquema triadico
  color[] ColRYB_Compl= new color[2]; //esquema complementario
  color[] ColRYB_CoDiv= new color[3]; //esquema complementario dividido
  color[] ColRYB_Analo= new color[3]; //esquema analogo
  color[] ColRYB_Tetra= new color[4]; //esquema Tetraedrico
  color[] ColRYB_Mono= new color[9]; //equema monocromatico
  
  //--- RGB ---//
  color[] ColRGB_Triad= new color[3]; //esquema triadico
  color[] ColRGB_Compl= new color[2]; //esquema complementario
  color[] ColRGB_CoDiv= new color[3]; //esquema complementario dividido
  color[] ColRGB_Analo= new color[3]; //esquema analogo
  color[] ColRGB_Tetra= new color[4]; //esquema Tetraedrico
  color[] ColRGB_Mono= new color[9]; //equema monocromatico
  
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
  //--- COLOR UNICO RYB---//
  color ColRYB(int col_princ,int valor,int saturacion){
    int col= col_princ *10 + 5; // color seleccionado
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    // color
    color c= paletaRYB.get( col % 360, hue+sat);
    return c;
  }//---------------------//
  
  //--- COLOR UNICO RGB ---//
  color ColRGB(int col_princ,int valor,int saturacion){
    int col= col_princ *10 + 5; // color seleccionado
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    // color
    color c= paletaRGB.get( col % 360, hue+sat);
    return c;
  }//---------------------//
  
  //--- ESQUEMAS DE COLOR ---//
  //--- TRIADICO ---//
  //calculo esuqema triadico
  void Esq_Triad(int col_princ,int valor,int saturacion){
    int col= col_princ *10 + 5; // color seleccionado
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema
    for(int i=0;i<3;i++){ 
      ColRYB_Triad[i]= paletaRYB.get( (col + i*120) % rangoColores, hue+sat); 
      ColRGB_Triad[i]= paletaRGB.get( (col + i*120) % rangoColores, hue+sat); 
    }
  }//---------------------//
  
  //--- COMPLEMENTARIO ---//
  //calculo esquema complementario
  void Esq_Compl(int col_princ,int valor,int saturacion){
    int c= col_princ *10 + 5;
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema
    for(int i=0;i<2;i++){
      ColRYB_Compl[i]= paletaRYB.get( (c + i *180) % rangoColores, hue+sat);
      ColRGB_Compl[i]= paletaRGB.get( (c + i *180) % rangoColores, hue+sat);
    }    
  }//------------------------//
  
  //--- COMPLEMENTARIO DIVIDIDO ---//
  //calculo esquema complementario dividido
  void Esq_CoDiv(int col_princ,int valor,int saturacion){
    int c= col_princ *10 + 5;
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema    
    ColRYB_CoDiv[0]= paletaRYB.get( c % rangoColores, hue+sat);
    ColRYB_CoDiv[1]= paletaRYB.get( (c+150) % rangoColores, hue+sat);
    ColRYB_CoDiv[2]= paletaRYB.get( (c+210) % rangoColores, hue+sat);
    
    ColRGB_CoDiv[0]= paletaRGB.get( c % rangoColores, hue+sat);
    ColRGB_CoDiv[1]= paletaRGB.get( (c+150) % rangoColores, hue+sat);
    ColRGB_CoDiv[2]= paletaRGB.get( (c+210) % rangoColores, hue+sat);
  }//------------------------//
    
  //-------- ANALOGO --------//
  //calculo esquema analogo
  void Esq_Analo(int col_princ,int valor,int saturacion){
    int c= col_princ *10 + 5;
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema    
    ColRYB_Analo[0]= paletaRYB.get( c % rangoColores, hue+sat);
    ColRYB_Analo[1]= paletaRYB.get( (c+30) % rangoColores, hue+sat);
    ColRYB_Analo[2]= paletaRYB.get( (c+330) % rangoColores, hue+sat);
    
    ColRGB_Analo[0]= paletaRGB.get( c % rangoColores, hue+sat);
    ColRGB_Analo[1]= paletaRGB.get( (c+30) % rangoColores, hue+sat);
    ColRGB_Analo[2]= paletaRGB.get( (c+330) % rangoColores, hue+sat);      
  }//------------------------//
    
  //-------- TETRAEDRICO --------//
  //calculo esquema tetraedrico    
  void Esq_Tetra(int col_princ,int valor,int saturacion){
    int c= col_princ *10 + 5;
    int hue= 45 + 10*(valor%5); // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema  
    for(int i=0;i<4;i++){
      ColRYB_Tetra[i]= paletaRYB.get((c + i*90) % rangoColores, hue+sat);
      ColRGB_Tetra[i]= paletaRGB.get((c + i*90) % rangoColores, hue+sat);
    }      
  }//------------------------//
    
  //----- MONOCROMATICO -----//
  void Esq_Mono(int col_princ,int saturacion){
    int c= col_princ *10 + 5;
    int hue= 45 ; // valor: positivos=claro / negativos=oscuro
    int sat= 90* (saturacion%5);// saturacion 0 a 4 
    //calculo equema    
      ColRYB_Mono[0]= paletaRYB.get(c % rangoColores, hue +sat);
      ColRGB_Mono[0]= paletaRGB.get(c % rangoColores, hue +sat);
        
    for(int i=1;i<5;i++){
      ColRYB_Mono[i]= paletaRYB.get(c % rangoColores, hue+i*10+sat);
    }
    
    for(int i=1;i<5;i++){
      ColRYB_Mono[i+4]= paletaRYB.get(c % rangoColores, hue-i*10+sat);
    }
  
  }
}//____ FIN DE CLASS
