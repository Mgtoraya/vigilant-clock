class Clock {
  int hours, minutes, seconds;
  boolean filling = false;
  int start_hour, final_hour;
  int start_minute, final_minute;
  int start_second, final_second;
  float d;
  String[] activities; 

  Clock(String[] temp_activities) {
    activities = temp_activities;
  }

  void update() {
    hours = hour();
    minutes = minute();
    seconds = second();
  }

  void fill_activity(Button button) {
    if (button.check_pressed()) {
      filling = true;

      // Calculate time
      start_hour = hour();
      start_minute = minute();
      start_second = second();
    }

    if (filling) {
      // Display activity
      fill(200, 0, 0);
      textAlign(CORNER);
      textSize(36);
      text("Doing now: "+ button.txt, 100, 550);

      // Calculate time
      final_hour = hour();
      final_minute = minute();
      final_second = second();

      float time_active = ((final_hour * 60) + (final_minute * 60) + final_second) - ((start_hour * 60) + (start_minute * 60) + start_second);

      pushMatrix();
      translate(width/2, 300);

      // Filling hours, minutes and seconds areas
      noStroke();
      rotate(PI / 12 * start_hour);
      fill(0, 200, 0);
      arc(0, 0, 120, 120, 0, (PI / 60) * (time_active / 60 / 60));
      println(time_active);

      popMatrix();
    }
  }

  void stop_activity(Button button) {
    if (button.check_pressed()) {
      filling = false;

      // Calculate time
      final_hour = hour();
      final_minute = minute();
      final_second = second();
    }
  }

  void display() {
    // Display time
    d = dist(width/2, 300, mouseX, mouseY);
    if (d < 190) {
      fill(255);
      textAlign(CORNER);
      textSize(36);
      text(hours + " : " + minutes + " : " + seconds, 150, 80);
      strokeWeight(8);
    }

    pushMatrix();
    translate(width/2, 300);

    // Clock Contour
    if (d < 190) {
      stroke(255);
    } else stroke(72, 61, 139);
    strokeWeight(5);
    noFill();
    ellipseMode(CENTER);
    ellipse(0, 0, 380, 380);

    // Clock hands
    rotate(PI);
    // Seconds
    float rotation = TWO_PI / 60 * seconds; 
    rotate(rotation);
    stroke(255);
    strokeWeight(4);
    line(0, 0, 0, 180);
    // Minutes
    rotation = (TWO_PI / 60 * minutes - rotation);
    rotate(rotation);
    stroke(0, 100, 0);
    strokeWeight(8);
    line(0, 0, 0, 160);
    // Hours
    rotate(TWO_PI / 12 * hours - rotation - TWO_PI / 60 * seconds);
    stroke(100, 0, 0);
    strokeWeight(12);
    line(0, 0, 0, 120);

    popMatrix();
  }
}
