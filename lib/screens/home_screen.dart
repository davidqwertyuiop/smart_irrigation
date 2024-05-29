// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/language.dart';
import 'package:flutter_application_2/classes/language_constants.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/sensor.dart';
import 'package:flutter_application_2/widgets/my_sensor_card.dart';






class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key, });
  
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
    
  }
  


class _HomeScreenState extends State<HomeScreen> {
  List<double>? tempList;
  List<double>? rhList;
  List<double>? soilList;
  static String collectionName = "EspDatas";
  final sensorRef = FirebaseFirestore.instance.collection(collectionName)
      .withConverter<Sensor>(fromFirestore: (snapshots, _) => Sensor.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:kBackgroundColor,
      title: Text(translation(context).smartIrrigation, style: const TextStyle(color: Colors.white),),
      actions: <Widget>[
        Padding(padding: const EdgeInsets.all(5.0),
        child: DropdownButton<Language>(
          underline: const SizedBox(width: 5,), icon: const Icon(Icons.language,color: Colors.white,),
        items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(e.flag,
                                    style: const TextStyle(fontSize: 30)),
                                Text(e.name),],),)).toList(),
        onChanged: (Language? language) 
        async{if(language !=null){
          Locale _locale = await setLocale(language.languageCode);
          MyApp.setLocale(context, _locale);
        }  },),)
      ]),
      body:   StreamBuilder<QuerySnapshot<Sensor>>(
      stream: sensorRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;

        if (tempList == null) {
          tempList = List.filled(5, data.docs.first.data().temperature,
              growable: true);
        } else {
          tempList!.add(data.docs.first.data().temperature);
          tempList!.removeAt(0);
        }

        if (rhList == null) {
          rhList =
              List.filled(5, data.docs.first.data().humidity, growable: true);
        } else {
          rhList!.add(data.docs.first.data().humidity);
          rhList!.removeAt(0);
        }

        if (soilList == null) {
          soilList = List.filled(5, data.docs.first.data().soilMoisture, growable: true);
        } else {
         soilList!.add(data.docs.first.data().soilMoisture);
         soilList!.removeAt(0);
        }

        final bool ledState = data.docs.first.data().ledState;

 
      
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 30),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                MySensorCard(
                                value: data.docs.first.data().humidity,
                                unit: '%',
                                name: translation(context).humidity,
                                assetImage: const AssetImage(
                                  
                                  'assets/images/humidity_icon.png',
                                ),
                                trendData: rhList!,
                                linePoint: Colors.blue,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MySensorCard(
                                value: data.docs.first.data().temperature,
                                unit: '\'C',
                                name: translation(context).temperature,
                                assetImage: const AssetImage(
                                  'assets/images/temperature_icon.png',
                                ),
                                trendData: tempList!,
                                linePoint: Colors.redAccent,
                              ),
                              const SizedBox(height: 20),
                              MySensorCard(
                                value: data.docs.first.data().temperature,
                                unit: '%',
                                name: translation(context).soilMoisture,
                                assetImage: const AssetImage(
                                  'assets/images/SoilMoistures.png',
                                ),
                                trendData: soilList!,
                                linePoint: Colors.green,
                              ),
                              const SizedBox(height: 20),
                              SwitchListTile(value: ledState, 
                              title: Text (ledState? translation(context).irrigationstarted : translation(context).irrigationoff, style: const TextStyle(color: CupertinoColors.extraLightBackgroundGray),),
                              onChanged: (bool value) async{await sensorRef
                                          .doc(data.docs.first.id)
                                          .update({
                                        'LED_PIN_CONTROL1': !ledState,
                                      }); 
                                      },
                                      ),
                              ],
                          ),
                        ),
                      ],
                    ),
                  );
  }),
                  );
            
  }}

     
    
  
