const int groundpin = 18;             // analog input pin 4 -- ground
const int powerpin = 19;              // analog input pin 5 -- voltage
const int xpin = 3;                   // x-axis of the accelerometer
const int ypin = 2;                   // y-axis
const int zpin = 1;                   // z-axis (only on 3-axis models)

void setup()
{
  Serial.begin(115200);
  
  // If you use the normal 5V and GND pins on the Arduino, you can remove these 
  // lines.
  pinMode(groundpin, OUTPUT);
  pinMode(powerpin, OUTPUT);
  digitalWrite(groundpin, LOW); 
  digitalWrite(powerpin, HIGH);
}

void loop()
{
  Serial.print(analogRead(xpin));
  Serial.print(" ");
  Serial.print(analogRead(ypin));
  Serial.print(" ");
  Serial.print(analogRead(zpin));
  Serial.println();

  delay(10);
}
