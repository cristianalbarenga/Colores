PColor esq;

void setup(){
  size(600,600);
  background(255);
  smooth();
  esq= new PColor();
  frameRate(25);  
}
//////////////////
void draw(){
  noStroke();
  background(360);

  esq.modo_rgb();
  
  esq.ComplDividido(mouseY);
  for(int i=0;i<3;i++){
    fill(esq.EComplDividido[i]);
    rect(i*100,100,100,100);
  }
  
  esq.Complementario(mouseY);
  for(int i=0;i<2;i++){
    fill(esq.EComplementario[i]);
    rect(i*100,210,100,100);
  }
  
  esq.Triadico(mouseY);
  for(int i=0;i<3;i++){
    fill(esq.ETriadico[i]);
    rect(i*100,320,100,100);
  }
  
  
}