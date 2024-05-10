#include <DHT.h>
#include "MQ135.h"

#define DHTPIN 15            
#define DHTTYPE DHT22       

#define MQ135_ANALOG_PIN 33 
#define MQ2_ANALOG_PIN 34

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

  float rzero = gasSensor.getRZero();
    float ppm = gasSensor.getPPM();

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" °C");


  Serial.print("MQ-135 PPM: ");
  Serial.println(ppm);

  const float goodThreshold = 400.0;
  const float moderateThreshold = 1000.0;
  const float poorThreshold = 2000.0;
  const float veryPoorThreshold = 5000.0;

  if (ppm <= goodThreshold) {
    Serial.println("Air quality: Good");
  } else if (ppm <= moderateThreshold) {
    Serial.println("Air quality: Moderate");
  } else if (ppm <= poorThreshold) {
    Serial.println("Air quality: Poor");
  } else if (ppm <= veryPoorThreshold) {
    Serial.println("Air quality: Very Poor");
  } else {
    Serial.println("Air quality: Hazardous");
  }

}
