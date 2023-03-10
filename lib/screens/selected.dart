import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/provider.dart';
class Selected extends StatefulWidget {
  const Selected({super.key, this.obj});
  final Object? obj;

  @override
  State<Selected> createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  Object get obj=>obj;
  TextEditingController country = TextEditingController();
  TextEditingController capital = TextEditingController();
  // Providers x=Providers();

  @override

  Widget build(BuildContext context) {
     dynamic obj=ModalRoute.of(context)?.settings.arguments; 
    shoDialogue(){
    return showDialog<void>(context: context, builder: (context) {
      return Consumer<Providers>(
        builder: (context, value, child) => 
         AlertDialog(
          title: Text('Edit'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: country,
                  decoration: InputDecoration(
                    hintText: "Edit Country",
                    label: Text("Country")
                  ),
                ), 
                TextField(
                  controller: capital,
                  decoration: InputDecoration(
                    hintText: "Edit Capital",
                    label: Text("Capital")
                  ),
                ),
      
                ElevatedButton(onPressed: (){
                  print(obj);
                  value.savingChanges(obj, country.text, capital.text);
                  Navigator.pop(context);
                }, child: Text('save'))
              ],
            ),
          )
        ),
      );
    });

       
    
  }

    // dynamic index=ModalRoute.of(context)?.settings.arguments; // catching Args
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 198, 12),
            leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
      body: Consumer<Providers>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(obj['country']),
              Text(obj['capital']),
              Image(image: AssetImage(obj['flag']),height: 40,width: 40,),
                ],
              ),
              ElevatedButton(onPressed: (){
                shoDialogue();
                print('tapped');
              }, child: Text('Edit')),
              // Text(value.arr[index]['country']+'-'),
              // Text(value.arr[index]['capital']),
              // Image(image: AssetImage(value.arr[index]['flag']),height: 40,width: 40,),

            ],
        );
      })
    );
  }
}