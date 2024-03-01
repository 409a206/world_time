import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    try{
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch(e){
      print('caught following error when fetching data : $e');
    }
      print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
            ],
          ),
      ),
    );
  }
}
