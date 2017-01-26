void gui() {
control = new ControlP5(this);
PFont Titles = createFont("AndaleMono", 12);
PFont Values = createFont("AndaleMono", 10);

int marginLeft = 10;

//Grupo Navegacion
Group g1 = control.addGroup("Navegacion")
.setLabel("Navegacion")
.setFont(Titles)  
.setColorLabel(color(0))
.setColorBackground(color(255))
.setColorForeground(color(255))
.setBackgroundColor(color(196, 50))
.setHeight(15)
.setBackgroundHeight(175);

//Slider Zoom
control.addSlider("zoom")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 15)
.setSize(250, 15)
.setRange(-1000, 1000)
.setValue(640)
.moveTo(g1);

//Slider RotacionY
control.addSlider("rotacion_Y")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 40)
.setSize(250, 15)
.setRange(-360, 360)
.setValue(-15)
.moveTo(g1);

//Slider RotacionX
control.addSlider("rotacion_X")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 60)
.setSize(250, 15)
.setRange(-360, 360)
.setValue(180)
.moveTo(g1);  

//Slider ejeY
control.addSlider("eje_y")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 85)
.setSize(250, 15)
.setRange(0, 600)
.setValue(300)
.moveTo(g1);   

//Slider ejeX
control.addSlider("eje_x")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 105)
.setSize(250, 15)
.setRange(0, 1000)
.setValue(660)
.moveTo(g1);   

//Button Reset Navigation
control.addButton("Reset")
.setFont(Values)
.setColorLabel(color(0))
.setColorActive(color(190))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setValue(0)
.setPosition(marginLeft, 130)
.setSize(60, 25)
.moveTo(g1);

//Grupo Nube de Puntos
Group g2 = control.addGroup("Nube de Puntos")
.setFont(Titles)
.setColorLabel(color(0))
.setColorBackground(color(255))
.setColorForeground(color(255))
.setBackgroundColor(color(196, 50))
.setHeight(15)
.setBackgroundHeight(110);

//Slider Depth
control.addSlider("depth")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 15)
.setSize(250, 15)
.setRange(400, 3000)
.setValue(2000)
.moveTo(g2);

//Slider Calidad
control.addSlider("calidad")
.setFont(Values)
.setColorLabel(color(255))
.setColorValue(color(0))
.setColorActive(color(255))
.setColorForeground(color(255))
.setColorBackground(color(196))
.setPosition(marginLeft, 35)
.setSize(250, 15)
.setRange(1, 10)
.setNumberOfTickMarks(10)
.setValue(3)
.moveTo(g2);

//Button Reset Nube de Puntos
control.addButton("ResetCloud")
.setFont(Values)
.setLabel("Reset")
.setColorLabel(color(0))
.setColorActive(color(190))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setValue(0)
.setPosition(marginLeft, 65)
.setSize(60, 25)
.moveTo(g2);

//Grupo Salvar Datos
Group g3 = control.addGroup("Salvar Datos")
.setFont(Titles)
.setColorLabel(color(0))
.setColorBackground(color(255))
.setColorForeground(color(255))
.setBackgroundColor(color(196, 50))
.setHeight(15)
.setBackgroundHeight(120);

control.addButton("guardar")
.setLabel("Capturar")
.setFont(Values)
.setColorLabel(color(0))
.setColorActive(color(190))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setPosition(marginLeft, 72)
.setSize(70, 25)
.moveTo(g3);

control.addToggle("toggleTxt")
.setLabel(".Txt")
.setFont(Values)
.setColorLabel(color(255))
.setColorActive(color(50))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setPosition(marginLeft, 15)
.setSize(50, 25)
.setValue(true)
.setMode(ControlP5.SWITCH)
.moveTo(g3);

control.addToggle("toggleCsv")
.setLabel(".Csv")
.setFont(Values)
.setColorLabel(color(255))
.setColorActive(color(50))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setPosition(marginLeft+70, 15)
.setSize(50, 25)
.setValue(true)
.setMode(ControlP5.SWITCH)
.moveTo(g3);

control.addToggle("toggleStl")
.setLabel(".Stl")
.setFont(Values)
.setColorLabel(color(255))
.setColorActive(color(50))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setPosition(marginLeft+140, 15)
.setSize(50, 25)
.setValue(true)
.setMode(ControlP5.SWITCH)
.moveTo(g3);

//Grupo Salir
Group g4 = control.addGroup("General")
.setFont(Titles)
.setColorLabel(color(0))
.setColorBackground(color(255))
.setColorForeground(color(255))
.setBackgroundColor(color(196, 50))
.setHeight(15)
.setBackgroundHeight(40);

control.addButton("salir")
.setFont(Values)
.setColorLabel(color(0))
.setColorActive(color(190))
.setColorForeground(color(255))
.setColorBackground(color(255))
.setPosition(120, 15)
.setSize(70, 30)
.moveTo(g4);

//Interfaz General
interfaz = control.addAccordion("multi")
.setPosition(0, 10)
.setWidth(340)
.addItem(g1)
.addItem(g2)
.addItem(g3)
.addItem(g4);


interfaz.setCollapseMode(Accordion.MULTI);
interfaz.open(0,3);
}

//Reset Navigation
void Reset(float v) {
control.loadProperties(("data/resetNav.json"));
}
//Reset Cloud
void ResetCloud(float v) {
control.loadProperties(("data/resetCloud.json"));
}

//Button WRITE
void guardar(float v) {
fill(255, 50);
rect(0, 0, width, height);
scanning = true;
write = true;
}

//Salir
void salir(float v) {
  exit();
}

//TOGGLE TXT
void toggleTxt(boolean flagTXT) {
  if(flagTXT==true) {
    toggleTXT = true;
    println("On record .txt");
  }
  if(flagTXT==false) {
    toggleTXT = false;
    println("Off record .txt");
  }
}


//TOGGLE CSV
void toggleCsv(boolean flagCSV) {
  if(flagCSV==true) {
    toggleCSV = true;
    println("On record .csv");
  }
  if(flagCSV==false) {
    toggleCSV = false;
    println("Off record .csv");
  }
}

//TOGGLE STL
void toggleStl(boolean flagSTL) {
  if(flagSTL==true) {
    toggleSTL = true;
    println("On record .stl");
  }
  if(flagSTL==false) {
    toggleSTL = false;
    println("Off record .stl");
  }
}
