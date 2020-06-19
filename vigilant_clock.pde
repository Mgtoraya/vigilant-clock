Clock clock;
String[] button_labels = {"Stop", "Math", "Code", "Meditation", "Lecture"};
Button[] buttons = new Button[button_labels.length];
String[] activities = new String[button_labels.length - 1]; 

void setup() {
  size(500, 1000);
  initialize();
}

void draw() {
  background(0);

  clock.stop_activity(buttons[0]);
  for (int i = 1; i < buttons.length; i++) {
    clock.fill_activity(buttons[i]);
  }
  clock.update();
  clock.display();

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

void initialize() {
  for (int i = 1; i < button_labels.length; i++) {
    activities[i] = button_labels[i];
  }
  clock = new Clock(activities);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(width-120, 500+(i*100), 100, 60, button_labels[i], 
      color(30, 144, 255));
  }
}
