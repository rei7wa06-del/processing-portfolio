float mx = 50,my = 50;  //月の座標
ArrayList<Spark> firework = new ArrayList<Spark>();  //花火用

void setup(){
  size(400,400);
  background(0);
}

void draw(){
  fill(255);
  moon();  //moon関数呼び出し
  
  firework();
  for(int i = firework.size() -1; i >= 0; i--){ 
    Spark s = firework.get(i);
    s.update();  //Spark型のupdate関数呼び出し
    s.show();    //Spark型のshow関数呼び出し
    if(s.life < 0) firework.remove(i);
  }
}

void moon(){
  fill(255,240,50);
  ellipse(mx,my,50,50);
  fill(0);
  noStroke();
  ellipse(mx+15,my,50,50);  //三日月
}

void firework(){
  fill(0,30);
  rect(0,0,width,height);
}

void mousePressed(){
  float fireworkX = mouseX;
  float fireworkY = height - 100;
  for (int i = 0; i < 100; i++){
    firework.add(new Spark(fireworkX,fireworkY)); 
  }
}

class Spark{
  float x,y,sx,sy,life;
  color c;
  Spark(float x,float y){
    this.x = x; this.y = y;
    float angle = random(TWO_PI); //範囲が円周率２倍までのランダムな角度
    float speed = random(0.5,3);
    sx = cos(angle)*speed;
    sy = sin(angle)*speed;
    life = 255;
    c = color(random(150,255),random(150,200),random(150,255));
  }
  void update(){
    x += sx;
    y += sy;
    sy += 0.02;
    life -= 3;
  }
  void show(){
    fill(c,life);
    ellipse(x,y,5,5);
  }
}
