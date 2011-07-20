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
  pinMode(2, INPUT);
}

// Connect digitalPin to RSSI output from receiver, scan for logic LOW, wait 200us for pulse
int RSSIread () {
  int digitalPin = 2;
  int rssiDur;
  
  rssiDur = pulseIn(digitalPin, LOW, 200); 

  return rssiDur;
}

char CreateAPRSMsg() { //rssi, dir, bearing, timestamp, gpsfix) {
  // Holds message to be sent to radio (DFS prefix, rssi, height, gain, dir, bearing, timestamp, gpsfix
  char* APRSmsg[] = {"DFS", rssi, "0", "3", dir, " ", bearing};
  
}

void loop() {
  int sensorValue = digitalRead(2);
  Serial.println(sensorValue, DEC);
}



