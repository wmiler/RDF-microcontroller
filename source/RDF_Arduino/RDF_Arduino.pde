/*
  RDF_Arduino
 
  This program interfaces the Ramsey DDF1 to APRS and the Arduino
  Really, really initial messy code :)

  This code will most likely end up in some form of GNU copyleft, haven't 
  decided which yet
  
 */

// Globals
  char bearing[] = "";
  char timestamp[] = "";
  char gpsfix[] = "";

// If 1, this is a fixed location and/or does not have a GPS attached
#define FIXEDGPS 1

// This stations lat/long/altitude
#define LAT 3503.66N //dddmm.mmN|S
#define LONG 08215.53W //dddmm.mmW|E
#define ALT 1076 // feet

void setup() {
  Serial.begin(9600);
  
// Setup pins, * means its task is set for this project
  pinMode(0, INPUT);   // Serial RX
  pinMode(1, OUTPUT);  // Serial TX
  pinMode(2, INPUT);   // MeasureDopplerFreq *
  pinMode(3, INPUT);   // PWM or External Interrupt
  pinMode(4, INPUT);   // RSSI *
  pinMode(5, OUTPUT);  // PulseTrain1 *
  pinMode(6, INPUT);   // PWM
  pinMode(7, OUTPUT);  // PulseTrain2 *
  pinMode(8, OUTPUT);  // PulseTrain3 *
  pinMode(9, INPUT);   // PulseTrain4 *
  pinMode(10, INPUT);  // PWM or SPI (SS)
  pinMode(11, INPUT);  // PWM or SPI (MOSI)
  pinMode(12, INPUT);  // SPI (MISO)
  pinMode(13, INPUT);  // SPI (SCK) or onboard LED

// A0 through A5 are analog pins

}

// Forgot that only one antenna can be on at at time.

// Step  5  7  8  9
//    1  1  0  0  0
//    2  0  1  0  0
//    3  0  0  1  0
//    4  0  0  0  1

void antennaPulseTrain(int speed) {
   int i=1;
   int h=HIGH;
   int j=LOW;
 
   for(i=1; i<5; i++) {
     delayMicroseconds(speed); // Set our wait speed here in us
     if (i=1) {
       digitalWrite(5, HIGH); // Antenna 1 on
       digitalWrite(7, LOW);
       digitalWrite(8, LOW);
       digitalWrite(9, LOW);
     } else if (i=2) {
       digitalWrite(7, HIGH); // Antenna 2 on
       digitalWrite(5, LOW);
       digitalWrite(8, LOW);
       digitalWrite(9, LOW);
     } else if (i=3) {
       digitalWrite(8, HIGH); // Antenna 3 on
       digitalWrite(5, LOW);
       digitalWrite(7, LOW);
       digitalWrite(9, LOW);
     } else if (i=4) {
       digitalWrite(9, HIGH); // Antenna 4 on
       digitalWrite(5, LOW);
       digitalWrite(7, LOW);
       digitalWrite(8, LOW);
     } else {
       digitalWrite(5, LOW); // All antennas off
       digitalWrite(7, LOW);
       digitalWrite(8, LOW);
       digitalWrite(9, LOW);
   } // end if
  } // end for
}

// Measure what frequency our Doppler tone is at (pin 2)
long measureDopplerFreq() {
  long freq = 0;
  for(int i=0; i<4096; i++) freq+= 500000/pulseIn(2, HIGH, 250000);
  return freq / 4096;
}

//Find the zero crossing point
int zeroCross() {
  
}

// Find bearing to fox
int FoxBearing() {
  

}

// Turn a bearing into an APRS direction
char* APRSdirection(int foxbearing) {
  if (22 > foxbearing < 68) {
    return "1"; // NE
  } else if (69 > foxbearing < 113) { 
    return "2"; // E
  } else if (114 > foxbearing < 157) { 
    return "3"; // SE
  } else if (158 > foxbearing < 202) { 
    return "4"; // S
  } else if (203 > foxbearing < 247) { 
    return "5"; // SW
  } else if (248 > foxbearing < 292) { 
    return "6"; // W
  } else if (292 > foxbearing < 337) { 
    return "7"; // NW
  } else if (337 > foxbearing < 22) { 
    return "8"; // N
  }
}

// GPS fix, heading, timestamp
void GPSread() {
  
}

// Connect pin 4 to RSSI output from receiver, scan for logic LOW, wait 200us for pulse
char* RSSIread() {
  int rssiDur;
  
  rssiDur = pulseIn(4, LOW, 200); 

  return (char*)rssiDur;
}

char CreateAPRSMsg() {
  // Holds message to be sent to radio (DFS prefix, rssi, height, gain, dir, bearing, timestamp, gpsfix
  char* APRSmsg[] = {"DFS", RSSIread(), "0", "3", APRSdirection((int)bearing), " ", bearing};
  
}

// Handoff to the TinyTraker4 to beacon message out
void APRSbeacon(char* message) {
  
}

// Main loop
void loop() {
  
  // Ignore below, just placeholders for now
  int sensorValue = digitalRead(4);
  Serial.println(sensorValue, DEC);
}



