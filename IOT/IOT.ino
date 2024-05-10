#include <DHT.h>
#include "MQ135.h"

#define DHTPIN 15  
#define DHTTYPE DHT22       

DHT dht(DHTPIN, DHTTYPE);
MQ135 gasSensor = MQ135(MQ135_ANALOG_PIN);

void setup() {
  Serial.begin(115200);
  dht.begin();
}

void loop() {
  delay(2000); 

  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();

  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }



  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" °C");



}
