PColor colrs;


//////////////////
void setup(){
    size(600,600);
    background(255);
    smooth();
    colrs= new PColor();    
}

//////////////////
void draw(){
  //background(255);
        
   colrs.Esq_Compl(mouseX/10,0,0);
   
   noStroke();
   fill(colrs.ColRYB_Compl[0]);
   ellipse(width/2,height/2,300,300);
   
   colrs.Esq_Compl(mouseX/10,0,3);
   fill(colrs.ColRYB_Compl[1]);
   ellipse(width/2,height/2,150,150);
 }
