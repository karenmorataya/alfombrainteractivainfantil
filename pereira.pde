//Pereira, Morataya
int cantidadCelda = 4;
int anchoCuadrado;
int estadoJuego = 0;
int [] pasoJuego = new int [10];
int pasoActual = 2;
int pasoMaximo = 4;
float tiempoPasado = 0;
float tiempoEspera = 1000;
int pasoDibujado = 0;
int dibujandoActual = -1;
void setup() {
  size(400, 700);
  anchoCuadrado = width /cantidadCelda;
  pasoJuego[0]= 2;
  pasoJuego[1]= 5;
  pasoJuego[2]= 15;
  estadoJuego=2;
}

void draw() {
  dibujarApp();
  switch(estadoJuego) {
  case 0: // Sistema Apagado
    break;
  case 1: //Escoger numero
    int random = int (random (0, cantidadCelda*cantidadCelda));
    println("numero escogido "+random);
    pasoJuego [pasoActual] = random;
    pasoActual++;
    pasoDibujado=0;
    break;
  case 2://Mostrar patron
    if (tiempoPasado+tiempoEspera<millis()) {
      println(tiempoPasado+" "+millis()+" "+dibujandoActual);
      tiempoPasado = millis();
      dibujandoActual = pasoJuego [pasoDibujado];
      if(pasoDibujado>pasoActual){
        estadoJuego = 3;
        dibujandoActual = -1;
        println("Cambio de estado");
      }
      
      pasoDibujado ++;
    }
    break;
    case 3: //Esperar que juegue el niño
    break;
  default:             // Default executes if the case labels
    println("None");   // don't match the switch parameter
    break;
  }
}

void mouseClicked() {
  if (mouseY>(height/5)*4 && mouseX<(width/2)) {
    print("Iniciar juego");
    estadoJuego = 1;
    pasoActual = 0;
  }
  for (int y=0; y<cantidadCelda; y++) {
    if (mouseY<anchoCuadrado*(y+1)) {
      for (int x=0; x<cantidadCelda; x++) {
        if (mouseX<anchoCuadrado*(x+1)) {
          println("X"+x+" Y"+y+" n"+(x+y*cantidadCelda));
          return;
        }
      }
    }
  }
}


void dibujarApp() {
  background(0, 0, 100);
  for (int y=0; y<cantidadCelda; y++) {
    for (int x=0; x<cantidadCelda; x++) {
      fill(50);
      rect((anchoCuadrado)*x, anchoCuadrado*y, anchoCuadrado, anchoCuadrado);
    }
  }
  if (dibujandoActual>=0) {
    int Xtemporal= dibujandoActual % cantidadCelda;
    int Ytemporal= (dibujandoActual-Xtemporal)/cantidadCelda;
    fill(241, 154, 159);
    rect((anchoCuadrado)*Xtemporal, anchoCuadrado*Ytemporal, anchoCuadrado, anchoCuadrado);
  }
  fill(100, 0, 0);
  rect(0, (height/5)*4, width/2, height/5);
  rect(width/2, (height/5)*4, width/2, height/5);
}
