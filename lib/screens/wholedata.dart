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
Providers list=Providers();
List searchedArr=list.arr;
class _WholedataState extends State<Wholedata> {
  TextEditingController search=TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Consumer<Providers>(
          builder: (context, providerObj, child) {
            return Column(
              children: [ TextField(
                controller: search,
                onChanged: (value) {
                 setState(() {
                  List temp=[];
                    print(value);
                  for(int i=0; i<providerObj.arr.length; i++){
                    if(providerObj.arr[i]['country'].toString().contains(value) || providerObj.arr[i]['capital'].toString().contains(value)){
                      temp.add(providerObj.arr[i]);
                    }
                  }
                searchedArr=temp;
                 });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26))

                ),
              ),
                Container(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                    itemCount: searchedArr.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                                var obj=searchedArr[index];
                                print(obj);
                              Navigator.pushNamed(context, '/selected',
                                  arguments: obj); 
                            },
                            title: Text  (

                                '${searchedArr[index]['country']} - ${searchedArr[index]['capital']}'),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
