class sen { 
  float a, b, c;
  ten suiten = null;

  //ax + by = c

  sen(float _a, float _b, float _c) {
    a = _a;
    b = _b;
    c = _c;
  }

  sen(ten _a, ten _b) {
    a = _a.x-_b.x;
    b = _a.y-_b.y;
    c = (
      +_a.x*_a.x+_a.y*_a.y
      -_b.x*_b.x-_b.y*_b.y
      )/2;
    suiten = new ten(
      (_a.x+_b.x)/2, (_a.y+_b.y)/2
      );
  }

  void display() {
    if (a != 0) {
      float x1 = (c - b * 0)/a;
      float x2 = (c - b * height)/a;
      line(x1, 0, x2, height);
    } else if (b != 0) {
      float y1 = c/b;
      float y2 = y1;
      line(0, y1, width, y2);
    }
  }
}

class ten {
  float x, y;
  sen[] parent = {null, null};

  ten(float _x, float _y) {
    x = _x;
    y = _y;
  }

  ten(float _x, float _y, sen _a, sen _b) {
    x = _x;
    y = _y;
    parent[0] = _a;
    parent[1] = _b;
  }

  void display() {
    ellipse(x, y, 5, 5);
  }
}

ten[] others = new ten[100];
ten 
  ten1 = new ten(0, 0), 
  ten2 = new ten(0, 0);

void setup() {
  size(400, 400);

  for (int i = 0; i < others.length; i++) {
    others[i] = new ten(random(0, width), random(0, height));
  }

  fill(0);
}

void draw() {
  background(255);

  if (mousePressed) {
    ten2.x = mouseX;
    ten2.y = mouseY;
  }

  ten1.x = mouseX;
  ten1.y = mouseY;

  sen kijun = new sen(ten1, ten2);

  float hoge = kijun.a * ten1.x + kijun.b * ten1.y - kijun.c ;

  for (int i = 0; i < others.length; i++) {
    ten ten3 = others[i];
    float fuga = kijun.a * ten3.x + kijun.b * ten3.y - kijun.c ;

    if (fuga>0&hoge>0 | fuga<0&hoge<0) {
      fill(255, 0, 0);
    } else if (fuga<0&hoge>0 | fuga>0&hoge<0) {
      fill(0, 0, 255);
    } else {
      fill(0);
    }

    ten3.display();
  }

  fill(255, 0, 0);
  ten1.display();
  fill(0, 0, 255);
  ten2.display();

  kijun.display();
}