#include <Wire.h>

#define RELAY_ADDR 0x20
#define DISPLAY_ADDR 0x00
#define MOTOR_ADDR 0x00
#define BUTTONS_ADDR 0x00


#define MCP23017_IODIRA 0x00
#define MCP23017_IPOLA 0x02
#define MCP23017_GPINTENA 0x04
#define MCP23017_DEFVALA 0x06
#define MCP23017_INTCONA 0x08
#define MCP23017_IOCONA 0x0A
#define MCP23017_GPPUA 0x0C
#define MCP23017_INTFA 0x0E
#define MCP23017_INTCAPA 0x10
#define MCP23017_GPIOA 0x12
#define MCP23017_OLATA 0x14


#define MCP23017_IODIRB 0x01
#define MCP23017_IPOLB 0x03
#define MCP23017_GPINTENB 0x05
#define MCP23017_DEFVALB 0x07
#define MCP23017_INTCONB 0x09
#define MCP23017_IOCONB 0x0B
#define MCP23017_GPPUB 0x0D
#define MCP23017_INTFB 0x0F
#define MCP23017_INTCAPB 0x11
#define MCP23017_GPIOB 0x13
#define MCP23017_OLATB 0x15

#define MCP23017_INT_ERR 255

  
void setup() {  
  Wire.begin(D1, D2);
  Wire.beginTransmission(RELAY_ADDR);
  Wire.write(MCP23017_IODIRA); // IODIRA register
  Wire.write(0x00); // set all of port A to outputs
  Wire.write(MCP23017_IODIRB); // IODIRB register
  Wire.write(0x00); // set all of port B to outputs
  Wire.endTransmission();
}


// flip the pin #0 up and down

void loop() {
  delay(100);

  Wire.beginTransmission(RELAY_ADDR);
  Wire.write(MCP23017_GPIOA); // address port A
  Wire.write(0x10);  // value to send
  Wire.write(MCP23017_GPIOB); // address port B
  Wire.write(0x10);  // value to send
  Wire.endTransmission();

  delay(100);

  Wire.beginTransmission(RELAY_ADDR);
  Wire.write(MCP23017_GPIOA); // address port A
  Wire.write(0x01);  // value to send
  Wire.write(MCP23017_GPIOB); // address port B
  Wire.write(0x01);  // value to send
  Wire.endTransmission();
 
}
