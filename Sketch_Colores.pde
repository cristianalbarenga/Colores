PColor c;

void setup(){
    size(600,600);
    background(255);
    smooth();
    noStroke();
    
    c= new PColor();    
    c.Esquemas(int(random(36)),0,0);

}

//////////////////

void draw(){
   int lad=150;     
   
   fill(c.RYB_color);
   rect(0,0, lad,lad*2);
   
   fill(c.RGB_color);
   rect(0,lad*2, lad,lad*2);
  
   for(int i=1;i<5;i++){
       fill(c.RYB_MonoL[i]);
       rect(lad*i,0, lad,lad);
       
       fill(c.RYB_MonoS[i]);
       rect(lad*i,lad, lad,lad);
   
       fill(c.RGB_MonoL[i]);
       rect(lad*i,lad*2, lad,lad);
       
       fill(c.RGB_MonoS[i]);
       rect(lad*i,lad*3, lad,lad);
 }
}
