import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActicity(),
    );
  }
}

class HomeActicity extends StatefulWidget {
  const HomeActicity({Key? key}) : super(key: key);

  @override
  State<HomeActicity> createState() => _HomeActicityState();
}

class _HomeActicityState extends State<HomeActicity> {
  MySnackBar(message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  MyAlertDialogue(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Alert !'),
              content: Text('Do you want to delete'),
              actions: [
                TextButton(
                    onPressed: () {
                      MySnackBar('Delete Sucess', context);
                      Navigator.of(context).pop();
                    },
                    child: Text('Yes')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No')),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inventory App'),
        ),
        body: Center(
            child: ElevatedButton(
                child: Text('Click Me'),
                onPressed: () {
                  MyAlertDialogue(context);
                })));
  }
}
