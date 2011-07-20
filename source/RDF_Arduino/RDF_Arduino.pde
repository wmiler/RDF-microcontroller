/*
  RDF_Arduino
 
  This program interfaces the Ramsey DDF1 to APRS and the Arduino
  Really, really initial messy code :)

  This code will most likely end up in some form of GNU copyleft, haven't 
  decided which yet
  
 */

// Globals
  char dir[] = "";
  char bearing[] = "";
  char timestamp[] = "";
  char gpsfix[] = "";

#include <Stepper.h>

const int stepsPerRevolution = 4;

// initialize the stepper library on pins 7 and 8:
Stepper antennaPT(stepsPerRevolution, 7, 8);            


void setup() {
  Serial.begin(9600);
  antennaPT.setSpeed(30000); // 30,000 rpm initial
  
// Setup pins, * means its task is set for this project
  pinMode(0, INPUT);   // Serial RX
  pinMode(1, OUTPUT);  // Serial TX
  pinMode(2, INPUT);   // MeasureDopplerFreq *
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
// Antenna control is via pins 7 & 8 see logic table
// Step  7   8
//    1  0   1
//    2  1   1
//    3  1   0
//    4  0   0

void antennaPulseTrain(int speed) {
   antennaPT.setSpeed(speed);
   antennaPT.step(stepsPerRevolution);
}

// Measure what frequency our Doppler tone is on pin 2
long measureDopplerFreq() {
  long freq = 0;
  for(int i=0; i<4096; i++) freq+= 500000/pulseIn(2, HIGH, 250000);
  return freq / 4096;
}

// Find bearing to fox
int FoxBearing() {
  

}

// Turn a bearing into an APRS direction
int APRSdirection() {
  
}

// Connect pin 4 to RSSI output from receiver, scan for logic LOW, wait 200us for pulse
char* RSSIread() {
  int rssiDur;
  
  rssiDur = pulseIn(4, LOW, 200); 

  return (char*)rssiDur;
}

char CreateAPRSMsg() {
  // Holds message to be sent to radio (DFS prefix, rssi, height, gain, dir, bearing, timestamp, gpsfix
  char* APRSmsg[] = {"DFS", RSSIread(), "0", "3", dir, " ", bearing};
  
}

// Main loop
void loop() {
  
  // Ignore below, just placeholders for now
  int sensorValue = digitalRead(4);
  Serial.println(sensorValue, DEC);
}



