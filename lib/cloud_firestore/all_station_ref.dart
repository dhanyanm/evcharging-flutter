
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_ui/model/city_model.dart';

Future<List<CityModel>> getCities() async{
  var cities = new List<CityModel>.empty(growable: true);
  var cityRef= FirebaseFirestore.instance.collection('stations');
  var snapshot = await cityRef.get();
  snapshot.docs.forEach((element){
    cities.add(CityModel.fromJson(element.data()));
  });
  return cities;
}