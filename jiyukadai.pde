float mx = 50,my = 50;  //月の座標
ArrayList<Spark> firework = new ArrayList<Spark>();  //花火用

void setup(){
  size(400,400);
  background(0);
}

void draw(){
  fill(255);
  moon();  //三日月を描く
  
  firework();
  for(int i = firework.size() -1; i >= 0; i--){ //iがfirework.size()-1から始まりiが０以上の間1ずつ減らす
    Spark s = firework.get(i);
    s.update();  
    s.show();    
    if(s.life < 0) firework.remove(i);
  }
}

void moon(){
  fill(255,240,50);  //月の本体(黄色い丸)
  ellipse(mx,my,50,50);
  fill(0);           //三日月を作るための黒い丸
  noStroke();
  ellipse(mx+15,my,50,50);
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



