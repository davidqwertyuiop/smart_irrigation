//#include <Firebase_ESP_Client.h>
//#include <WiFi.h>
//#include <addons/TokenHelper.h>
//#include <DHT.h>  // Include the DHT sensor library

// Define DHT sensor parameters
#define DHTPIN 15
#define DHTTYPE DHT11
#define LED_PIN_CONTROL1 13
#define SOIL_MOISTURE_PIN 34

// Define WiFi credentials
#define WIFI_SSID "yourWifissid"
#define WIFI_PASSWORD "Password"

// Define Firebase API Key, Project ID, and user credentials
#define API_KEY "your API key"
#define FIREBASE_PROJECT_ID "firebase project ID"
#define USER_EMAIL "Your  Username on Firebase Authentication"
#define USER_PASSWORD "Password"


// Define Firebase Data object, Firebase authentication, and configuration
//FirebaseData fbdo;
//FirebaseAuth auth;
//FirebaseConfig config;

// Initialize the DHT sensor/
//DHT dht(DHTPIN, DHTTYPE);

void setup() {
  // Initialize serial communication for debugging
//  Serial.begin(115200);

  // Initialize the DHT sensor
 // dht.begin();

  // Connect to Wi-Fi
 // WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  //Serial.print("Connecting to Wi-Fi");
 // while (WiFi.status() != WL_CONNECTED) {
  //  Serial.print(".");
   // delay(300);
  }
 // Serial.println();
//  Serial.print("Connected with IP: ");
//  Serial.println(WiFi.localIP());
//  Serial.println();

  // Print Firebase client version
  //Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  // Assign the API key
  //config.api_key = API_KEY;

  // Assign the user sign-in credentials
 // auth.user.email = USER_EMAIL;
//  auth.user.password = USER_PASSWORD;

  // Assign the callback function for the long-running token generation task
//  config.token_status_callback = tokenStatusCallback;  // see addons/TokenHelper.h

  // Begin Firebase with configuration and authentication
//  Firebase.begin(&config, &auth);

  // Reconnect to Wi-Fi if necessary
//  Firebase.reconnectWiFi(true);
//  pinMode(LED_PIN_CONTROL1, OUTPUT);
//}

void loop() {
  // Define the path to the Firestore document
//  String documentPath = "EspDatas/DHT11";

  // Create a FirebaseJson object for storing data
 // FirebaseJson content;

  // Read temperature and humidity from the DHT sensor
//  float temperature = dht.readTemperature();
//  float humidity = dht.readHumidity();
//  int soilMoistureValue = analogRead(SOIL_MOISTURE_PIN);
//  float soilMoisture = map(soilMoistureValue, 4095, 0, 0, 100);


  // Print temperature and humidity values
//  Serial.println(temperature);
//  Serial.println(humidity);
//  Serial.println(soilMoisture);

  // Check if the values are valid (not NaN)
//  if (!isnan(temperature) && !isnan(humidity)) {
    // Set the 'Temperature' and 'Humidity' fields in the FirebaseJson object
 //   content.set("fields/Temperature/stringValue", String(temperature, 2));
 //   content.set("fields/Humidity/stringValue", String(humidity, 2));
//     delay(10000);
  //  content.set("fields/SoilMoisture/stringValue", String(soilMoisture, 2));
  //  content.set("fields/LED_PIN_CONTROL1/booleanValue", false); // Corrected the key name to booleanValue

//    Serial.print("Update/Add DHT Data... ");

    // Use the patchDocument method to update the Temperature and Humidity Firestore document
//    if (Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw(), 
//    "Temperature,Humidity,SoilMoisture,LED_PIN_CONTROL1,")) {
 //     Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
//    } else {
//      Serial.println(fbdo.errorReason());
    }
//  } else {
//    Serial.println("Failed to read DHT data.");
 // }

  // Delay before the next reading
  
//}
