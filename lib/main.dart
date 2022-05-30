import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ButtonColor(),
        builder: (context, child) {
          return Column(
            children: [
              Center(
                child: Text('hello'),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ButtonColor>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<ButtonColor>()
                            .changeData(Colors.blueAccent);
                      },
                      child: Text('provider color'),
                      style: ElevatedButton.styleFrom(primary: value.temp));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class ButtonColor with ChangeNotifier {
  Color temp = Colors.red;

  void changeData(Color data) {
    temp = data;
    notifyListeners();
  }
}
