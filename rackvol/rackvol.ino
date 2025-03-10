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

void setupRelays() {
    Wire.begin(D2, D1);
    Wire.beginTransmission(RELAY_ADDR);
    Wire.write(MCP23017_IODIRA); // IODIRA register
    Wire.write(0x00); // set all of port A to outputs
    Wire.endTransmission();
    Wire.beginTransmission(RELAY_ADDR);
    Wire.write(MCP23017_IODIRB); // IODIRB register
    Wire.write(0x00); // set all of port B to outputs
    Wire.endTransmission();
}

void setRelays(uint16_t value) {
    // relays are pull low active
    value = ~value;

    Wire.beginTransmission(RELAY_ADDR);
    Wire.write(MCP23017_GPIOA);
    Wire.write(value & 0xFF);
    Wire.endTransmission();

    Wire.beginTransmission(RELAY_ADDR);
    Wire.write(MCP23017_GPIOB);
    Wire.write((value >> 8 )& 0xFF);
    Wire.endTransmission();
}


void setup() {
    Serial.begin(9600);

    setupRelays();
    setRelays(0xFFFF);

    delay(2000);
}


void loop() {
    char input[6];
    uint16_t i;

    if (Serial.available() == 0) {
        return;
    }

    Serial.readStringUntil('\n').toCharArray(input, 6);
    i = strtol(input, NULL, 16);
    setRelays(i);
}
