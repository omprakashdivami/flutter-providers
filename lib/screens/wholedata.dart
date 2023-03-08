import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/provider.dart';

class Wholedata extends StatefulWidget {
  const Wholedata({super.key});

  @override
  State<Wholedata> createState() => _WholedataState();
}

class _WholedataState extends State<Wholedata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Providers>(builder: (context, providerObj, child) {
        return(
        ListView.builder(
          itemCount: providerObj.arr.length,
           itemBuilder: (BuildContext context, int index) { 
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/selected',arguments: index);
                  },
                  title: Text('${providerObj.arr[index]['country']} - ${providerObj.arr[index]['capital']} '),
                )
              ],
            );
            },)
      );},)
        
      );
    
  }
}