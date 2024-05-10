#include <DHT.h>
#include "MQ135.h"
#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

#define WIFI_SSID "TurkTelekom_TP8DC2_2.4GHz"
#define WIFI_PASSWORD "UaDADAnuNR3u"
#define API_KEY "AIzaSyDPRwvbtTPWoZoMuZiXMwePaJHsbIuwzf8"
#define DATABASE_URL "https://clever-karma-152f3-default-rtdb.europe-west1.firebasedatabase.app/"

#define DHTPIN 15            
#define DHTTYPE DHT22       

#define MQ135_ANALOG_PIN 33 
#define MQ2_ANALOG_PIN 34

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
bool signup= false;
int ldrData=0;
float volatage=0.0;

DHT dht(DHTPIN, DHTTYPE);
MQ135 gasSensor = MQ135(MQ135_ANALOG_PIN);

void setup() {
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID,WIFI_PASSWORD);
  Serial.print("Connecting to Wifi")
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

  int mq2Value = analogRead(MQ2_ANALOG_PIN);

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" °C");


  Serial.print("MQ-135 PPM: ");
  Serial.println(ppm);
  Serial.print("MQ-2 value: ");
  Serial.println(mq2Value);

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

  const int cleanAirValue = 700; 
  const int smokeDetectedValue = 500; 

   if (mq2Value >= cleanAirValue) {
    Serial.println("Smoke: No smoke detected");
  } else if (mq2Value <= smokeDetectedValue) {
    Serial.println("Smoke: Smoke detected!");
  } else {
    Serial.println("Smoke: Possible smoke detected");
  }

}
