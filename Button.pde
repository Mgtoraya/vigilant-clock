class Button {
  PVector location;
  float button_base;
  float button_height;
  color col, b_col;
  int b_stroke;
  String txt;

  Button(int x, int y, int b, int h, String i_txt, color i_col) {
    location = new PVector(x, y);
    button_base = b;
    button_height = h;
    b_col = i_col;
    col = b_col;
    b_stroke = 6;
    txt = i_txt;
  }

  boolean check_pressed() {
    if (mouseX > location.x && 
      mouseX < location.x + button_base && 
      mouseY > location.y && 
      mouseY < location.y + button_height) {
      col = color(72, 61, 139);    

      if (mousePressed) {
        b_stroke = 3;
        return true;
      } else {
        b_stroke = 6;
      }
    } else {
      col = b_col;
      return false;
    }
    return false;
  }

  void display() {
    fill(col);
    stroke(255);
    strokeWeight(b_stroke);
    rectMode(CORNER);
    rect(location.x, location.y, button_base, button_height, 3);

    fill(255);
    if (txt.length() < 5) {
      textSize(36);
    } else if (txt.length() > 4 && txt.length() < 8) {
      textSize(24);
    } else textSize(18);
    float text_x = location.x + button_base/2;
    float text_y = location.y + button_height/2;
    textAlign(CENTER, CENTER);
    text(txt, text_x, text_y);
  }
}
