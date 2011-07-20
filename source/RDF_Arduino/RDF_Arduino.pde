/*
  RDF_Arduino
 
  This program interfaces the Ramsey DDF1 to APRS and the Arduino
  Really, really initial messy code :)

  This code will most likely end up in some form of GNU copyleft, haven't 
  decided which yet
  
 */

// Globals
  char rssi[] = "";
  char dir[] = "";
  char bearing[] = "";
  char timestamp[] = "";
  char gpsfix[] = "";

void setup() {
  Serial.begin(9600);
  
// Setup pins, * means its task is set for this project
  pinMode(0, INPUT);   // Serial RX
  pinMode(1, INPUT);   // Serial TX
  pinMode(2, INPUT);   // External Interrupt
  pinMode(3, INPUT);   // PWM or External Interrupt
  pinMode(4, INPUT);   // RSSI *
  pinMode(5, INPUT);   // PWM
  pinMode(6, INPUT);   // PWM
  pinMode(7, OUTPUT);  // PulseTrain1 *
  pinMode(8, OUTPUT);  // PulseTrain2 *
  pinMode(9, INPUT);   // PWM
  pinMode(10, INPUT);  // PWM or SPI (SS)
  pinMode(11, INPUT);  // PWM or SPI (MOSI)
  pinMode(12, INPUT);  // SPI (MISO)
  pinMode(13, INPUT);  // SPI (SCK) or onboard LED

// A0 through A5 are analog pins

}

// Setup the pulse train for turning the antennas on and off
// Antenna control is via pins 7 & 8
int antennaPulseTrain() {
   
}

// Connect digitalPin to RSSI output from receiver, scan for logic LOW, wait 200us for pulse
int RSSIread () {
  int digitalPin = 4;
  int rssiDur;
  
  rssiDur = pulseIn(digitalPin, LOW, 200); 

  return rssiDur;
}

char CreateAPRSMsg() {
  // Holds message to be sent to radio (DFS prefix, rssi, height, gain, dir, bearing, timestamp, gpsfix
  char* APRSmsg[] = {"DFS", rssi, "0", "3", dir, " ", bearing};
  
}

// Main loop
void loop() {
  int sensorValue = digitalRead(4);
  Serial.println(sensorValue, DEC);
}



