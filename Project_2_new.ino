#include <Firebase_ESP_Client.h>
#include <WiFi.h>
#include <addons/TokenHelper.h>
#include <ArduinoJson.h>
#include <DHT.h>  // Include the DHT sensor library

// Define DHT sensor parameters
#define DHTPIN 15
#define DHTTYPE DHT11
#define LED_PIN_CONTROL1 13
#define LED_PIN_CONTROL2 12
#define LED_PIN_CONTROL3 14
#define LED_PIN_CONTROL4 27
#define SOIL_MOISTURE_PIN 34

// Define WiFi credentials
#define WIFI_SSID "s 61E2"
#define WIFI_PASSWORD "hdau44433"

// Define Firebase API Key, Project ID, and user credentials
#define API_KEY "AIzaSyD24mv_Mz01Qa9s6RmRafN8U8NV5xd_OpE"
#define FIREBASE_PROJECT_ID "esp32-1b942"
#define USER_EMAIL "ooluwasijibomi2406@gmail.com"
#define USER_PASSWORD "Oreoluwa@1234"

// Define Firebase Data object, Firebase authentication, and configuration
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Initialize the DHT sensor
DHT dht(DHTPIN, DHTTYPE);

void setup() {
  // Initialize serial communication for debugging
  Serial.begin(115200);

  // Initialize the DHT sensor
  dht.begin();

  // Connect to Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  // Print Firebase client version
  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  // Assign the API key
  config.api_key = API_KEY;

  // Assign the user sign-in credentials
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  // Assign the callback function for the long-running token generation task
  config.token_status_callback = tokenStatusCallback;  // see addons/TokenHelper.h

  // Begin Firebase with configuration and authentication
  Firebase.begin(&config, &auth);

  // Reconnect to Wi-Fi if necessary
  Firebase.reconnectWiFi(true);
  pinMode(LED_PIN_CONTROL1, OUTPUT);
  pinMode(LED_PIN_CONTROL2, OUTPUT);
  pinMode(LED_PIN_CONTROL3, OUTPUT);
  pinMode(LED_PIN_CONTROL4, OUTPUT);
}

void loop() {
  // Define the path to the Firestore document
  String documentPath = "EspDatas/DHT11";

  // Create a FirebaseJson object for storing data
  FirebaseJson content;

  // Read temperature and humidity from the DHT sensor
  float temperature = 20;
  float humidity = 50;
  int soilMoistureValue = 89;
  float soilMoisture = 28;

  // Print temperature, humidity, and soil moisture values
  Serial.println(temperature);
  Serial.println(humidity);
  Serial.println(soilMoisture);

  // Check if the values are valid (not NaN)
  if (!isnan(temperature) && !isnan(humidity)) {
    // Set the 'Temperature', 'Humidity', and 'SoilMoisture' fields in the FirebaseJson object
    content.set("fields/Temperature/stringValue", String(temperature, 2));
    content.set("fields/Humidity/stringValue", String(humidity, 2));
    content.set("fields/SoilMoisture/stringValue", String(soilMoisture, 2));
    
    // Use the patchDocument method to update the Firestore document
    if (Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw(),
    "Temperature,Humidity,SoilMoisture")) {
      Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
      StaticJsonDocument<1024> doc;
      DeserializationError error = deserializeJson(doc, fbdo.payload().c_str());

      if (!error) {
        // Extract the value of "Temperature"
        const char* temperature = doc["fields"]["Temperature"]["stringValue"];
        const char* moisture = doc["fields"]["SoilMoisture"]["stringValue"];
        const char* actuator1 = doc["fields"]["LED_PIN_CONTROL1"]["stringValue"];
        const char* actuator2 = doc["fields"]["LED_PIN_CONTROL2"]["stringValue"];
        const char* actuator3 = doc["fields"]["LED_PIN_CONTROL3"]["stringValue"];
        const char* actuator4 = doc["fields"]["LED_PIN_CONTROL4"]["stringValue"];
        Serial.print("Temperature: ");
        Serial.println(String(temperature));
        Serial.print("Moisture: ");
        Serial.println(String(moisture));
        Serial.print("LED 1: ");
        Serial.println(String(actuator1));
        Serial.print("LED 2: ");
        Serial.println(String(actuator2));
        if(String(actuator1) == "true"){
           digitalWrite(LED_PIN_CONTROL1, LOW);
        }else{
          digitalWrite(LED_PIN_CONTROL1, HIGH);
        }
        if(String(actuator2) == "true"){
           digitalWrite(LED_PIN_CONTROL2, LOW);
        }else{
          digitalWrite(LED_PIN_CONTROL2, HIGH);
        }
        if(String(actuator3) == "true"){
           digitalWrite(LED_PIN_CONTROL3, LOW);
        }else{
          digitalWrite(LED_PIN_CONTROL3, HIGH);
        }
        if(String(actuator4) == "true"){
           digitalWrite(LED_PIN_CONTROL4, LOW);
        }else{
          digitalWrite(LED_PIN_CONTROL4, HIGH);
        }
      } else {
        Serial.print("Deserialization failed: ");
        Serial.println(error.c_str());
      }
    } else {
      Serial.println(fbdo.errorReason());
    }
  } else {
    Serial.println("Failed to read DHT data.");
  }

  // Check the state of the LEDs from Firestore
  documentPath = "EspDatas/DHT11";
  Serial.print("Get entire collection... ");
  if (Firebase.Firestore.getDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), "")) {
    Serial.println("ok");
  }

  delay(2000);
}