import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';

class Providers extends ChangeNotifier{
  List arr=[
    {'id':1,'country':'India', 'capital':'Delhi','flag':'assets/images/indianflag.png'},
    {'id':2,'country':'Australia', 'capital':'Melborne','flag':'assets/images/Asutralianfalg.png'},
    {'id':3,'country':'Srilanka', 'capital':'Colombo','flag':'assets/images/srilankanflag.png'}
  ];
  savingChanges(dynamic obj  , String country, String capital){
    print("i am");
    print("obj ${obj}");
    print("id ${obj["id"]}");
    
    obj['country']=country;
    obj['capital']=capital;
    arr[obj['id']-1]=obj;
    // arr[obj['id']-1]['country']=country;
    // arr[obj['id']-1]['capital']=capital;
    
    // print(arr[obj['id']-1]['country']);
    // arr[ObjectKey('id')-1]['country']=country;
    // arr[index]['capital']=capital;

  // print("Key: $key, Value: $value");


    print('saved');
    notifyListeners(); //where ever consumers are ussed at entire Application, will re-render by this method
  }
  
}

// {{kzdviu:fsk}} obj.