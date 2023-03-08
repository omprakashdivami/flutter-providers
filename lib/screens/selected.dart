import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/provider.dart';
class Selected extends StatefulWidget {
  const Selected({super.key, this.index});
  final int? index;

  @override
  State<Selected> createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  int get index=>index;
  @override
  Widget build(BuildContext context) {
    dynamic index=ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Consumer<Providers>(builder: (context, value, child) {
        return Column(
            children: [
              Text(value.arr[index]['country']+'-'),
              Text(value.arr[index]['capital']),
              Image(image: AssetImage(value.arr[index]['flag']),height: 40,width: 40,)
            ],
        );
      })
    );
  }
}